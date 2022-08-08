local nuke_materials = require("data-nukes-material")
local nuke_explosions = require("data-nuke-explosions")

local dead = nuke_materials.deadMaterial
local boom = nuke_materials.boomMaterial
local small = nuke_materials.smallBoomMaterial
local light = nuke_materials.lightMaterial
local computer = nuke_materials.computer
local fusionMaterial = nuke_materials.fusionMaterial

local create_utils = require("__True-Nukes__.prototypes.warhead-system.sprite-assembly-util")


local createAppearance = create_utils.createAppearance
local tints = create_utils.tints


warheads["TN-warhead-0-1--1"] = {
  name = "TN-warhead-0-1--1",
  appendName = "-atomic-0_1t",
  appendOrder = "x-n-a-m-000001-1",
  target_type = "position",
  size = "tiny",
  preciseSize = 6,
  final_effect = nuke_explosions.N0_1t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.californium, tints.nothing}, text = "0_1t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
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
}
warheads["TN-warhead-0-1--2"] = {
  name = "TN-warhead-0-1--2",
  appendName = "-atomic-0_1t",
  appendOrder = "x-n-a-m-000001-2",
  target_type = "position",
  size = "tiny",
  preciseSize = 3,
  final_effect = nuke_explosions.N0_1t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.californium, tints.nothing}, text = "0_1t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 200,
  energy_required = 200,
--  clamp_position = true,
  recipe_result_count = 5,
  ingredients = {
    {light, 10},
    {computer, 2},
    {"explosives", 2},
    {dead, 1},
    {small, 8},
  }
}
warheads["TN-warhead-0-5--1"] = {
  name = "TN-warhead-0-5--1",
  appendName = "-atomic-0_5t",
  appendOrder = "x-n-a-m-000005-1",
  target_type = "position",
  size = "small",
  preciseSize = 12,
  final_effect = nuke_explosions.N0_5t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.californium, tints.uraniumDead}, text = "0_5t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
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
}
warheads["TN-warhead-0-5--2"] = {
  name = "TN-warhead-0-5--2",
  appendName = "-atomic-0_5t",
  appendOrder = "x-n-a-m-000005-2",
  target_type = "position",
  size = "tiny",
  preciseSize = 8,
  final_effect = nuke_explosions.N0_5t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.californium, tints.uraniumDead}, text = "0_5t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
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
}
warheads["TN-warhead-2--1"] = {
  name = "TN-warhead-2--1",
  appendName = "-atomic-2t",
  appendOrder = "x-n-a-m-00002-1",
  target_type = "position",
  size = "small",
  preciseSize = 18,
  final_effect = nuke_explosions.N2t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.californium, tints.nothing}, text = "2t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
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
}
warheads["TN-warhead-2--2"] = {
  name = "TN-warhead-2--2",
  appendName = "-atomic-2t",
  appendOrder = "x-n-a-m-00002-2",
  target_type = "position",
  size = "small",
  preciseSize = 14,
  final_effect = nuke_explosions.N2t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.californium, tints.californium}, text = "2t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
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
}
warheads["TN-warhead-2--3"] = {
  name = "TN-warhead-2--3",
  appendName = "-atomic-2t",
  appendOrder = "x-n-a-m-00002-3",
  target_type = "position",
  size = "tiny",
  preciseSize = 10,
  final_effect = nuke_explosions.N2t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.californium, tints.californium}, text = "2t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 20,
  energy_required = 120,
  clamp_position = true,
  ingredients = {
    {light, 10},
    {computer, 15},
    {"explosives", 2},
    {small, 15}
  }
}
warheads["TN-warhead-4--1"] = {
  name = "TN-warhead-4--1",
  appendName = "-atomic-4t",
  appendOrder = "x-n-a-m-00004-1",
  target_type = "position",
  size = "medium",
  preciseSize = 24,
  final_effect = nuke_explosions.N4t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.californium, tints.uraniumDead}, text = "4t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 10,
  energy_required = 30,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 4},
    {computer, 5},
    {"explosives", 10},
    {dead, 5},
    {boom, 8}
  }
}
warheads["TN-warhead-4--2"] = {
  name = "TN-warhead-4--2",
  appendName = "-atomic-4t",
  appendOrder = "x-n-a-m-00004-2",
  target_type = "position",
  size = "small",
  preciseSize = 16,
  final_effect = nuke_explosions.N4t_detonation,

  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.californium, tints.uraniumDead}, text = "4t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 10,
  energy_required = 90,
  clamp_position = true,
  ingredients = {
    {light, 15},
    {computer, 12},
    {"explosives", 5},
    {boom, 2},
    {small, 20}
  }
}
warheads["TN-warhead-8--1"] = {
  name = "TN-warhead-8--1",
  appendName = "-atomic-8t",
  appendOrder = "x-n-a-m-00008-1",
  target_type = "position",
  size = "medium",
  preciseSize = 28,

  final_effect = nuke_explosions.N8t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.uraniumLive, tints.nothing}, text = "8t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 10,
  energy_required = 40,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 6},
    {computer, 5},
    {"explosives", 20},
    {dead, 10},
    {boom, 15}
  }
}
warheads["TN-warhead-8--2"] = {
  name = "TN-warhead-8--2",
  appendName = "-atomic-8t",
  appendOrder = "x-n-a-m-00008-2",
  target_type = "position",
  size = "small",
  preciseSize = 18,

  final_effect = nuke_explosions.N8t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.californium, tints.californium}, text = "8t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 10,
  energy_required = 90,
  clamp_position = true,
  ingredients = {
    {light, 20},
    {computer, 18},
    {"explosives", 8},
    {boom, 2},
    {small, 30}
  }
}
warheads["TN-warhead-20--1"] = {
  name = "TN-warhead-20--1",
  appendName = "-atomic-20t",
  appendOrder = "x-n-a-m-00020-1",
  target_type = "position",
  size = "large",
  preciseSize = 32,

  final_effect = nuke_explosions.N20t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.uraniumLive, tints.uraniumDead}, text = "20t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 5,
  energy_required = 60,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 10},
    {computer, 8},
    {"explosives", 30},
    {dead, 15},
    {boom, 30}
  }
}
warheads["TN-warhead-20--2"] = {
  name = "TN-warhead-20--2",
  appendName = "-atomic-20t",
  appendOrder = "x-n-a-m-00020-2",
  target_type = "position",

  size = "medium",
  preciseSize = 26,
  final_effect = nuke_explosions.N20t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.uraniumLive, tints.uraniumDead}, text = "20t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 5,
  energy_required = 150,
  ingredients = {
    {light, 20},
    {computer, 20},
    {"explosives", 15},
    {dead, 5},
    {boom, 50}
  }
}
warheadWeaponNameMap["big-rocket-atomic-20t"] = "atomic-bomb"

warheads["TN-warhead-20--3"] = {
  name = "TN-warhead-20--3",
  appendName = "-atomic-20t",
  appendOrder = "x-n-a-m-00020-3",
  target_type = "position",

  size = "small",
  preciseSize = 20,
  final_effect = nuke_explosions.N20t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.californium, tints.californium}, text = "20t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 5,
  energy_required = 360,
  clamp_position = true,
  ingredients = {
    {light, 50},
    {computer, 40},
    {"explosives", 5},
    {boom, 5},
    {small, 45}
  }
}
warheads["TN-warhead-500--1"] = {
  name = "TN-warhead-500--1",
  appendName = "-atomic-500t",
  appendOrder = "x-n-a-m-005-1",
  target_type = "position",

  size = "large",
  preciseSize = 38,
  final_effect = nuke_explosions.N500t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.uraniumLive, tints.nothing}, text = "500t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 90,
  ingredients = {
    {"steel-plate", 20},
    {computer, 10},
    {"explosives", 40},
    {dead, 25},
    {boom, 75}
  }
}
warheads["TN-warhead-500--2"] = {
  name = "TN-warhead-500--2",
  appendName = "-atomic-500t",
  appendOrder = "x-n-a-m-005-2",
  target_type = "position",

  size = "large",
  preciseSize = 34,
  final_effect = nuke_explosions.N500t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.uraniumLive, tints.nothing}, text = "500t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 210,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 5},
    {light, 15},
    {computer, 20},
    {"explosives", 25},
    {dead, 15},
    {boom, 100},
  }
}
warheads["TN-warhead-500--3"] = {
  name = "TN-warhead-500--3",
  appendName = "-atomic-500t",
  appendOrder = "x-n-a-m-005-3",
  target_type = "position",

  size = "medium",
  preciseSize = 28,
  final_effect = nuke_explosions.N500t_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.uraniumLive, tints.uraniumLive}, text = "500t"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 360,
  clamp_position = true,
  ingredients = {
    {light, 50},
    {computer, 50},
    {"explosives", 10},
    {boom, 50},
    {small, 60}
  }
}
warheads["TN-warhead-1k--1"] = {
  name = "TN-warhead-1k--1",
  appendName = "-atomic-1kt",
  appendOrder = "x-n-a-m-01-1",
  target_type = "position",

  size = "large",
  preciseSize = 40,
  final_effect = nuke_explosions.N1kt_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.uraniumLive, tints.uraniumDead}, text = "1kt"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 120,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 25},
    {computer, 20},
    {"explosives", 100},
    {dead, 25},
    {boom, 100}
  }
}
warheads["TN-warhead-1k--2"] = {
  name = "TN-warhead-1k--2",
  appendName = "-atomic-1kt",
  appendOrder = "x-n-a-m-01-2",
  target_type = "position",

  size = "large",
  preciseSize = 36,
  final_effect = nuke_explosions.N1kt_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.uraniumLive, tints.uraniumDead}, text = "1kt"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 300,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 8},
    {light, 20},
    {computer, 45},
    {"explosives", 50},
    {dead, 5},
    {boom, 115},
  }
}
warheads["TN-warhead-1k--3"] = {
  name = "TN-warhead-1k--3",
  appendName = "-atomic-1kt",
  appendOrder = "x-n-a-m-01-3",
  target_type = "position",

  size = "medium",
  preciseSize = 30,
  final_effect = nuke_explosions.N1kt_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.californium, tints.uraniumLive, tints.uraniumLive}, text = "1kt"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 600,
  clamp_position = true,
  ingredients = {
    {light, 75},
    {computer, 100},
    {"red-wire", 20},
    {"explosives", 20},
    {boom, 80},
    {small, 80}
  }
}
warheads["TN-warhead-15k--1"] = {
  name = "TN-warhead-15k--1",
  appendName = "-atomic-15kt",
  appendOrder = "x-n-a-m-15-1",
  target_type = "position",

  size = "huge",
  preciseSize = 44,
  final_effect = nuke_explosions.N1kt_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.uraniumLive, tints.uraniumLive}, text = "15kt"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 180,
  clamp_position = true,
  ingredients = {
    {"steel-plate", 30},
    {computer, 60},
    {"red-wire", 5},
    {"green-wire", 5},
    {"explosives", 175},
    {dead, 150},
    {boom, 250}
  }
}
warheads["TN-warhead-15k--2"] = {
  name = "TN-warhead-15k--2",
  appendName = "-atomic-15kt",
  appendOrder = "x-n-a-m-15-2",
  target_type = "position",

  size = "large",
  preciseSize = 38,
  final_effect = nuke_explosions.N15kt_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.uraniumLive, tints.uraniumLive}, text = "15kt"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 480,
  clamp_position = true,
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
}
warheads["TN-warhead-big--1"] = {
  name = "TN-warhead-big--1",
  appendName = "-atomic-2-stage",
  appendOrder = "x-n-a-t",
  target_type = "position",
  size = "huge",
  preciseSize = 56,
  final_effect = nuke_explosions.N15kt_detonation,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "15kt+"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 180,
  clamp_position = true,
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
      additional_ingedients = {},
      appendName = "-15kt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "15kt"}),
      appendOrder = "-0-015",
      final_effect = nuke_explosions.N15kt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 2}},
      appendName = "-100kt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "100kt"}),
      appendOrder = "-0-100",
      final_effect = nuke_explosions.N100kt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 20}},
      appendName = "-1Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "1Mt"}),
      appendOrder = "-1-001",
      final_effect = nuke_explosions.N1Mt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 100}},
      appendName = "-5Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "5Mt"}),
      appendOrder = "-1-005",
      final_effect = nuke_explosions.N5Mt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 200}},
      appendName = "-10Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "10Mt"}),
      appendOrder = "-1-010",
      final_effect = nuke_explosions.N10Mt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 1000}},
      appendName = "-50Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "50Mt"}),
      appendOrder = "-1-050",
      final_effect = nuke_explosions.N50Mt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 2000}},
      appendName = "-100Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "100Mt"}),
      appendOrder = "-1-100",
      final_effect = nuke_explosions.N100Mt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 20000}},
      appendName = "-1Gt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.tritium, tints.tritium, tints.tritium}, text = "1Gt"}),
      appendOrder = "-2-001",
      final_effect = nuke_explosions.N1Gt_detonation
    }
  }
}

warheads["TN-warhead-big--2"] = {
  name = "TN-warhead-big--2",
  appendName = "-atomic-2-stage",
  appendOrder = "x-n-a-t",
  target_type = "position",
  size = "huge",
  preciseSize = 46,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.tritium}, text = "15kt+"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 300,
  clamp_position = true,
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
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.tritium}, text = "15kt"}),
      appendOrder = "-0-015",
      final_effect = nuke_explosions.N15kt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 4}},
      appendName = "-100kt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.tritium}, text = "100kt"}),
      appendOrder = "-0-100",
      final_effect = nuke_explosions.N100kt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 40}},
      appendName = "-1Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.tritium}, text = "1Mt"}),
      appendOrder = "-1-001",
      final_effect = nuke_explosions.N1Mt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 200}},
      appendName = "-5Mt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.tritium}, text = "5Mt"}),
      appendOrder = "-1-005",
      final_effect = nuke_explosions.N5Mt_detonation
    }
  }
}
warheads["TN-warhead-big--3"] = {
  name = "TN-warhead-big--3",
  appendName = "-atomic-2-stage",
  appendOrder = "x-n-a-t",
  target_type = "position",
  size = "large",
  preciseSize = 40,
  appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.uraniumLive}, text = "15kt+"}),
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
  range_modifier = 2,
  cooldown_modifier = 5,
  stack_size = 1,
  energy_required = 720,
  clamp_position = true,
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
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.uraniumLive}, text = "15kt"}),
      appendOrder = "-0-015",
      final_effect = nuke_explosions.N15kt_detonation
    },
    {
      additional_ingedients = {{fusionMaterial, 8}},
      appendName = "-100kt",
      appearance = createAppearance({type = "nuclear_core", version = 1, tints = {tints.uraniumLive, tints.tritium, tints.uraniumLive}, text = "100kt"}),
      appendOrder = "-0-100",
      final_effect = nuke_explosions.N100kt_detonation
    }
  }
}
