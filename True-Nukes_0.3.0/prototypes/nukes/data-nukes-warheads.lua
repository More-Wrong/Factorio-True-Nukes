local nuke_materials = require("data-nukes-material")
local nuke_explosions = require("data-nuke-explosions")

local dead = nuke_materials.deadMaterial
local boom = nuke_materials.boomMaterial
local small = nuke_materials.smallBoomMaterial
local light = nuke_materials.lightMaterial
local computer = nuke_materials.computer


local function createAppearance(setup)
  local light_name = setup.light_name or setup.icon_name
  return {
    icons = {
      {
        icon_size = 64,
        icon = setup.location .. setup.icon_name .. ".png",
      },
      {
        icon_size = 128,
        icon = setup.location .. "text_" .. setup.yield .. ".png",
        scale = 0.25,
        shift = {0, -16}
      }
    },
    pictures = {
      layers =
      {
        {
          size = 64,
          filename = setup.location .. setup.icon_name .. ".png",
          scale = 0.25,
          mipmap_count = 1
        },
        {
          size = 128,
          filename = setup.location .. "text_" .. setup.yield .. ".png",
          scale = 0.125,
          shift = {0, -0.5}
        },
        {
          draw_as_light = true,
          flags = {"light"},
          size = 64,
          filename = setup.location .. light_name .. "-light.png",
          scale = 0.25,
          mipmap_count = 1
        }
      }
    }
  }
end

data:extend({
  {
    name = "TN-tiny-nuclear-weapon-cores",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y1[TN-tiny-cores]"
  },
  {
    name = "TN-small-nuclear-weapon-cores",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y2[TN-small-cores]"
  },
  {
    name = "TN-medium-nuclear-weapon-cores",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y3[TN-medium-cores]"
  },
  {
    name = "TN-large-nuclear-weapon-cores",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y4[TN-large-cores]"
  },
  {
    name = "TN-huge-nuclear-weapon-cores",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y5[TN-huge-cores]"
  }
})

local function createBasicWarhead(setup)
  local item = {
    type = "item",
    name = setup.name,
    icons = setup.appearance.icons,
    pictures = setup.appearance.pictures,
    subgroup = "TN-" .. setup.size .. "-nuclear-weapon-cores",
    order = setup.order,
    stack_size = setup.stack_size
  }
  local recipe = {
    type = "recipe",
    name = setup.name,
    enabled = true,
    energy_required = setup.time,
    ingredients = setup.ingredients,
    results=
    {
      {type="item", name=setup.name, amount = setup.amount or 1}
    }
  }
  data:extend({item, recipe});
end

local warheads = {
  {
    name = "TN-warhead-0-1--1",
    order = "ya[TN-warhead-0-1--1]",
    yield = "0_1t",
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0", light_name = "core-0", yield = "0_1t"}),
    stack_size = 100,
    time = 100,
    amount = 10,
    ingredients = {
      {"steel-plate", 2},
      {light, 10},
      {computer, 2},
      {"explosives", 2},
      {dead, 4},
      {small, 10},
    }
  },
  {
    name = "TN-warhead-0-1--2",
    order = "ya[TN-warhead-0-1--2]",
    yield = "0_1t",
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0", light_name = "core-0", yield = "0_1t"}),
    stack_size = 200,
    time = 200,
    amount = 5,
    ingredients = {
      {light, 10},
      {computer, 2},
      {"explosives", 2},
      {dead, 1},
      {small, 8},
    }
  },

  {
    name = "TN-warhead-0-5--1",
    order = "ya[TN-warhead-0-5--1]",
    yield = "0_5t",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1", light_name = "core-1", yield = "0_5t"}),
    stack_size = 100,
    time = 150,
    amount = 6,
    ingredients = {
      {"steel-plate", 1},
      {light, 12},
      {computer, 3},
      {"explosives", 3},
      {dead, 4},
      {small, 12}
    }
  },
  {
    name = "TN-warhead-0-5--2",
    order = "ya[TN-warhead-0-5--2]",
    yield = "0_5t",
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1", light_name = "core-1", yield = "0_5t"}),
    stack_size = 100,
    time = 150,
    amount = 3,
    ingredients = {
      {light, 9},
      {computer, 3},
      {"explosives", 2},
      {dead, 1},
      {small, 9}
    }
  },

  {
    name = "TN-warhead-2--1",
    order = "ya[TN-warhead-2--1]",
    yield = "2t",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-0", light_name = "core-0", yield = "2t"}),
    stack_size = 20,
    time = 20,
    ingredients = {
      {"steel-plate", 2},
      {computer, 5},
      {"explosives", 5},
      {dead, 3},
      {boom, 3},
      {small, 4}
    }
  },
  {
    name = "TN-warhead-2--2",
    order = "ya[TN-warhead-2--2]",
    yield = "2t",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-2", light_name = "core-2", yield = "2t"}),
    stack_size = 20,
    time = 60,
    ingredients = {
      {"steel-plate", 1},
      {light, 4},
      {computer, 10},
      {"explosives", 4},
      {dead, 2},
      {boom, 1},
      {small, 8}
    }
  },
  {
    name = "TN-warhead-2--3",
    order = "ya[TN-warhead-2--3]",
    yield = "2t",
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-2", light_name = "core-2", yield = "2t"}),
    stack_size = 20,
    time = 120,
    ingredients = {
      {light, 10},
      {computer, 15},
      {"explosives", 2},
      {small, 15}
    }
  },

  {
    name = "TN-warhead-4--1",
    order = "yb[TN-warhead-04--1]",
    yield = "4t",
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-1", light_name = "core-1", yield = "4t"}),
    stack_size = 10,
    time = 30,
    ingredients = {
      {"steel-plate", 4},
      {computer, 5},
      {"explosives", 10},
      {dead, 5},
      {boom, 8}
    }
  },
  {
    name = "TN-warhead-4--2",
    order = "yb[TN-warhead-04--2]",
    yield = "4t",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-1", light_name = "core-1", yield = "4t"}),
    stack_size = 10,
    time = 90,
    ingredients = {
      {light, 15},
      {computer, 12},
      {"explosives", 5},
      {boom, 2},
      {small, 20}
    }
  },

  {
    name = "TN-warhead-8--1",
    order = "yb[TN-warhead-08--1]",
    yield = "8t",
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-0", light_name = "core-0", yield = "8t"}),
    stack_size = 10,
    time = 40,
    ingredients = {
      {"steel-plate", 6},
      {computer, 5},
      {"explosives", 20},
      {dead, 10},
      {boom, 15}
    }
  },
  {
    name = "TN-warhead-8--2",
    order = "yb[TN-warhead-08--2]",
    yield = "8t",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-2", light_name = "core-2", yield = "8t"}),
    stack_size = 10,
    time = 90,
    ingredients = {
      {light, 20},
      {computer, 18},
      {"explosives", 8},
      {boom, 2},
      {small, 30}
    }
  },

  {
    name = "TN-warhead-20--1",
    order = "yb[TN-warhead-20--1]",
    yield = "20t",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-1", light_name = "core-1", yield = "20t"}),
    stack_size = 5,
    time = 60,
    ingredients = {
      {"steel-plate", 10},
      {computer, 8},
      {"explosives", 30},
      {dead, 15},
      {boom, 30}
    }
  },
  {
    name = "TN-warhead-20--2",
    order = "yb[TN-warhead-20--2]",
    yield = "20t",
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-1", light_name = "core-1", yield = "20t"}),
    stack_size = 5,
    time = 150,
    ingredients = {
      {light, 20},
      {computer, 20},
      {"explosives", 15},
      {dead, 5},
      {boom, 20},
      {small, 5}
    }
  },
  {
    name = "TN-warhead-20--3",
    order = "yb[TN-warhead-20--3]",
    yield = "20t",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-2", light_name = "core-2", yield = "20t"}),
    stack_size = 5,
    time = 360,
    ingredients = {
      {light, 50},
      {computer, 40},
      {"explosives", 5},
      {boom, 6},
      {small, 45}
    }
  },

  {
    name = "TN-warhead-500--1",
    order = "yc[TN-warhead-00500--1]",
    yield = "500t",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-0", light_name = "core-0", yield = "500t"}),
    stack_size = 1,
    time = 90,
    ingredients = {
      {"steel-plate", 20},
      {computer, 10},
      {"explosives", 40},
      {dead, 25},
      {boom, 75}
    }
  },
  {
    name = "TN-warhead-500--2",
    order = "yc[TN-warhead-00500--2]",
    yield = "500t",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-0", light_name = "core-0", yield = "500t"}),
    stack_size = 1,
    time = 210,
    ingredients = {
      {"steel-plate", 5},
      {light, 15},
      {computer, 20},
      {"explosives", 25},
      {dead, 15},
      {boom, 100},
    }
  },
  {
    name = "TN-warhead-500--3",
    order = "yc[TN-warhead-00500--3]",
    yield = "500t",
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-2", light_name = "core-2", yield = "500t"}),
    stack_size = 1,
    time = 360,
    ingredients = {
      {light, 50},
      {computer, 50},
      {"explosives", 10},
      {boom, 50},
      {small, 60}
    }
  },

  {
    name = "TN-warhead-1k--1",
    order = "yc[TN-warhead-01k--1]",
    yield = "1kt",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-1", light_name = "core-1", yield = "1kt"}),
    stack_size = 1,
    time = 120,
    ingredients = {
      {"steel-plate", 25},
      {computer, 20},
      {"explosives", 100},
      {dead, 25},
      {boom, 100}
    }
  },
  {
    name = "TN-warhead-1k--2",
    order = "yc[TN-warhead-01k--2]",
    yield = "1kt",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-1", light_name = "core-1", yield = "1kt"}),
    stack_size = 1,
    time = 300,
    ingredients = {
      {"steel-plate", 8},
      {light, 20},
      {computer, 45},
      {"explosives", 50},
      {dead, 5},
      {boom, 115},
    }
  },
  {
    name = "TN-warhead-1k--3",
    order = "yc[TN-warhead-01k--3]",
    yield = "1kt",
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-2", light_name = "core-2", yield = "1kt"}),
    stack_size = 1,
    time = 600,
    ingredients = {
      {light, 75},
      {computer, 100},
      {"red-wire", 20},
      {"explosives", 20},
      {boom, 80},
      {small, 80}
    }
  },

  {
    name = "TN-warhead-15k--1",
    order = "yc[TN-warhead-15k--1]",
    yield = "15kt",
    size = "huge",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-2", light_name = "core-2", yield = "15kt"}),
    stack_size = 1,
    time = 180,
    ingredients = {
      {"steel-plate", 30},
      {computer, 60},
      {"red-wire", 5},
      {"green-wire", 5},
      {"explosives", 175},
      {dead, 150},
      {boom, 250}
    }
  },
  {
    name = "TN-warhead-15k--2",
    order = "yc[TN-warhead-15k--2]",
    yield = "15kt",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-2", light_name = "core-2", yield = "15kt"}),
    stack_size = 1,
    time = 480,
    ingredients = {
      {"steel-plate", 10},
      {light, 30},
      {computer, 160},
      {"red-wire", 10},
      {"green-wire", 10},
      {"explosives", 130},
      {dead, 25},
      {boom, 325}
    }
  },

  {
    name = "TN-warhead-big--1",
    order = "yd[TN-warhead-big--1]",
    yield = "15kt+",
    size = "huge",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-bb-2", light_name = "core-2", yield = "15kt+"}),
    stack_size = 1,
    time = 180,
    ingredients = {
      {"steel-plate", 100},
      {"copper-plate", 100},
      {computer, 100},
      {"red-wire", 20},
      {"green-wire", 20},
      {"FOGBANK", 10},
      {"heat-pipe", 10},
      {"explosives", 200},
      {dead, 400},
      {boom, 250}
    }
  },
  {
    name = "TN-warhead-big--2",
    order = "yd[TN-warhead-big--2]",
    yield = "15kt+",
    size = "huge",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gb-2", light_name = "core-2", yield = "15kt+"}),
    stack_size = 1,
    time = 300,
    ingredients = {
      {"steel-plate", 50},
      {"copper-plate", 50},
      {light, 80},
      {computer, 200},
      {"red-wire", 40},
      {"green-wire", 40},
      {"FOGBANK", 40},
      {"heat-pipe", 40},
      {"explosives", 130},
      {dead, 200},
      {boom, 325}
    },
  },
  {
    name = "TN-warhead-big--3",
    order = "yd[TN-warhead-big--3]",
    yield = "15kt+",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gb-1", light_name = "core-1", yield = "15kt+"}),
    stack_size = 1,
    time = 720,
    ingredients = {
      {"copper-plate", 20},
      {light, 150},
      {computer, 300},
      {"red-wire", 100},
      {"green-wire", 100},
      {"FOGBANK", 60},
      {"heat-pipe", 60},
      {"explosives", 75},
      {dead, 50},
      {boom, 400}
    }
  }
}
for _,setup in pairs(warheads) do
  createBasicWarhead(setup);
end

-- preciseSize is just a made up number - kinda exponential ish
-- <=10 is tiny, <=20 is small, <=30 is medium, <=40 is large, <=50 is huge
local sizes = {
  tiny = 10,
  small = 20,
  medium = 30,
  large = 40,
  huge = 50,
  all = 100
}
local yields = {
  {
    name = "TN-warhead-0-1--1",
    appendName = "-atomic-0_1t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "0_1t",
    preciseSize = 6,
    explosion = nuke_explosions.N0_1t_detonation
  },
  {
    name = "TN-warhead-0-1--2",
    appendName = "-atomic-0_1t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "0_1t",
    preciseSize = 3,
    explosion = nuke_explosions.N0_1t_detonation
  },

  {
    name = "TN-warhead-0-5--1",
    appendName = "-atomic-0_5t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "0_5t",
    preciseSize = 12,
    explosion = nuke_explosions.N0_5t_detonation
  },
  {
    name = "TN-warhead-0-5--2",
    appendName = "-atomic-0_5t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "0_5t",
    preciseSize = 8,
    explosion = nuke_explosions.N0_5t_detonation
  },

  {
    name = "TN-warhead-2--1",
    appendName = "-atomic-2t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "2t",
    preciseSize = 18,
    explosion = nuke_explosions.N2t_detonation
  },
  {
    name = "TN-warhead-2--2",
    appendName = "-atomic-2t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "2t",
    preciseSize = 14,
    explosion = nuke_explosions.N2t_detonation
  },
  {
    name = "TN-warhead-2--3",
    appendName = "-atomic-2t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "2t",
    preciseSize = 10,
    explosion = nuke_explosions.N2t_detonation
  },

  {
    name = "TN-warhead-4--1",
    appendName = "-atomic-4t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "medium",
    yield = "4t",
    preciseSize = 24,
    explosion = nuke_explosions.N4t_detonation
  },
  {
    name = "TN-warhead-4--2",
    appendName = "-atomic-4t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "4t",
    preciseSize = 16,
    explosion = nuke_explosions.N4t_detonation
  },

  {
    name = "TN-warhead-8--1",
    appendName = "-atomic-8t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "medium",
    yield = "8t",
    preciseSize = 28,
    explosion = nuke_explosions.N8t_detonation
  },
  {
    name = "TN-warhead-8--2",
    appendName = "-atomic-8t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "8t",
    preciseSize = 18,
    explosion = nuke_explosions.N8t_detonation
  },

  {
    name = "TN-warhead-20--1",
    appendName = "-atomic-20t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "20t",
    preciseSize = 32,
    explosion = nuke_explosions.N20t_detonation
  },
  {
    name = "TN-warhead-20--2",
    appendName = "-atomic-20t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "medium",
    yield = "20t",
    preciseSize = 26,
    explosion = nuke_explosions.N20t_detonation
  },
  {
    name = "TN-warhead-20--3",
    appendName = "-atomic-20t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "small",
    yield = "20t",
    preciseSize = 20,
    explosion = nuke_explosions.N20t_detonation
  },

  {
    name = "TN-warhead-500--1",
    appendName = "-atomic-500t",
    icon = "__True-Nukes__/graphics/warheads/core-gg-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "500t",
    preciseSize = 38,
    explosion = nuke_explosions.N500t_detonation
  },
  {
    name = "TN-warhead-500--2",
    appendName = "-atomic-500t",
    icon = "__True-Nukes__/graphics/warheads/core-gg-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "500t",
    preciseSize = 34,
    explosion = nuke_explosions.N500t_detonation
  },
  {
    name = "TN-warhead-500--3",
    appendName = "-atomic-500t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "medium",
    yield = "500t",
    preciseSize = 28,
    explosion = nuke_explosions.N500t_detonation
  },

  {
    name = "TN-warhead-1k--1",
    appendName = "-atomic-1kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "1kt",
    preciseSize = 40,
    explosion = nuke_explosions.N1kt_detonation
  },
  {
    name = "TN-warhead-1k--2",
    appendName = "-atomic-1kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "1kt",
    preciseSize = 36,
    explosion = nuke_explosions.N1kt_detonation
  },
  {
    name = "TN-warhead-1k--3",
    appendName = "-atomic-1kt",
    icon = "__True-Nukes__/graphics/warheads/core-gy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "medium",
    yield = "1kt",
    preciseSize = 30,
    explosion = nuke_explosions.N1kt_detonation
  },

  {
    name = "TN-warhead-15k--1",
    appendName = "-atomic-15kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "huge",
    yield = "15kt",
    preciseSize = 44,
    explosion = nuke_explosions.N15kt_detonation
  },
  {
    name = "TN-warhead-15k--2",
    appendName = "-atomic-15kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "15kt",
    preciseSize = 38,
    explosion = nuke_explosions.N15kt_detonation
  },

  {
    name = "TN-warhead-big--1",
    appendName = "-atomic-2-stage",
    icon = "__True-Nukes__/graphics/warheads/core-bb-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    size = "massive",
    preciseSize = 56,
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{"tritium-canister", 2}},
        appendName = "-100kt",
        yield = "100kt",
        explosion = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{"tritium-canister", 20}},
        appendName = "-1Mt",
        yield = "1Mt",
        explosion = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{"tritium-canister", 100}},
        appendName = "-5Mt",
        yield = "5Mt",
        explosion = nuke_explosions.N5Mt_detonation
      },
      {
        ingedients = {{"tritium-canister", 200}},
        appendName = "-10Mt",
        yield = "10Mt",
        explosion = nuke_explosions.N10Mt_detonation
      },
      {
        ingedients = {{"tritium-canister", 1000}},
        appendName = "-50Mt",
        yield = "50Mt",
        explosion = nuke_explosions.N50Mt_detonation
      },
      {
        ingedients = {{"tritium-canister", 2000}},
        appendName = "-100Mt",
        yield = "100Mt",
        explosion = nuke_explosions.N100Mt_detonation
      },
      {
        ingedients = {{"tritium-canister", 20000}},
        appendName = "-1Gt",
        yield = "1Gt",
        explosion = nuke_explosions.N1Gt_detonation
      }
    }
  },
  {
    name = "TN-warhead-big--2",
    appendName = "-atomic-2-stage",
    icon = "__True-Nukes__/graphics/warheads/core-gb-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    size = "huge",
    preciseSize = 46,
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{"tritium-canister", 4}},
        appendName = "-100kt",
        yield = "100kt",
        explosion = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{"tritium-canister", 40}},
        appendName = "-1Mt",
        yield = "1Mt",
        explosion = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{"tritium-canister", 200}},
        appendName = "-5Mt",
        yield = "5Mt",
        explosion = nuke_explosions.N5Mt_detonation
      }
    }
  },
  {
    name = "TN-warhead-big--3",
    appendName = "-atomic-2-stage",
    icon = "__True-Nukes__/graphics/warheads/core-gb-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    size = "large",
    preciseSize = 40,
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{"tritium-canister", 8}},
        appendName = "-100kt",
        yield = "100kt",
        explosion = nuke_explosions.N100kt_detonation
      }
    }
  }
}
local function createNukeProjectileFor(setup, warhead, explosion)
  local projectile = table.deepcopy(setup.projectile);
  local effect = table.deepcopy(explosion.explosion);
  projectile.name = setup.baseName .. warhead.appendName .. explosion.appendName
  if(setup.keepAction) then
    projectile.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}} .. {projectile.action}
  else
    projectile.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}}
  end
  if(projectile.chart_picture) then
    projectile.chart_picture.filename = warhead.chart_picture
  end
  data:extend{projectile}
end

local function setupNukeItemFor(setup, warhead, explosion)
  local item = table.deepcopy(setup.item);
  item.name = setup.baseName .. warhead.appendName .. explosion.appendName
  if(setup.ignoreCoreIcon)then
    item.icons = {
      {
        icon = setup.iconTable[warhead.appendName .. explosion.appendName],
        shift = setup.iconShift,
        size = 64
      }
    }
  elseif(setup.iconTable and setup.iconTable[warhead.appendName .. explosion.appendName])then
    item.icon = nil
    item.icons = {
      {
        icon = setup.iconTable[warhead.appendName .. explosion.appendName],
        shift = setup.iconShift,
        size = 64
      },
      {
        icon = warhead.icon,
        size = 64,
        shift = setup.coreShift or {10, -4},
        scale = 0.333
      },
      {
        icon_size = 128,
        icon = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
        scale = 0.25,
        shift = {0, -16}
      }
    }
  else
    item.icons = {
      {
        icon = item.icon,
        shift = setup.iconShift,
        size = 64
      },
      {
        icon = warhead.icon,
        size = 64,
        shift = setup.coreShift or {10, -4},
        scale = 0.25
      },
      {
        icon_size = 128,
        icon = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
        scale = 0.25,
        shift = {0, -16}
      }
    }
    item.icon = nil
  end
  local shiftCalc = {0.1875, -0.075}
  if(setup.coreShift) then
    shiftCalc = {setup.coreShift[1]*0.01875, setup.coreShift[2]*0.01875}
  end
  if(setup.lightTable and setup.lightTable[warhead.appendName .. explosion.appendName]) then
    if(setup.ignoreCoreIcon)then
      item.pictures = {layers = {}}
      item.pictures.layers = {
        {
          filename = setup.iconTable[warhead.appendName .. explosion.appendName],
          size = 64,
          shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875},
          scale = 0.25
        },
        {
          filename = setup.lightTable[warhead.appendName .. explosion.appendName],
          flags = {"light"},
          draw_as_light = true,
          size = 64,
          shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875},
          scale = 0.25
        },
        {
          size = 128,
          filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
          scale = 0.125,
          shift = {0, -0.5}
        }
      }
    else
      item.pictures = {layers = {}}
      item.pictures.layers = {
        {
          filename = setup.iconTable[warhead.appendName .. explosion.appendName],
          size = 64,
          shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875},
          scale = 0.25
        },
        {
          filename = setup.lightTable[warhead.appendName .. explosion.appendName],
          flags = {"light"},
          draw_as_light = true,
          size = 64,
          shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875},
          scale = 0.25
        },
        {
          filename = warhead.icon,
          size = 64,
          shift = shiftCalc,
          scale = 0.166
        },
        {
          filename = warhead.light,
          size = 64,
          shift = shiftCalc,
          draw_as_light = true,
          flags = {"light"},
          scale = 0.166
        },
        {
          size = 128,
          filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
          scale = 0.125,
          shift = {0, -0.5}
        }
      }
    end
  elseif (item.pictures) then
    item.pictures.layers =  {
      table.unpack(item.pictures.layers),
      {
        filename = warhead.icon,
        size = 64,
        shift = shiftCalc,
        scale = 0.166
      },
      {
        filename = warhead.light,
        size = 64,
        shift = shiftCalc,
        scale = 0.166
      },
      {
        size = 128,
        filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
        scale = 0.125,
        shift = {0, -0.5}
      }
    }
  end
  local effect = table.deepcopy(explosion.explosion);
  if(setup.hasProjectile) then
    item.ammo_type.action.action_delivery.projectile = setup.baseName .. warhead.appendName .. explosion.appendName
  else
    if(setup.keepAction) then
      item.ammo_type.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}} .. {item.ammo_type.action}
    else
      item.ammo_type.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}}
    end
  end
  data:extend{item}
end

local function setupNukeRecipeFor(setup, warhead, explosion)
  local recipe = table.deepcopy(setup.recipe);
  recipe.name = setup.baseName .. warhead.appendName .. explosion.appendName
  recipe.result = setup.baseName .. warhead.appendName .. explosion.appendName
  local ingredients = setup.ingredients or {{setup.ingredient, 1}}
  if(warhead.explosion or warhead.explosions[1].appendName == explosion.appendName) then
    recipe.ingredients = {{warhead.name, 1}, table.unpack(explosion.ingedients), table.unpack(ingredients)}
  else
    recipe.ingredients = {{setup.baseName .. warhead.appendName .. warhead.explosions[1].appendName, 1}, table.unpack(explosion.ingedients)}
  end
  data:extend{recipe}
end

local function createItemProjRecipeFor(setup, w, e)
  if(setup.hasProjectile) then
    if(not data.raw.projectile[setup.baseName .. w.appendName .. e.appendName]) then
      createNukeProjectileFor(setup, w, e);
    end
  end
  if(not data.raw.ammo[setup.baseName .. w.appendName .. e.appendName]) then
    setupNukeItemFor(setup, w, e);
  end
  if(not data.raw.recipe[setup.baseName .. w.appendName .. e.appendName]) then
    setupNukeRecipeFor(setup, w, e);
  end
end

local function createNukesFor(setup)
  local ingredients
  if(setup.ingredient) then
    ingredients = {{setup.ingredient, 1}}
  else
    ingredients = setup.ingredients
  end
  local maxSizeInc
  if(type(setup.size) == "number") then
    maxSizeInc = setup.size
  else
    maxSizeInc = sizes[setup.size]
  end
  local minSizeExc = 0
  if(setup.minSize) then
    if(type(setup.minSize) == "number") then
      minSizeExc = setup.minSize
    else
      minSizeExc = sizes[setup.minSize]
    end
  end
  for _,w in pairs(yields) do
    if(w.preciseSize<=maxSizeInc and w.preciseSize>minSizeExc) then
      if(w.explosions) then
        for _,e in pairs(w.explosions) do
          createItemProjRecipeFor(setup, w, e)
        end
      else
        createItemProjRecipeFor(setup, w, {ingedients = {}, appendName = "", explosion = w.explosion, yield = w.yield})
      end
    end
  end
end




return {
  createNukesUtil = createNukesFor,
  warheads = warheads,
  sizes = sizes
};

