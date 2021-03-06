
function gadget:GetInfo()
  return {
    name      = "battlestance",
    desc      = "Toggle between Defensive, Assault and Sprint",
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
local SetUnitArmored = Spring.SetUnitArmored
local GetUnitCmdDescs = Spring.GetUnitCmdDescs


-- constants

local ARMOUR_DEF = 0.2
local ARMOUR_ASS = 1.3




-----setup speedstealth  command


-----The List of units who can change their stance. (units that get this gadget)
		
		
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


			----  Create the button

local speedstealthCmdDesc = {
	id 		= CMD_SPEEDSTEALTH,
	name 	= "togglespeedstealth",
	action	= "togglespeedstealth",
	type   	= CMDTYPE.ICON_MODE,
	tooltip = 'Toggle between Defensive, Assault and Sprint.',
	params 	= {1, "slow", "normal", "fast"}
}


			---- Insert the button on the units who get it


function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	if STEALTHY[unitDefID] then
   		InsertUnitCmdDesc(unitID, 502, speedstealthCmdDesc)
    	local ms = UnitDefs[unitDefID].speed
    	stealthyList[unitID] = {orgspeed=ms}
    
  end
end


			---- Remove the button when a unit dies (as it is no longer needed)

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
      	
      		
       		 if  cmdParams[1] == 1 then  --Assault stance
        		
        			--units decloak range to 250
       				SetUnitCloak(unitID, true, 250)
       				
       				 --unit receives normal damage as in unitdef 
       				SetUnitArmored(unitID, false)  
       				
       				--unit moves at normal speed as in unitdef 
       				SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed * 1})  
                	
       			
        
     		elseif 
     				 cmdParams[1] == 2 then    --Sprint stance
        			
        			--set units decloak range to 750
        			SetUnitCloak(unitID, true, 750)    
        			
        			--multiply damage received by ARMOUR_ASS amount (defined above)
        			SetUnitArmored(unitID, true, ARMOUR_ASS)  
        			--unit moves at 1.6x unitdef speed
        			SetGroundMoveTypeData(unitID, {maxSpeed=stealthyList[unitID].orgspeed * 1.6 }) 
                	
        			  
              	  
       		elseif
       				 cmdParams[1] == 0 then   -- Defensive stance
      			
      			
      				--set units decloak range to 125
        			SetUnitCloak(unitID, true, 125)   
        			
        			--multiply damage received by ARMOUR_DEF amount (defined above)
        			SetUnitArmored(unitID, true, ARMOUR_DEF)
        			
        			--unit moves at 1/3 unitdef speed
        			SetGroundMoveTypeData(unitID, {maxSpeed=stealthyList[unitID].orgspeed / 3 }) 
                	
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
