local nuke_materials = require("data-nukes-material")
local nuke_explosions = require("data-nuke-explosions")
require("__True-Nukes__.prototypes.warhead-system.warheads")

local dead = nuke_materials.deadMaterial
local boom = nuke_materials.boomMaterial
local small = nuke_materials.smallBoomMaterial
local light = nuke_materials.lightMaterial
local computer = nuke_materials.computer
local fusionMaterial = nuke_materials.fusionMaterial

local create_utils = require("__True-Nukes__.prototypes.warhead-old.warhead-creation-utils")


local createAppearance = create_utils.createAppearance
local createBasicWarhead = create_utils.createBasicWarhead
local tints = create_utils.tints


log("adding")
table.insert(warheads,
  {
    name = "TN-warhead-0-1--1",
    order = "ya[TN-warhead-0-1--1]",
    appendName = "-atomic-0_1t",
    appendOrder = "n-m-000001-1",
    target_type = "position",
    size = "tiny",
    preciseSize = 6,
    final_effect = nuke_explosions.N0_1t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.nothing, yield = "0_1t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 100,
    energy_required = 100,
    clamp_position = true,
    recipe_result_count = 10,
    ingredients = {
      {"steel-plate", 2},
      {light, 10},
      {computer, 2},
      {"explosives", 2},
      {dead, 4},
      {small, 10},
    },
  })
table.insert(warheads,
  {
    name = "TN-warhead-0-1--2",
    order = "ya[TN-warhead-0-1--2]",
    appendName = "-atomic-0_1t",
    appendOrder = "n-m-000001-2",
    target_type = "position",
    size = "tiny",
    preciseSize = 3,
    final_effect = nuke_explosions.N0_1t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.nothing, yield = "0_1t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 200,
    energy_required = 200,
    clamp_position = true,
    recipe_result_count = 5,
    ingredients = {
      {light, 10},
      {computer, 2},
      {"explosives", 2},
      {dead, 1},
      {small, 8},
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-0-5--1",
    order = "ya[TN-warhead-0-5--1]",
    appendName = "-atomic-0_5t",
    appendOrder = "n-m-000005-1",
    target_type = "position",
    size = "small",
    preciseSize = 12,
    final_effect = nuke_explosions.N0_5t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "0_5t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 100,
    energy_required = 150,
    clamp_position = true,
    amount = 6,
    ingredients = {
      {"steel-plate", 1},
      {light, 12},
      {computer, 3},
      {"explosives", 3},
      {dead, 4},
      {small, 12}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-0-5--2",
    order = "ya[TN-warhead-0-5--2]",
    appendName = "-atomic-0_5t",
    appendOrder = "n-m-000005-2",
    target_type = "position",
    size = "tiny",
    preciseSize = 8,
    final_effect = nuke_explosions.N0_5t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "0_5t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 100,
    energy_required = 150,
    clamp_position = true,
    amount = 3,
    ingredients = {
      {light, 9},
      {computer, 3},
      {"explosives", 2},
      {dead, 1},
      {small, 9}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-2--1",
    order = "ya[TN-warhead-2--1]",
    appendName = "-atomic-2t",
    appendOrder = "n-m-00002-1",
    target_type = "position",
    size = "small",
    preciseSize = 18,
    final_effect = nuke_explosions.N2t_detonation,

    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.nothing, yield = "2t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 20,
    energy_required = 20,
    clamp_position = true,
    ingredients = {
      {"steel-plate", 2},
      {computer, 5},
      {"explosives", 5},
      {dead, 3},
      {boom, 3},
      {small, 4}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-2--2",
    order = "ya[TN-warhead-2--2]",
    appendName = "-atomic-2t",
    appendOrder = "n-m-00002-2",
    target_type = "position",
    size = "small",
    preciseSize = 14,
    final_effect = nuke_explosions.N2t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.californium, yield = "2t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 20,
    energy_required = 60,
    clamp_position = true,
    ingredients = {
      {"steel-plate", 1},
      {light, 4},
      {computer, 10},
      {"explosives", 4},
      {dead, 2},
      {boom, 1},
      {small, 8}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-2--3",
    order = "ya[TN-warhead-2--3]",
    appendName = "-atomic-2t",
    appendOrder = "n-m-00002-3",
    target_type = "position",
    size = "tiny",
    preciseSize = 10,
    final_effect = nuke_explosions.N2t_detonation,

    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.californium, r2Tint = tints.californium, yield = "2t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 20,
    energy_required = 120,
    clamp_position = true,
    ingredients = {
      {light, 10},
      {computer, 15},
      {"explosives", 2},
      {small, 15}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-4--1",
    order = "yb[TN-warhead-04--1]",
    appendName = "-atomic-4t",
    appendOrder = "n-m-00004-1",
    target_type = "position",
    size = "medium",
    preciseSize = 24,
    final_effect = nuke_explosions.N4t_detonation,

    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "4t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 10,
    energy_required = 30,
    ingredients = {
      {"steel-plate", 4},
      {computer, 5},
      {"explosives", 10},
      {dead, 5},
      {boom, 8}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-4--2",
    order = "yb[TN-warhead-04--2]",
    appendName = "-atomic-4t",
    appendOrder = "n-m-00004-2",
    target_type = "position",
    size = "small",
    preciseSize = 16,
    final_effect = nuke_explosions.N4t_detonation,

    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.uraniumDead, yield = "4t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 10,
    energy_required = 90,
    ingredients = {
      {light, 15},
      {computer, 12},
      {"explosives", 5},
      {boom, 2},
      {small, 20}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-8--1",
    order = "yb[TN-warhead-08--1]",
    appendName = "-atomic-8t",
    appendOrder = "n-m-00008-1",
    target_type = "position",
    size = "medium",
    preciseSize = 28,

    final_effect = nuke_explosions.N8t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.nothing, yield = "8t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 10,
    energy_required = 40,
    ingredients = {
      {"steel-plate", 6},
      {computer, 5},
      {"explosives", 20},
      {dead, 10},
      {boom, 15}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-8--2",
    order = "yb[TN-warhead-08--2]",
    appendName = "-atomic-8t",
    appendOrder = "n-m-00008-2",
    target_type = "position",
    size = "small",
    preciseSize = 18,

    final_effect = nuke_explosions.N8t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.californium, yield = "8t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 10,
    energy_required = 90,
    ingredients = {
      {light, 20},
      {computer, 18},
      {"explosives", 8},
      {boom, 2},
      {small, 30}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-20--1",
    order = "yb[TN-warhead-20--1]",
    appendName = "-atomic-20t",
    appendOrder = "n-m-00020-1",
    target_type = "position",
    size = "large",
    preciseSize = 32,

    final_effect = nuke_explosions.N20t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "20t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 5,
    energy_required = 60,
    ingredients = {
      {"steel-plate", 10},
      {computer, 8},
      {"explosives", 30},
      {dead, 15},
      {boom, 30}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-20--2",
    order = "yb[TN-warhead-20--2]",
    appendName = "-atomic-20t",
    appendOrder = "n-m-00020-2",
    target_type = "position",

    size = "medium",
    preciseSize = 26,
    final_effect = nuke_explosions.N20t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "20t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 5,
    energy_required = 150,
    ingredients = {
      {light, 20},
      {computer, 20},
      {"explosives", 15},
      {dead, 5},
      {boom, 20},
      {small, 5}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-20--3",
    order = "yb[TN-warhead-20--3]",
    appendName = "-atomic-20t",
    appendOrder = "n-m-00020-3",
    target_type = "position",

    size = "small",
    preciseSize = 20,
    final_effect = nuke_explosions.N20t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.californium, r2Tint = tints.californium, yield = "20t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    stack_size = 5,
    energy_required = 360,
    ingredients = {
      {light, 50},
      {computer, 40},
      {"explosives", 5},
      {boom, 6},
      {small, 45}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-500--1",
    order = "yc[TN-warhead-00500--1]",
    appendName = "-atomic-500t",
    appendOrder = "n-m-005-1",
    target_type = "position",

    size = "large",
    preciseSize = 38,
    final_effect = nuke_explosions.N500t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.nothing, yield = "500t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 90,
    ingredients = {
      {"steel-plate", 20},
      {computer, 10},
      {"explosives", 40},
      {dead, 25},
      {boom, 75}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-500--2",
    order = "yc[TN-warhead-00500--2]",
    appendName = "-atomic-500t",
    appendOrder = "n-m-005-2",
    target_type = "position",

    size = "large",
    preciseSize = 34,
    final_effect = nuke_explosions.N500t_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.nothing, yield = "500t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 210,
    ingredients = {
      {"steel-plate", 5},
      {light, 15},
      {computer, 20},
      {"explosives", 25},
      {dead, 15},
      {boom, 100},
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-500--3",
    order = "yc[TN-warhead-00500--3]",
    appendName = "-atomic-500t",
    appendOrder = "n-m-005-3",
    target_type = "position",

    size = "medium",
    preciseSize = 28,
    final_effect = nuke_explosions.N500t_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "500t"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 360,
    ingredients = {
      {light, 50},
      {computer, 50},
      {"explosives", 10},
      {boom, 50},
      {small, 60}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-1k--1",
    order = "yc[TN-warhead-01k--1]",
    appendName = "-atomic-1kt",
    appendOrder = "n-m-01-1",
    target_type = "position",

    size = "large",
    preciseSize = 40,
    final_effect = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "1kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 120,
    ingredients = {
      {"steel-plate", 25},
      {computer, 20},
      {"explosives", 100},
      {dead, 25},
      {boom, 100}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-1k--2",
    order = "yc[TN-warhead-01k--2]",
    appendName = "-atomic-1kt",
    appendOrder = "n-m-01-2",
    target_type = "position",

    size = "large",
    preciseSize = 36,
    final_effect = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumDead, yield = "1kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 300,
    ingredients = {
      {"steel-plate", 8},
      {light, 20},
      {computer, 45},
      {"explosives", 50},
      {dead, 5},
      {boom, 115},
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-1k--3",
    order = "yc[TN-warhead-01k--3]",
    appendName = "-atomic-1kt",
    appendOrder = "n-m-01-3",
    target_type = "position",

    size = "medium",
    preciseSize = 30,
    final_effect = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.californium, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "1kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 600,
    ingredients = {
      {light, 75},
      {computer, 100},
      {"red-wire", 20},
      {"explosives", 20},
      {boom, 80},
      {small, 80}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-15k--1",
    order = "yc[TN-warhead-15k--1]",
    appendName = "-atomic-15kt",
    appendOrder = "n-m-15-1",
    target_type = "position",

    size = "huge",
    preciseSize = 44,
    final_effect = nuke_explosions.N1kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "15kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 180,
    ingredients = {
      {"steel-plate", 30},
      {computer, 60},
      {"red-wire", 5},
      {"green-wire", 5},
      {"explosives", 175},
      {dead, 150},
      {boom, 250}
    }
  })
table.insert(warheads,
  {
    name = "TN-warhead-15k--2",
    order = "yc[TN-warhead-15k--2]",
    appendName = "-atomic-15kt",
    appendOrder = "n-m-15-2",
    target_type = "position",

    size = "large",
    preciseSize = 38,
    final_effect = nuke_explosions.N15kt_detonation,
    appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.uraniumLive , r2Tint = tints.uraniumLive, yield = "15kt"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    stack_size = 1,
    energy_required = 480,
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
  })
table.insert(warheads,
  {
    name = "TN-warhead-big--1",
    order = "yd[TN-warhead-big--1]",
    appendName = "-atomic-2-stage",
    appendOrder = "n-t",
    target_type = "position",
    size = "huge",
    preciseSize = 56,
    final_effect = nuke_explosions.N15kt_detonation,
    appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt+"}),
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    stack_size = 1,
    energy_required = 180,
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
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt"}),
        appendOrder = "-0-015",
        final_effect = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 2}},
        appendName = "-100kt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "100kt"}),
        appendOrder = "-0-100",
        final_effect = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 20}},
        appendName = "-1Mt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "1Mt"}),
        appendOrder = "-1-001",
        final_effect = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 100}},
        appendName = "-5Mt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "5Mt"}),
        appendOrder = "-1-005",
        final_effect = nuke_explosions.N5Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 200}},
        appendName = "-10Mt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "10Mt"}),
        appendOrder = "-1-010",
        final_effect = nuke_explosions.N10Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 1000}},
        appendName = "-50Mt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "50Mt"}),
        appendOrder = "-1-050",
        final_effect = nuke_explosions.N50Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 2000}},
        appendName = "-100Mt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "100Mt"}),
        appendOrder = "-1-100",
        final_effect = nuke_explosions.N100Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 20000}},
        appendName = "-1Gt",
        appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "1Gt"}),
        appendOrder = "-2-001",
        final_effect = nuke_explosions.N1Gt_detonation
      }
    }
  })

table.insert(warheads, {
  name = "TN-warhead-big--2",
  order = "yd[TN-warhead-big--2]",
  appendName = "-atomic-2-stage",
  appendOrder = "n-t",
  target_type = "position",
  size = "huge",
  preciseSize = 46,
  appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt+"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
  stack_size = 1,
  energy_required = 300,
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
      appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt"}),
      appendOrder = "-0-015",
      final_effect = nuke_explosions.N15kt_detonation
    },
    {
      ingedients = {{fusionMaterial, 4}},
      appendName = "-100kt",
      appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "100kt"}),
      appendOrder = "-0-100",
      final_effect = nuke_explosions.N100kt_detonation
    },
    {
      ingedients = {{fusionMaterial, 40}},
      appendName = "-1Mt",
      appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "1Mt"}),
      appendOrder = "-1-001",
      final_effect = nuke_explosions.N1Mt_detonation
    },
    {
      ingedients = {{fusionMaterial, 200}},
      appendName = "-5Mt",
      appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "5Mt"}),
      appendOrder = "-1-005",
      final_effect = nuke_explosions.N5Mt_detonation
    }
  }
})
table.insert(warheads, {
  name = "TN-warhead-big--3",
  order = "yd[TN-warhead-big--3]",
  appendName = "-atomic-2-stage",
  appendOrder = "n-t",
  target_type = "position",
  size = "large",
  preciseSize = 40,
  appearance = createAppearance({topTint = tints.uraniumLive, r1Tint = tints.tritium , r2Tint = tints.uraniumLive, yield = "15kt+"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
  stack_size = 1,
  energy_required = 720,
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
      appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "15kt"}),
      appendOrder = "-0-015",
      final_effect = nuke_explosions.N15kt_detonation
    },
    {
      ingedients = {{fusionMaterial, 8}},
      appendName = "-100kt",
      appearance = createAppearance({topTint = tints.tritium, r1Tint = tints.tritium , r2Tint = tints.tritium, yield = "100kt"}),
      appendOrder = "-0-100",
      final_effect = nuke_explosions.N100kt_detonation
    }
  }
})




--for _,setup in pairs(warheads) do
--  createBasicWarhead(setup);
--  table.insert(warheadResults, setup)
--end



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
  --    energy_required = 10,
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
  --    energy_required = 20,
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
  --    energy_required = 30,
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
  --    energy_required = 30,
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
  --    energy_required = 40,
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
  --    energy_required = 30,
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
  --    energy_required = 25,
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
  --    energy_required = 45,
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
  --    energy_required = 30,
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

