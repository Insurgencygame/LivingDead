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
local SetUnitCloak = Spring.SetUnitCloak


-----setup speedstealth  command

local CMD_SPEEDSTEALTH = 34581

local speedstealthCmdDesc = {
	id 		= CMD_SPEEDSTEALTH,
	name 	= "togglespeedstealth",
	action	= "togglespeedstealth",
	type   	= CMDTYPE.ICON_MODE,
	tooltip = 'Toggle slow and stealthy or fast and non stealthy',
	params 	= {0, 'Slow', 'Normal', 'Fast'}
}

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
local ud = UnitDefs[unitDefID]
if ud.canMove and ud.canCloak then

    InsertUnitCmdDesc(unitID, speedstealthCmdDesc)

  end
end




-----------enable the command


function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
    if cmdID == CMD_SPEEDSTEALTH then 
     		local cmdDescID = FindUnitCmdDesc(unitID, CMD_SPEEDSTEALTH)
      		if not cmdDescID then return false end
      
       		 if cmdParams[0] == 2 then 
        		
       				SetUnitCloak(unitID, false, 125)      
        
     		elseif 
     				cmdParams[0] == 3 then 
        		
        			SetUnitCloak(unitID, true, 250)  
              	  
       		elseif 
       				cmdParams[0] == 4 then 
      			
        			SetUnitCloak(unitID, true, 800)  
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
  
