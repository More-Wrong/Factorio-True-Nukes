require("prototypes.warheads")
require("prototypes.basegame-weapontype-add")

if mods["SchallTankPlatoon"] then
  require("prototypes.compatibility.SchallTankPlatoon-weapontypes")
  require("prototypes.compatibility.SchallTankPlatoon-warheads")
end
if mods["space-exploration"] then
  require("prototypes.compatibility.SE-weapontypes")
  require("prototypes.compatibility.SE-warheads")
end

