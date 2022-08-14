require("data-thermobaric-warheads")
require("data-thermobaric-warheads-weapon-appearance")

local thermobaric_tech = table.deepcopy(data.raw["technology"]["military-3"])
thermobaric_tech.name = "thermobaric-weaponry"
thermobaric_tech.effects = {
  {
    type = "unlock-recipe",
    recipe = "TN-thermobaric-1"
  },
  {
    type = "unlock-recipe",
    recipe = "TN-thermobaric-2"
  },
  {
    type = "unlock-recipe",
    recipe = "TN-thermobaric-3"
  },
  {
    type = "unlock-recipe",
    recipe = "cannon-shell-thermobaric-1"
  },
  {
    type = "unlock-recipe",
    recipe = "small-rocket-thermobaric-1"
  },
  {
    type = "unlock-recipe",
    recipe = "big-rocket-thermobaric-1"
  },
  {
    type = "unlock-recipe",
    recipe = "big-rocket-thermobaric-2"
  },
  {
    type = "unlock-recipe",
    recipe = "artillery-shell-thermobaric-2"
  },
  {
    type = "unlock-recipe",
    recipe = "artillery-shell-thermobaric-3"
  },
  {
    type = "unlock-recipe",
    recipe = "fire-shield-equipment"
  }
}
  

if not mods["bobplates"] then
  thermobaric_tech.prerequisites = {"rocket-fuel", "flamethrower", "military-3"}
else
  thermobaric_tech.prerequisites = {"advanced-oil-processing", "flamethrower", "military-3"}
end
thermobaric_tech.prerequisites = {"rocket-fuel", "flamethrower", "military-3"}
thermobaric_tech.icon = "__True-Nukes__/graphics/thermobaric-tech.png"
thermobaric_tech.icon_mipmaps = 1
thermobaric_tech.unit.count=250
data:extend{thermobaric_tech}
