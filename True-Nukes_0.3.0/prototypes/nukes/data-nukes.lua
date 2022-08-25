require("data-nuke-terrain")
require("data-radiation")
require("data-nukes-intermediate")
require("data-nukes-warheads-create")
require("data-nukes-warheads-weapon-appearance")
require("data-nukes-technology")

if mods["space-exploration"] then
  require("compatibility.SE")
end
if mods["Krastorio2"] then
  require("compatibility.K2")
end
if mods["SchallTankPlatoon"] then
  require("compatibility.STP")
end
