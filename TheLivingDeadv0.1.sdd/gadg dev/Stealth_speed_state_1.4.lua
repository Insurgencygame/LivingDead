function gadget:GetInfo()
  return {
    name      = "Speed / Stealth state",
    desc      = "Toggles a units speed and decloak range.",
    author    = "Zealot",
    date      = "18 March 2013",
    license   = "GNU LGPL, v2.1 or later",
    layer     = 100,  -------------------------What does this do?
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




-----Attempting to find units which can move and cloak and put in list of units to apply the gadget to. This syntax apprears to be worng and is stoping the gadget from loading.

local SpeedStealth = {}
for id,unitDef in pairs(UnitDefs) do      
   if (UnitDefs[id].canmove and Unitdefs[unitDefID].cancloak) then
      SpeedStealth[id] = true
   end
end

-----setup speedstealth  command

local CMD_SPEEDSTEALTH = 34581




local speedstealthCmd = {
	id 		= CMD_SPEEDSTEALTH,
	name 	= "togglespeedstealth",
	action	= "togglespeedstealth",
	type   	= CMDTYPE.ICON_MODE,
	tooltip = 'Toggle slow and stealthy or fast and non stealthy',
	params 	= {0, 'Slow', 'Normal', 'Fast'}
}

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
  if SpeedStealth[unitDefID] then
    InsertUnitCmdDesc(unitID, 500, speedstealthCmd)
    local sp = UnitDefs[unitDefID].maxvelocity
    local cldist = UnitDefs[unitDefID].minCloakDistance 
    SpeedStealthList[unitID] = {orgspeed=sp, orgcloakdistance=cldist, }
  end
end






-------- removed destroyed units from list


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  SpeedStealth[unitID] = nil
end




-----------enable the command


function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  if SpeedStealth[unitDefID] then
    if (cmdID == CMD_SPEEDSTEALTH) then 
      local cmdDescID = FindUnitCmdDesc(unitID, CMD_SPEEDSTEALTH)
      Spring.Echo("cmdparams[1]=" .. tostring(cmdParams[1]))
        if cmdParams[1] == 1 then 
        		
       			Spring.SetUnitCloak(unitID, 2, 125)      
        
      elseif cmdParams[1] == 2 then 
        		
        		Spring.SetUnitCloak(unitID, 2, 250)  
                
       elseif cmdParams[1] == 3 then 
      			
        		Spring.SetUnitCloak(unitID, 2, 800)  
      
      
    	end
	end
end
end