local appearance = require("__True-Nukes__.prototypes.warhead-system.appearance-util")

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

table.insert(data.raw.technology["atomic-bomb"].effects,
  {
    type = "unlock-recipe",
    recipe = "TN-warhead-20--2"
  })
table.insert(data.raw.technology["atomic-bomb"].effects,
  {
    type = "unlock-recipe",
    recipe = "TN-warhead-8--1"
  })

table.insert(data.raw.technology["atomic-bomb"].effects,
  {
    type = "unlock-recipe",
    recipe = "TN-warhead-4--1"
  })

table.insert(data.raw.technology["atomic-bomb"].effects,
  {
    type = "unlock-recipe",
    recipe = "atomic-bomb"
  })
table.insert(data.raw.technology["atomic-bomb"].effects,
  {
    type = "unlock-recipe",
    recipe = "big-rocket-atomic-8t"
  })
table.insert(data.raw.technology["atomic-bomb"].effects,
  {
    type = "unlock-recipe",
    recipe = "big-rocket-atomic-4t"
  })

data.raw.technology["atomic-bomb"].unit.count = 1
data.raw.technology["atomic-bomb"].unit.ingredients = {{"test-pack-atomic-20t-1", 1}}
data.raw.technology["atomic-bomb"].order = "e-a-c"

data:extend{
  {
    type = "technology",
    name = "basic-atomic-weapons",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-20--1"
      },
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
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-500--1"
      }
    },
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
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-15k--1"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-1k--1"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-500--2"
      }
    },
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
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-atomic-20t"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-atomic-500t"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-atomic-1kt"
      }
    },
    prerequisites = {"expanded-atomics"},
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
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-8--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-4--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-2--1"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-0-5--1"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-0-1--1"
      },
    },
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
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-20--3"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-2--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-2--3"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-0-5--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-0-1--2"
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
for _,warhead in pairs({"-atomic-2t", "-atomic-0_5t"}) do
  table.insert(data.raw.technology["californium-weapons"].effects, {type = "unlock-recipe", recipe = "big-rocket" .. warhead})
end
for _,warhead in pairs({"-atomic-8t", "-atomic-4t", "-atomic-2t", "-atomic-0_5t", "-atomic-0_1t"}) do
  table.insert(data.raw.technology["californium-weapons"].effects, {type = "unlock-recipe", recipe = "small-rocket" .. warhead})
end
for _,warhead in pairs({"-atomic-8t", "-atomic-4t", "-atomic-2t", "-atomic-0_5t", "-atomic-0_1t"}) do
  table.insert(data.raw.technology["californium-weapons"].effects, {type = "unlock-recipe", recipe = "cannon-shell" .. warhead})
end
table.insert(data.raw.technology["californium-weapons"].effects, {type = "unlock-recipe", recipe = "rounds-magazine-atomic-0_1t"})

table.insert(data.raw.technology["compact-californium-weapons"].effects, {type = "unlock-recipe", recipe = "rounds-magazine-atomic-2t"})
table.insert(data.raw.technology["compact-californium-weapons"].effects, {type = "unlock-recipe", recipe = "rounds-magazine-atomic-0_5t"})

table.insert(data.raw.technology["compact-californium-weapons"].effects, {type = "unlock-recipe", recipe = "small-rocket-atomic-20t"})
table.insert(data.raw.technology["compact-californium-weapons"].effects, {type = "unlock-recipe", recipe = "cannon-shell-atomic-20t"})



data:extend{
  {
    type = "technology",
    name = "compact-full-fission-weapons",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/atomic-bomb.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-15k--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-1k--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-1k--3"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-500--3"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-atomic-15kt"
      },
      {
        type = "unlock-recipe",
        recipe = "big-rocket-atomic-1kt"
      },
      {
        type = "unlock-recipe",
        recipe = "big-rocket-atomic-500t"
      },
    },
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
        recipe = "TN-warhead-big--1"
      },
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
    effects = {
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-big--2"
      },
      {
        type = "unlock-recipe",
        recipe = "TN-warhead-big--3"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-atomic-2-stage-15kt"
      },
      {
        type = "unlock-recipe",
        recipe = "artillery-shell-atomic-2-stage-100kt"
      }
    },
    prerequisites = {"fusion-weapons"},
    unit =
    {
      count = 1,
      ingredients = {{"test-pack-atomic-2-stage-100kt-1", 1}},
      time = 1
    },
    order = "e-a-k"
  }
}
