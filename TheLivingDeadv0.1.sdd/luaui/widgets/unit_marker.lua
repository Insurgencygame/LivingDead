local versionNumber = "1.4"

function widget:GetInfo()
	return {
		name      = "Unit Marker",
		desc      = "[v" .. string.format("%s", versionNumber ) .. "] Marks spotted units of interest.",
		author    = "very_bad_soldier",
		date      = "October 21, 2007",
		license   = "GNU GPL v2",
		layer     = 0,
		enabled   = true
	}
end

--[[
Features:
-multiple mod support
-no multiple markers if multiple players use it

Changelog:
1.4: fixed for current engine
1.31: small speedup
1.3: fixed: double markers for one unit 
1.2: added XTA support (thx to manolo_), deactivates older defense range widget (thx to TFC)
1.1: auto-disable when spec
1.0: initial release
--]]
local debug = false --generates debug message

local unitList = {}
--MARKER LIST ------------------------------------
unitList["BA"] = {} --initialize table
unitList["BA"]["armamd"] = { markerText = "Anti Nuke" }
unitList["BA"]["corfmd"] = { markerText = "Anti Nuke" }
unitList["BA"]["armsilo"] = { markerText = "Nuke" }
unitList["BA"]["corsilo"] = { markerText = "Nuke" }

unitList["XTA"] = {} --initialize table
unitList["XTA"]["arm_protector"] = 				{ markerText = "Anti Nuke" }
unitList["XTA"]["core_fortitude_missile_defense"] = 	{ markerText = "Anti Nuke" }
unitList["XTA"]["arm_retaliator"] = 			{ markerText = "Nuke" }
unitList["XTA"]["core_silencer"] = 				{ markerText = "Nuke" }
unitList["XTA"]["arm_stunner"] = 				{ markerText = "Mini-Nuke" }
unitList["XTA"]["core_neutron"] = 				{ markerText = "Mini-Nuke" }
unitList["XTA"]["arm_big_bertha"] = 			{ markerText = "Big Bertha" }
unitList["XTA"]["core_intimidator"] = 			{ markerText = "Intimidator" }
unitList["XTA"]["arm_sentinel"] = 				{ markerText = "HLT" }
unitList["XTA"]["core_gaat_gun"] = 				{ markerText = "HLT" }
unitList["XTA"]["arm_ambusher"] = 				{ markerText = "Pop Up" }
unitList["XTA"]["core_toaster"] = 				{ markerText = "Pop Up" }
unitList["XTA"]["arm_stingray"] = 				{ markerText = "HLT" }
unitList["XTA"]["core_thunderbolt"] = 			{ markerText = "HLT" }
unitList["XTA"]["arm_annihilator"] = 			{ markerText = "Anni" }
unitList["XTA"]["arm_cloakable_fusion_reactor"] = 	{ markerText = "Fusion" }
unitList["XTA"]["arm_vulcan"] = 				{ markerText = "Vulcan" }
unitList["XTA"]["arm_repulsor"] 			= 	{ markerText = "Anti Nuke" }
unitList["XTA"]["core_resistor"] = 				{ markerText = "Anti Nuke" }
unitList["XTA"]["core_cloakable_fusion_power_plant"]= { markerText = "Fusion" }
unitList["XTA"]["core_viper"] = 				{ markerText = "Viper" }
unitList["XTA"]["core_immolator"]			    = { markerText = "Immolator" }
unitList["XTA"]["core_doomsday_machine"] = 		{ markerText = "Doomsday" }
unitList["XTA"]["core_buzzsaw"]			    = { markerText = "Buzzsaw" }
unitList["XTA"]["core_krogoth_gantr"] 	= 		{ markerText = "Krogot Lab" }

unitList["CA"] = {} --initialize table
unitList["CA"]["armamd"] = { markerText = "Anti Nuke" }
unitList["CA"]["corfmd"] = { markerText = "Anti Nuke" }
unitList["CA"]["armsilo"] = { markerText = "Nuke" }
unitList["CA"]["corsilo"] = { markerText = "Nuke" }
--END OF MARKER LIST---------------------------------------

local markerTimePerId = 0.2 --400ms

local myPlayerID
local curModID
local updateInt = 1 --seconds for the ::update loop
local lastTimeUpdate = 0


local markersToSet = {} --this is a todo list filled with marker which have to be set, widget waits before setting them to see if another play tags them before to avoid multitagging
local markersToSetEmpty = true
local knownUnits = {} --all units that have been marked already, so they wont get marked again

--local spGetLocalTeamID	 	= Spring.GetLocalTeamID
local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitPosition     = Spring.GetUnitPosition
local spSendLuaUIMsg    	= Spring.SendLuaUIMsg
local spGetGameSeconds      = Spring.GetGameSeconds
local spMarkerAddPoint      = Spring.MarkerAddPoint
local spIsUnitAllied		= Spring.IsUnitAllied
local spGetMyPlayerID       = Spring.GetMyPlayerID
local spGetPlayerInfo       = Spring.GetPlayerInfo
local spEcho                = Spring.Echo
local spGetPlayerList  		= Spring.GetPlayerList
local spGetPlayerInfo		= Spring.GetPlayerInfo
local spArePlayersAllied	= Spring.ArePlayersAllied
local spGetLocalPlayerID 	= Spring.GetLocalPlayerID
local spGetSpectatingState  = Spring.GetSpectatingState
local upper                 = string.upper
local floor                 = math.floor
local max					= math.max
local min					= math.min


function widget:Initialize()
	myPlayerID = spGetLocalPlayerID() --spGetMyPlayerID() --spGetLocalTeamID()
		
	curModID = upper(Game.modShortName or "")
	
	if ( unitList[curModID] == nil ) then
		spEcho("<Unit Marker> Unsupported Game, shutting down...")
		widgetHandler:RemoveWidget()
		return
	end
end

function widget:Update()
	local timef = spGetGameSeconds()
	local time = floor(timef)
	
	-- update timers once every <updateInt> seconds
	if (time % updateInt == 0 and time ~= lastTimeUpdate) then	
		lastTimeUpdate = time
		--do update stuff:
		
		if ( CheckSpecState() == false ) then
			return false
		end
	end
end

function widget:UnitEnteredLos(unitID, allyTeam)
	if ( spIsUnitAllied( unitID ) ) then
		return
	end

	local udefId = spGetUnitDefID(unitID)
	local udef = UnitDefs[udefId]
	local x, y, z = spGetUnitPosition(unitID)
	
	if (  unitList[curModID] ~= nil ) and (  unitList[curModID][udef.name] ~= nil ) and  ( unitList[curModID][udef.name]["markerText"] ~= nil ) then
		--the unit is in the list -> has to get marked
		if ( knownUnits[unitID] == nil ) or ( knownUnits[unitID] ~= udefId ) then
			--unit wasnt marked already or unit changed
			knownUnits[unitID] = udefId
			setMarkerForUnit( unitID, udef, { x,y,z }  )
		end
	end
end

function setMarkerForUnit( unitId, udef, pos )
	local markerText = unitList[curModID][udef.name]["markerText"]
	
	spSendLuaUIMsg("dfT" .. unitId, "allies")

	markersToSet[unitId] = { time = spGetGameSeconds(), pos = pos, text = markerText }
	
	markersToSetEmpty = false
end

--returns highest ping from all players whos playerid < myPlayerId
function getHighestPing()
	local highPing = 0
	local playerTab = spGetPlayerList()
	for _, p in ipairs( playerTab ) do
		local _, _, _, _, _, ping, _ = spGetPlayerInfo(p)
		if ( spArePlayersAllied( p, myPlayerID ) and ( p < myPlayerID ) and ( ping > highPing ) ) then
			highPing = ping
		end
	end
	
	--cap to 5s
	highPing = min( highPing, 5.0 )
	
	return highPing
end

--this one receives lua msgs from allied players. the player with the lowest id sets the marker first
--the others discard their markers when receiving a message from a lower player id
function widget:RecvLuaMsg(msg, playerID)
	if (msg:sub(1,3)=="dfT") then
		local unitId = tonumber( msg:sub( 4 ) ) -- take from pos 4 to the end
		
		if (playerID==myPlayerID) then 
			return true; 
		end

		if ( playerID < myPlayerID ) then
			--he is first, delete mine
			markersToSet[unitId] = nil
		end
	
		return true; 
	end
end

function widget:GameFrame()
	if ( markersToSetEmpty ) then
		return
	end
	
	markersToSetEmpty = true
	local now = spGetGameSeconds()
	local currentWaitTime = 2 * getHighestPing() --wait twice the worst ping time of all candidates (=players with lower id than myself)
	for k, marker in pairs( markersToSet ) do
		if ( now >= marker["time"] + currentWaitTime ) then
			spMarkerAddPoint( marker["pos"][1], marker["pos"][2], marker["pos"][3],  marker["text"], 1 )
			markersToSet[k] = nil
		else
			markersToSetEmpty = false
		end
	end
end

function widget:GameStart()
  if widgetHandler.widgets ~= nil then
	  for i, widget in ipairs(widgetHandler.widgets) do
		if (widget:GetInfo().name == 'Defense Range') then
		  local version = tonumber(string.match(widget:GetInfo().desc,'%d+%.%d+'))
		  if version and (version < tonumber("6")) then
			spEcho("<Unit Marker> Old DefenseRange found! Widget removed.")
			widgetHandler:RemoveWidget()
		  end
		end
	  end
  end
end

function CheckSpecState()
	local spec = spGetSpectatingState()
		
	if ( spec == true ) then
		widgetHandler:RemoveWidget()
		return false
	end
	
	return true	
end
