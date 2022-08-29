require("prototypes.warheads")
require("prototypes.basegame-weapontype-add")

if mods["SchallTankPlatoon"] then
  require("prototypes.compatibility.SchallTankPlatoon-weapontypes")
  --require("prototypes.compatibility.SchallTankPlatoon-warheads")
end
if mods["space-exploration"] then
  require("prototypes.compatibility.SE-weapontypes")
end


if mods["bobwarfare"] then
  require("prototypes.compatibility.bobs-weapontypes")
end


if mods["Krastorio2"] then
  require("prototypes.compatibility.K2-weapontypes")
end



