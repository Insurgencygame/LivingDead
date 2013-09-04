
function gadget:GetInfo()
  return {
    name      = "Defensive / Offensive stance",
    desc      = "Toggles a units speed, armour and decloak range.",
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
local SetUnitWeaponState = Spring.SetUnitWeaponState

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
	tooltip = 'Toggle between Defensive, Assault and Sprint, Modes (Affects Armour, Visibility and Speed.)',
	params 	= {1, 'Defensive', 'Assualt', 'Sprint'}
}


			---- Insert the button on the units who get it


function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
	if STEALTHY[unitDefID] then
   		InsertUnitCmdDesc(unitID, 501, speedstealthCmdDesc)
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
      	
      		
       		 if  cmdParams[1] == 1 then 
        		
       				SetUnitCloak(unitID, true, 250)  
       				SetUnitArmored(unitID, false)
       				SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed * 1})
                	
       			
        
     		elseif 
     				 cmdParams[1] == 2 then 
        		
        			SetUnitCloak(unitID, true, 750)   
        			SetUnitArmored(unitID, true, ARMOUR_ASS)
        			SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed * 1.6 })
                	
        			  
              	  
       		elseif
       				 cmdParams[1] == 0 then 
      			
        			SetUnitCloak(unitID, true, 125)  
        			SetUnitArmored(unitID, true, ARMOUR_DEF)
        			SetGroundMoveTypeData(unitID, {
                	maxSpeed=stealthyList[unitID].orgspeed / 3 })
                	
       		end
      
      ---you can't edit a single value in the params table for
        ---editUnitCmdDesc, so we generate a new table
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
