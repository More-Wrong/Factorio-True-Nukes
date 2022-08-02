local nuke_materials = require("data-nukes-material")
local nuke_explosions = require("data-nuke-explosions")

local dead = nuke_materials.deadMaterial
local boom = nuke_materials.boomMaterial
local small = nuke_materials.smallBoomMaterial
local light = nuke_materials.lightMaterial
local computer = nuke_materials.computer
local fusionMaterial = nuke_materials.fusionMaterial

local create_utils = require("__True-Nukes__.prototypes.warhead-system.warhead-creation-utils")




local createAppearance = create_utils.createAppearance
local createBasicWarhead = create_utils.createBasicWarhead
local tints = create_utils.tints

local warheads = {
  {
    name = "TN-warhead-0-1--1",
    order = "ya[TN-warhead-0-1--1]",
    appendName = "-atomic-0_1t",
    orderResult = "n-m-000001-1",
    target_type = "position",
    yield = "0_1t",
    size = "tiny",
    preciseSize = 6,
    explosion = nuke_explosions.N0_1t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.nothing, yield = "0_1t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    },
  },
  {
    name = "TN-warhead-0-1--2",
    order = "ya[TN-warhead-0-1--2]",
    appendName = "-atomic-0_1t",
    orderResult = "n-m-000001-2",
    target_type = "position",
    yield = "0_1t",
    size = "tiny",
    preciseSize = 3,
    explosion = nuke_explosions.N0_1t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.nothing, yield = "0_1t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-0_5t",
    orderResult = "n-m-000005-1",
    yield = "0_5t",
    size = "small",
    preciseSize = 12,
    explosion = nuke_explosions.N0_5t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "0_5t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-0_5t",
    orderResult = "n-m-000005-2",
    target_type = "position",
    yield = "0_5t",
    size = "tiny",
    preciseSize = 8,
    explosion = nuke_explosions.N0_5t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "0_5t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-2t",
    orderResult = "n-m-00002-1",
    target_type = "position",
    yield = "2t",
    size = "small",
    preciseSize = 18,
    explosion = nuke_explosions.N2t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.nothing, yield = "2t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-2t",
    orderResult = "n-m-00002-2",
    target_type = "position",
    yield = "2t",
    size = "small",
    preciseSize = 14,
    explosion = nuke_explosions.N2t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.californium, yield = "2t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-2t",
    orderResult = "n-m-00002-3",
    target_type = "position",
    yield = "2t",
    size = "tiny",
    preciseSize = 10,
    explosion = nuke_explosions.N2t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.californium, yield = "2t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-4t",
    orderResult = "n-m-00004-1",
    target_type = "position",
    yield = "4t",
    size = "medium",
    preciseSize = 24,
    explosion = nuke_explosions.N4t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "4t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-4t",
    orderResult = "n-m-00004-2",
    target_type = "position",
    yield = "4t",
    size = "small",
    preciseSize = 16,
    explosion = nuke_explosions.N4t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "4t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-8t",
    orderResult = "n-m-00008-1",
    target_type = "position",
    yield = "8t",
    size = "medium",
    preciseSize = 28,
    explosion = nuke_explosions.N8t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.nothing, yield = "8t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-8t",
    orderResult = "n-m-00008-2",
    target_type = "position",
    yield = "8t",
    size = "small",
    preciseSize = 18,
    explosion = nuke_explosions.N8t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.californium, yield = "8t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
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
    appendName = "-atomic-20t",
    orderResult = "n-m-00020-1",
    target_type = "position",
    yield = "20t",
    size = "large",
    preciseSize = 32,
    explosion = nuke_explosions.N20t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "20t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-20t",
    orderResult = "n-m-00020-2",
    target_type = "position",
    yield = "20t",
    size = "medium",
    preciseSize = 26,
    explosion = nuke_explosions.N20t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "20t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-20t",
    orderResult = "n-m-00020-3",
    target_type = "position",
    yield = "20t",
    size = "small",
    preciseSize = 20,
    explosion = nuke_explosions.N20t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.californium, yield = "20t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-500t",
    orderResult = "n-m-005-1",
    target_type = "position",
    yield = "500t",
    size = "large",
    preciseSize = 38,
    explosion = nuke_explosions.N500t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.nothing, yield = "500t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-500t",
    orderResult = "n-m-005-2",
    target_type = "position",
    yield = "500t",
    size = "large",
    preciseSize = 34,
    explosion = nuke_explosions.N500t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.nothing, yield = "500t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-500t",
    orderResult = "n-m-005-3",
    target_type = "position",
    yield = "500t",
    size = "medium",
    preciseSize = 28,
    explosion = nuke_explosions.N500t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "500t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-1kt",
    orderResult = "n-m-01-1",
    target_type = "position",
    yield = "1kt",
    size = "large",
    preciseSize = 40,
    explosion = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "1kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-1kt",
    orderResult = "n-m-01-2",
    target_type = "position",
    yield = "1kt",
    size = "large",
    preciseSize = 36,
    explosion = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "1kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-1kt",
    orderResult = "n-m-01-3",
    target_type = "position",
    yield = "1kt",
    size = "medium",
    preciseSize = 30,
    explosion = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "1kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-15kt",
    orderResult = "n-m-15-1",
    target_type = "position",
    yield = "15kt",
    size = "huge",
    preciseSize = 44,
    explosion = nuke_explosions.N15kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "15kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-15kt",
    orderResult = "n-m-15-2",
    target_type = "position",
    yield = "15kt",
    size = "large",
    preciseSize = 38,
    explosion = nuke_explosions.N15kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "15kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
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
    appendName = "-atomic-2-stage",
    target_type = "position",
    yield = "15kt+",
    size = "huge",
    preciseSize = 56,
    appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt+"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
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
    },
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        order = "n-t-0-015",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 2}},
        appendName = "-100kt",
        yield = "100kt",
        order = "n-t-0-100",
        explosion = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 20}},
        appendName = "-1Mt",
        yield = "1Mt",
        order = "n-t-1-001",
        explosion = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 100}},
        appendName = "-5Mt",
        yield = "5Mt",
        order = "n-t-1-005",
        explosion = nuke_explosions.N5Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 200}},
        appendName = "-10Mt",
        yield = "10Mt",
        order = "n-t-1-010",
        explosion = nuke_explosions.N10Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 1000}},
        appendName = "-50Mt",
        yield = "50Mt",
        order = "n-t-1-050",
        explosion = nuke_explosions.N50Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 2000}},
        appendName = "-100Mt",
        yield = "100Mt",
        order = "n-t-1-100",
        explosion = nuke_explosions.N100Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 20000}},
        appendName = "-1Gt",
        yield = "1Gt",
        order = "n-t-2-001",
        explosion = nuke_explosions.N1Gt_detonation
      }
    }
  },
  {
    name = "TN-warhead-big--2",
    order = "yd[TN-warhead-big--2]",
    appendName = "-atomic-2-stage",
    target_type = "position",
    yield = "15kt+",
    size = "huge",
    preciseSize = 46,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt+"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
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
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        order = "n-t-0-015",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 4}},
        appendName = "-100kt",
        yield = "100kt",
        order = "n-t-0-100",
        explosion = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 40}},
        appendName = "-1Mt",
        yield = "1Mt",
        order = "n-t-1-001",
        explosion = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 200}},
        appendName = "-5Mt",
        yield = "5Mt",
        order = "n-t-1-005",
        explosion = nuke_explosions.N5Mt_detonation
      }
    }
  },
  {
    name = "TN-warhead-big--3",
    order = "yd[TN-warhead-big--3]",
    appendName = "-atomic-2-stage",
    target_type = "position",
    yield = "15kt+",
    size = "large",
    preciseSize = 40,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.tritium , r2Tint = tints.uraniumLive, yield = "15kt+"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
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
    },
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        order = "n-t-0-015",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 8}},
        appendName = "-100kt",
        yield = "100kt",
        order = "n-t-0-100",
        explosion = nuke_explosions.N100kt_detonation
      }
    }
  }
}




for _,setup in pairs(warheads) do
  createBasicWarhead(setup);
  table.insert(warheadResults, setup)
end



-- this is the material to add cluster bombs - I'm just not sure they're that good...

----function genericClusterProjectile(setup)
----  local name = "TN-nuke-projectile-" .. setup.name
----  if (not data.raw.projectile[name]) then
----    data:extend({
----      {
----        type = "projectile",
----        name = name,
----        flags = {"not-on-map"},
----        acceleration = 0,
----        direction_only = true,
----        action =
----        {
----          type = "direct",
----          action_delivery =
----          {
----            type = "instant",
----            target_effects = setup.effects
----          }
----        },
----        animation = {
----          filename = "__core__/graphics/empty.png",
----          width = 1,
----          frame_count = 1,
----          height = 1
----        },
----      }
----    })
----  end
----  return name
----end
----
----function generalCluster(size, count, radius, explosions)
----  return {
----    type = "nested-result",
----    action =
----    {
----      type = "area",
----      target_entities = false,
----      trigger_from_target = true,
----      repeat_count = count,
----      radius = radius,
----      action_delivery =
----      {
----        type = "projectile",
----        projectile = genericClusterProjectile({name = size, effects = explosions}),
----        starting_speed = 0.6 * 0.8,
----        starting_speed_deviation = 0.1,
----        max_range = radius/2,
----        range_deviation = radius/4,
----      }
----    }
----  }
----end

local clusters = {
  --  {
  --    name = "TN-warhead-0-1--1x4",
  --    order = "yz[TN-warhead-0-1--1x4]",
  --    yield = "0_1tx4",
  --    size = "small",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0x4", light_name = "core-0x4", yield = "0_1tx4"}),
  --    stack_size = 20,
  --    time = 10,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-0-1--1", 4},
  --      {computer, 2},
  --      {"explosives", 2}
  --    }
  --  },
  --  {
  --    name = "TN-warhead-0-1--1x10",
  --    order = "yz[TN-warhead-0-1--1x10]",
  --    yield = "0_1tx10",
  --    size = "medium",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0x10", light_name = "core-0x10", yield = "0_1tx10"}),
  --    stack_size = 5,
  --    time = 20,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-0-1--1", 10},
  --      {computer, 5},
  --      {"explosives", 10}
  --    }
  --  },
  --  {
  --    name = "TN-warhead-0-1--1x20",
  --    order = "yz[TN-warhead-0-1--1x20]",
  --    yield = "0_1tx20",
  --    size = "large",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-0x20", light_name = "core-1x20", yield = "0_1tx20"}),
  --    stack_size = 10,
  --    time = 30,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-0-1--1", 20},
  --      {computer, 5},
  --      {"explosives", 20}
  --    }
  --  },
  --
  --
  --  {
  --    name = "TN-warhead-0-5--2x4",
  --    order = "yz[TN-warhead-0-5--2x4]",
  --    yield = "0_5tx4",
  --    size = "small",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1x4", light_name = "core-1x4", yield = "0_5tx4"}),
  --    stack_size = 10,
  --    time = 30,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-0-5--2", 4},
  --      {computer, 5},
  --      {"explosives", 2}
  --    }
  --  },
  --  {
  --    name = "TN-warhead-0-5--2x10",
  --    order = "yz[TN-warhead-0-5--2x10]",
  --    yield = "0_5tx10",
  --    size = "medium",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1x10", light_name = "core-1x10", yield = "0_5tx10"}),
  --    stack_size = 5,
  --    time = 40,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-0-5--2", 10},
  --      {computer, 12},
  --      {"explosives", 10}
  --    }
  --  },
  --
  --  {
  --    name = "TN-warhead-0-5--1x20",
  --    order = "yz[TN-warhead-0-5--1x20]",
  --    yield = "0_5tx20",
  --    size = "large",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yy-1x20", light_name = "core-1x20", yield = "0_5tx20"}),
  --    stack_size = 1,
  --    time = 30,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-0-5--1", 20},
  --      {computer, 25},
  --      {"explosives", 30}
  --    }
  --  },
  --
  --
  --  {
  --    name = "TN-warhead-2--1x6",
  --    order = "yz[TN-warhead-2--1x6]",
  --    yield = "2tx6",
  --    size = "large",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-0x6", light_name = "core-0x6", yield = "2tx6"}),
  --    stack_size = 10,
  --    time = 25,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-2--1", 6},
  --      {computer, 15},
  --      {"explosives", 25}
  --    }
  --  },
  --
  --  {
  --    name = "TN-warhead-4--2x6",
  --    order = "yz[TN-warhead-4--2x6]",
  --    yield = "4tx6",
  --    size = "large",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-yg-1x6", light_name = "core-1x6", yield = "4tx6"}),
  --    stack_size = 5,
  --    time = 45,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-4--2", 6},
  --      {computer, 30},
  --      {"explosives", 25}
  --    }
  --  },
  --
  --
  --  {
  --    name = "TN-warhead-8--1x4",
  --    order = "yz[TN-warhead-8--1x4]",
  --    yield = "8tx4",
  --    size = "large",
  --    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "core-gy-0x4", light_name = "core-0x4", yield = "8tx4"}),
  --    stack_size = 10,
  --    time = 30,
  --    amount = 1,
  --    ingredients = {
  --      {"TN-warhead-8--1", 4},
  --      {computer, 20},
  --      {"explosives", 45}
  --    }
  --  }
  }

--for _,setup in pairs(clusters) do
--  createBasicWarhead(setup);
--end

