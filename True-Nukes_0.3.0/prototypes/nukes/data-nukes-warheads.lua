local nuke_materials = require("data-nukes-material")

local dead = nuke_materials.deadMaterial
local boom = nuke_materials.boomMaterial
local small = nuke_materials.smallBoomMaterial
local light = "low-density-structure"
local computer = "processing-unit"


local function createAppearance(setup)
  local light_name = setup.light_name or setup.icon_name
  return {
    icon = setup.location .. setup.icon_name .. ".png",
    recipe_icon = setup.location .. setup.icon_name .. ".png",
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
    icon = setup.appearance.icon,
    pictures = setup.appearance.pictures,
    icon_size = 64,
    subgroup = "TN-" .. setup.size .. "-nuclear-weapon-cores",
    order = setup.order,
    stack_size = setup.stack_size
  }
  local recipe = {
    type = "recipe",
    name = setup.name,
    icon_size = 64,
    icon = setup.appearance.recipe_icon,
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
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0", light_name = "core-0"}),
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
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0", light_name = "core-0"}),
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
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1", light_name = "core-1"}),
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
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1", light_name = "core-1"}),
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
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-0", light_name = "core-0"}),
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
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-2", light_name = "core-2"}),
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
    size = "tiny",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-2", light_name = "core-2"}),
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
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-1", light_name = "core-1"}),
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
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-1", light_name = "core-1"}),
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
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-0", light_name = "core-0"}),
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
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-2", light_name = "core-2"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-1", light_name = "core-1"}),
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
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-1", light_name = "core-1"}),
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
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-2", light_name = "core-2"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-0", light_name = "core-0"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-0", light_name = "core-0"}),
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
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-2", light_name = "core-2"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-1", light_name = "core-1"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-1", light_name = "core-1"}),
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
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-2", light_name = "core-2"}),
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
    size = "huge",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-2", light_name = "core-2"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gg-2", light_name = "core-2"}),
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
    size = "huge",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-bb-2", light_name = "core-2"}),
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
    size = "huge",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gb-2", light_name = "core-2"}),
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
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gb-1", light_name = "core-1"}),
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
