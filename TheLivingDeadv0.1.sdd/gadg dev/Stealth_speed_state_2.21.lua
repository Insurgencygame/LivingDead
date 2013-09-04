
function gadget:GetInfo()
  return {
    name      = "Speed / Stealth state",
    desc      = "Toggles a units speed and decloak range.",
    author    = "Zealot",
    date      = "13th July 2013",
    license   = "GNU LGPL, v2.1 or later",
    layer     = 101,  -------------------------What does this do?
    enabled   = true  --  loaded by default?
  }
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return
end


local EditUnitCmdDesc = Spring.EditUnitCmdDesc
local FindUnitCmdDesc = Spring.FindUnitCmdDesc
local InsertUnitCmdDesc = Spring.InsertUnitCmdDesc
local GiveOrderToUnit = Spring.GiveOrderToUnit
local SetUnitNeutral = Spring.SetUnitNeutral
local GetUnitMoveTypeData = Spring.GetUnitMoveTypeData
local SetGroundMoveTypeData = Spring.MoveCtrl.SetGroundMoveTypeData
local SetUnitCloak = Spring.SetUnitCloak
local GetUnitCmdDescs = Spring.GetUnitCmdDescs

-----setup speedstealth  command



local STEALTHY = {
	[UnitDefNames["armcv"].id] = true,
	[UnitDefNames["corak"].id] = true,
	[UnitDefNames["armpw"].id] = true,
	[UnitDefNames["armwar"].id] = true,
	[UnitDefNames["armrock"].id] = true,
	[UnitDefNames["corstorm"].id] = true,
	[UnitDefNames["corthud"].id] = true,
	[UnitDefNames["armzeus"].id] = true,
	[UnitDefNames["cornecro"].id] = true,
	[UnitDefNames["corpyro"].id] = true,
	[UnitDefNames["armsnipe"].id] = true,
	[UnitDefNames["cormort"].id] = true,
	
}

local stealthyList = {}

local CMD_SPEEDSTEALTH = 34583

local speedstealthCmdDesc = {
	id 		= CMD_SPEEDSTEALTH,
	name 	= "togglespeedstealth",
	action	= "togglespeedstealth",
	type   	= CMDTYPE.ICON_MODE,
	tooltip = 'Toggle slow and stealthy or fast and non stealthy',
	params 	= {1, 'Slow', 'Normal', 'Fast'}
}





function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	if STEALTHY[unitDefID] then
   		InsertUnitCmdDesc(unitID, 501, speedstealthCmdDesc)
    	local ms = UnitDefs[unitDefID].speed
    	stealthyList[unitID] = {orgspeed=ms}
  end
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  stealthyList[unitID] = nil
end



-----------enable the command


function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
if STEALTHY[unitDefID] then
    if cmdID == CMD_SPEEDSTEALTH then 
     		local cmdDescID = FindUnitCmdDesc(unitID, CMD_SPEEDSTEALTH)
     		--Spring.Echo("cmdparams[1]=" .. tostring(cmdParams[1]))
      		if not cmdDescID then return false end
      	
      		
       		 if  cmdParams[1] == 1 then 
        		
       				SetUnitCloak(unitID, true, 250)  
       				SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed * 1})
       			
        
     		elseif 
     				 cmdParams[1] == 2 then 
        		
        			SetUnitCloak(unitID, true, 750)   
        			SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed * 2 })
        			  
              	  
       		elseif
       				 cmdParams[1] == 0 then 
      			
        			SetUnitCloak(unitID, true, 125)  
        			SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed / 2 })
       		end
      
      --you can't edit a single value in the params table for
        --editUnitCmdDesc, so we generate a new table
        local updatedCmdParams = {
            cmdParams[1],
            speedstealthCmdDesc.params[2],
            speedstealthCmdDesc.params[3],
            speedstealthCmdDesc.params[4]
        }
		Spring.EditUnitCmdDesc(unitID, cmdDescID, { params = updatedCmdParams}) 
		return false 
    	end
    	return true
    end
  end
