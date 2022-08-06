local fireutil = require("__base__.prototypes.fire-util")
local nuke_explosions = require("data-nuke-explosions")

local nuke_materials = require("data-nukes-material")

local circuit_type;
local upgrade_circuit_mult = 5
if not mods["bobelectronics"] then
  circuit_type = "processing-unit"
else
  circuit_type = "superior-circuit-board"
  upgrade_circuit_mult = 1
end

local material = nuke_materials.smallBoomMaterial;




data:extend{
  {
    type = "technology",
    name = "californium-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/californium-processing-tech.png",
    effects = {},
    prerequisites = { "atomic-bomb"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 500
    },
    order = "e-a-d"
  }
}

if mods["apm_nuclear_ldinc"] then
  table.insert(data.raw.technology["californium-processing"].prerequisites, "apm_nuclear_breeder");
elseif mods["Nuclear Fuel"] then
  table.insert(data.raw.technology["californium-processing"].prerequisites, "plutonium-breeding");
elseif mods["Clowns-AngelBob-Nuclear"] then
  table.insert(data.raw.technology["californium-processing"].prerequisites, "nuclear-fuel-reprocessing-2");
else
  table.insert(data.raw.technology["californium-processing"].prerequisites, "kovarex-enrichment-process");
end

if(settings.startup["enable-atomic-ammo"].value or settings.startup["enable-big-atomic-ammo"].value) then
  table.insert(data.raw.technology["californium-processing"].effects,
    {
      type = "unlock-recipe",
      recipe = "atomic-rounds-magazine"
    })

end
if(settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) then
  table.insert(data.raw.technology["californium-processing"].effects,
    {
      type = "unlock-recipe",
      recipe = "atomic-cannon-shell"
    })
end
if(settings.startup["enable-really-very-small-atomic-bomb"].value) then
  table.insert(data.raw.technology["californium-processing"].effects, {
    type = "unlock-recipe",
    recipe = "really-very-small-atomic-bomb"
  })
end
if(settings.startup["enable-very-small-atomic-bomb"].value) then
  table.insert(data.raw.technology["scary-atomic-weapons"].effects, {
    type = "unlock-recipe",
    recipe = "very-small-atomic-bomb"
  })
end
if(settings.startup["enable-small-atomic-bomb"].value) then
  table.insert(data.raw.technology["scary-atomic-weapons"].effects, {
    type = "unlock-recipe",
    recipe = "small-atomic-bomb"
  })
end
if(material == "californium") then
  table.insert(data.raw.technology["californium-processing"].effects, {
    type = "unlock-recipe",
    recipe = "californium-processing"
  })
end

if(settings.startup["enable-big-atomic-ammo"].value) then
  table.insert(data.raw.technology["scary-atomic-weapons"].effects, 1, {
    type = "unlock-recipe",
    recipe = "big-atomic-rounds-magazine"
  })
end
if(settings.startup["enable-big-atomic-cannons"].value) then
  table.insert(data.raw.technology["scary-atomic-weapons"].effects, 2, {
    type = "unlock-recipe",
    recipe = "big-atomic-cannon-shell"
  })
end


