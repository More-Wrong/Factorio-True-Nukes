local appearance = require("__Warheads__.prototypes.appearance-util")

specialTechForWarheadWeapon["artillery-shell-atomic-4t"] = "artillery-atomics"
specialTechForWarheadWeapon["artillery-shell-atomic-8t"] = "artillery-atomics"
specialTechForWarheadWeapon["artillery-shell-atomic-20t"] = "artillery-atomics"
specialTechForWarheadWeapon["artillery-shell-atomic-500t"] = "artillery-atomics"
specialTechForWarheadWeapon["artillery-shell-atomic-1kt"] = "artillery-atomics"

specialTechForWarheadWeapon["land-mine-atomic-20t"] = "atomic-bomb"

data:extend{
  {
    type = "tool",
    name = "test-pack-atomic-20t-1",
    icons = appearance(warheads["TN-warhead-20--1"]).icons,
    subgroup = "science-pack",
    order = "za[atomic-20t-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "test-pack-atomic-500t-1",
    icons = appearance(warheads["TN-warhead-500--1"]).icons,
    subgroup = "science-pack",
    order = "zb[atomic-500t-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "test-pack-atomic-20t-3",
    icons = appearance(warheads["TN-warhead-20--3"]).icons,
    subgroup = "science-pack",
    order = "zc[atomic-20t-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "test-pack-atomic-15kt-1",
    icons = appearance(warheads["TN-warhead-15k--1"]).icons,
    subgroup = "science-pack",
    order = "zd[atomic-15kt-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
  {
    type = "tool",
    name = "test-pack-atomic-2-stage-100kt-1",
    icons = appearance(warheads["TN-warhead-big--1"].explosions[2]).icons,
    subgroup = "science-pack",
    order = "ze[atomic-100kt-science-pack]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },
}

generateWarheadAnyway["TN-warhead-20--1"] = true
generateWarheadAnyway["TN-warhead-500--1"] = true
generateWarheadAnyway["TN-warhead-20--3"] = true
generateWarheadAnyway["TN-warhead-15k--1"] = true
generateWarheadAnyway["TN-warhead-big--1"] = true

local standard = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1},
}
local no_prod = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"utility-science-pack", 1},
}
local no_util = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"production-science-pack", 1},
}
local space = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"military-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1},
  {"space-science-pack", 1},
}


data.raw.technology["atomic-bomb"].effects[1] = nil
data.raw.technology["atomic-bomb"].prerequisites = {"basic-atomic-weapons", "rocket-control-unit", "rocket-fuel", "rocketry"}


data.raw.technology["atomic-bomb"].unit.count = 1
data.raw.technology["atomic-bomb"].unit.ingredients = {{"test-pack-atomic-20t-1", 1}}
data.raw.technology["atomic-bomb"].order = "e-a-c"
data.raw.technology["atomic-bomb"].icon = "__True-Nukes__/graphics/nuke-tech.png"

data:extend{
  {
    type = "technology",
    name = "basic-atomic-weapons",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/nuke-tech-basic.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "fire-shield-equipment"
      }
    },
    prerequisites = {"military-4", "uranium-processing"},
    unit =
    {
      count = 1000,
      ingredients = no_prod,
      time = 45
    },
    order = "e-a-c"
  },
  {
    type = "technology",
    name = "expanded-atomics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects = {},
    prerequisites = {"atomic-bomb", "kovarex-enrichment-process", "production-science-pack"},
    unit =
    {
      count = 2000,
      ingredients = standard,
      time = 45
    },
    order = "e-a-d"
  },
  {
    type = "technology",
    name = "full-fission-atomics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects = {},
    prerequisites = {"expanded-atomics"},
    unit =
    {
      count = 1,
      ingredients = {{"test-pack-atomic-500t-1", 1}},
      time = 1
    },
    order = "e-a-f"
  },
  {
    type = "technology",
    name = "artillery-atomics",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/atomic-artillery-tech.png",
    effects = {},
    prerequisites = {"expanded-atomics", "artillery"},
    unit =
    {
      count = 1000,
      ingredients = no_util,
      time = 60
    },
    order = "e-a-e"
  },
}



data:extend{
  {
    type = "technology",
    name = "californium-processing",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/californium-processing-tech.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "californium-processing"
      },
    },
    prerequisites = {"kovarex-enrichment-process"},
    unit =
    {
      count = 500,
      ingredients = {
        {"automation-science-pack", 2},
        {"logistic-science-pack", 2},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 30
    },
    order = "e-p-b-d"
  },
  {
    type = "technology",
    name = "californium-weapons",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/small-atomic-tech.png",
    effects = {},
    prerequisites = {"expanded-atomics", "californium-processing"},
    unit =
    {
      count = 500,
      ingredients = no_prod,
      time = 45
    },
    order = "e-a-g"
  },
  {
    type = "technology",
    name = "compact-californium-weapons",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/many-small-atomic-tech.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "neutron-reflector"
      },
    },
    prerequisites = {"californium-weapons"},
    unit =
    {
      count = 1000,
      ingredients = standard,
      time = 45
    },
    order = "e-a-h"
  },
}


data:extend{
  {
    type = "technology",
    name = "compact-full-fission-weapons",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__True-Nukes__/graphics/many-atomic-tech.png",
    effects = {},
    prerequisites = {"full-fission-atomics", "artillery-atomics", "compact-californium-weapons"},
    unit =
    {
      count = 1,
      ingredients = {{"test-pack-atomic-15kt-1", 1}, {"test-pack-atomic-20t-3", 1}},
      time = 1
    },
    order = "e-a-i"
  },
  {
    type = "technology",
    name = "tritium-proccessing",
    icon_size = 256, icon_mipmaps = 1,
    icon = "__True-Nukes__/graphics/tritium-processing.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tritium-breeder-fuel-cell"
      },
      {
        type = "unlock-recipe",
        recipe = "tritium-extraction"
      }
    },
    prerequisites = {"nuclear-fuel-reprocessing"},
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 45
    },
    order = "e-a-l"
  },
  {
    type = "technology",
    name = "fusion-weapons",
    icon_size = 256, icon_mipmaps = 1,
    icon = "__True-Nukes__/graphics/fusion-bomb.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "FOGBANK"
      }
    },
    prerequisites = {"compact-full-fission-weapons", "tritium-proccessing"},
    unit =
    {
      count = 2000,
      ingredients = space,
      time = 45
    },
    order = "e-a-j"
  },
  {
    type = "technology",
    name = "compact-fusion-weapons",
    icon_size = 256, icon_mipmaps = 1,
    icon = "__True-Nukes__/graphics/fusion-bomb.png",
    effects = {},
    prerequisites = {"fusion-weapons"},
    unit =
    {
      count = 1,
      ingredients = {{"test-pack-atomic-2-stage-100kt-1", 1}},
      time = 1
    },
    order = "e-a-k"
  },
  {
    type = "technology",
    name = "dense-neutron-flux",
    icons = {
      {icon = "__Warheads__/graphics/blank-64.png", icon_size = 64, scale = 1, shift = {0, -0}},
      {icon = "__True-Nukes__/graphics/californium-processing-tech.png", icon_size = 256, scale = 0.125, shift = {12, -12}, icon_mipmaps = 4},
      {icon = "__base__/graphics/technology/kovarex-enrichment-process.png", icon_size = 256, scale = 0.125, shift = {-12, -12}, icon_mipmaps = 4},
      {icon = "__True-Nukes__/graphics/tritium-processing.png", icon_size = 256, scale = 0.125, shift = {0, 16}, icon_mipmaps = 4},
      {icon = "__True-Nukes__/graphics/plus-red.png", icon_size = 32, scale = 0.5, shift = {24, -24}},
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "advanced-kovarex-enrichment-process"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-californium-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-tritium-breeder-fuel-cell"
      },
      {
        type = "unlock-recipe",
        recipe = "advanced-tritium-extraction"
      },
    },
    prerequisites = {"compact-californium-weapons"},
    unit =
    {
      count = 1000,
      ingredients = standard,
      time = 45
    },
    order = "e-a-h"
  },
}
