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

local StealthSpeed = {(Unitdefs[unitDefID].canmove and Unitdefs[unitDefID].cancloak) = true}

local stealthspeedList = {},



-----setup stealth speed command


local CMD_SPEEDSTEALTH = GG.CustomCommands.GetCmdID("CMD_SPEEDSTEALTH") ,


local speedstealthCmd = {
	id 		 = CMD_SPEEDSTEALTH,
	name    = "togglespeedstealth",
	action = "togglespeedstealth",
	type   = CMDTYPE.ICON_MODE,
	tooltip = 'Toggle slow and stealthy or fast and non stealthy',
	params = {0, 'Slow', 'Normal', 'Fast'},
},

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
  if StealthSpeed[unitDefID] then
    InsertUnitCmdDesc(unitID, 500, speedstealthCmd)
    local sp = UnitDefs[unitDefID].maxvelocity
    local cldist = UnitDefs[unitDefID].minCloakDistance 
    stealthspeedList[unitID] = {orgspeed=sp, orgcloakdistance=cldist, }
  end
end






-------- removed destroyed units from list


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  StealthSpeed[unitID] = nil
end




-----------enable the command


function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  if StealthSpeed[unitDefID] then
    if (cmdID == CMD_SPEEDSTEALTH) then 
      local cmdDescID = FindUnitCmdDesc(unitID, CMD_SPEEDSTEALTH)
      Spring.Echo("cmdparams[1]=" .. tostring(cmdParams[1]))
        if cmdParams = 1 then 
        SetGroundMoveTypeData(unitID, {
        		maxVelocity = stealthspeedlist[unitID].orgspeed
                minCloakDistance = stealthspeedlist[unitID].orgcloakdistance
        })
      elseif cmdParams = 2 then 
      SetGroundMoveTypeData(unitID, {
        		maxVelocity = stealthspeedlist[unitID].orgspeed * 2
                minCloakDistance = stealthspeedlist[unitID].orgcloakdistance / 2
                })
                
       elseif cmdParams = 3 then 
      SetGroundMoveTypeData(unitID, {
        		maxVelocity = stealthspeedlist[unitID].orgspeed * 3
                minCloakDistance = stealthspeedlist[unitID].orgcloakdistance / 3
                })         
    	end
	end
end
    
    

