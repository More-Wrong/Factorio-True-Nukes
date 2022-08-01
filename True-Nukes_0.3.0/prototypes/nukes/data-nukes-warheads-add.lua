require("__True-Nukes__.prototypes.warhead-system.warheads")
local nuke_explosions = require("data-nuke-explosions")
local nuke_materials = require("data-nukes-material")

--function genericClusterProjectile(setup)
--  local name = "TN-nuke-projectile-" .. setup.name
--  if (not data.raw.projectile[name]) then
--    data:extend({
--      {
--        type = "projectile",
--        name = name,
--        flags = {"not-on-map"},
--        acceleration = 0,
--        direction_only = true,
--        action =
--        {
--          type = "direct",
--          action_delivery =
--          {
--            type = "instant",
--            target_effects = setup.effects
--          }
--        },
--        animation = {
--          filename = "__core__/graphics/empty.png",
--          width = 1,
--          frame_count = 1,
--          height = 1
--        },
--      }
--    })
--  end
--  return name
--end
--
--function generalCluster(size, count, radius, explosions)
--  return {
--    type = "nested-result",
--    action =
--    {
--      type = "area",
--      target_entities = false,
--      trigger_from_target = true,
--      repeat_count = count,
--      radius = radius,
--      action_delivery =
--      {
--        type = "projectile",
--        projectile = genericClusterProjectile({name = size, effects = explosions}),
--        starting_speed = 0.6 * 0.8,
--        starting_speed_deviation = 0.1,
--        max_range = radius/2,
--        range_deviation = radius/4,
--      }
--    }
--  }
--end




local fusionMaterial = nuke_materials.fusionMaterial


table.insert(nuclearCoreYields, {
  name = "TN-warhead-0-1--1",
  appendName = "-atomic-0_1t",
  order = "n-m-00001-1",
  icon = "__True-Nukes__/graphics/warheads/core-yy-0.png",
  light = "__True-Nukes__/graphics/warheads/core-0-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "tiny",
  yield = "0_1t",
  preciseSize = 6,
  explosion = nuke_explosions.N0_1t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-0-1--2",
  appendName = "-atomic-0_1t",
  order = "n-m-00001-2",
  icon = "__True-Nukes__/graphics/warheads/core-yy-0.png",
  light = "__True-Nukes__/graphics/warheads/core-0-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "tiny",
  yield = "0_1t",
  preciseSize = 3,
  explosion = nuke_explosions.N0_1t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-0-5--1",
  appendName = "-atomic-0_5t",
  order = "n-m-00005-1",
  icon = "__True-Nukes__/graphics/warheads/core-yy-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "small",
  yield = "0_5t",
  preciseSize = 12,
  explosion = nuke_explosions.N0_5t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-0-5--2",
  appendName = "-atomic-0_5t",
  order = "n-m-00005-2",
  icon = "__True-Nukes__/graphics/warheads/core-yy-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "tiny",
  yield = "0_5t",
  preciseSize = 8,
  explosion = nuke_explosions.N0_5t_detonation
})

--table.insert(nuclearCoreYields, {
--    name = "TN-warhead-0-1--1x20",
--    appendName = "-atomic-0_1t",
--    icon = "__True-Nukes__/graphics/warheads/core-yy-0x20.png",
--    light = "__True-Nukes__/graphics/warheads/core-1x20-light.png",
--    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
--    size = "tiny",
--    yield = "0_1t",
--    preciseSize = 32,
--    explosion =  generalCluster("0_1t", 20, 10, nuke_explosions.N0_1t_detonation)
--  })
--table.insert(nuclearCoreYields, {
--    name = "TN-warhead-0-5--1x20",
--    appendName = "-atomic-0_5tx20",
--    icon = "__True-Nukes__/graphics/warheads/core-yy-1x20.png",
--    light = "__True-Nukes__/graphics/warheads/core-1x20-light.png",
--    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
--    size = "large",
--    yield = "0_5tx20",
--    preciseSize = 38,
--    explosion =  generalCluster("0_5t", 20, 20, nuke_explosions.N0_5t_detonation)
--  })

table.insert(nuclearCoreYields, {
  name = "TN-warhead-2--1",
  appendName = "-atomic-2t",
  order = "n-m-0002-1",
  icon = "__True-Nukes__/graphics/warheads/core-yg-0.png",
  light = "__True-Nukes__/graphics/warheads/core-0-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "small",
  yield = "2t",
  preciseSize = 18,
  explosion = nuke_explosions.N2t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-2--2",
  appendName = "-atomic-2t",
  order = "n-m-0002-2",
  icon = "__True-Nukes__/graphics/warheads/core-yy-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "small",
  yield = "2t",
  preciseSize = 14,
  explosion = nuke_explosions.N2t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-2--3",
  appendName = "-atomic-2t",
  order = "n-m-0002-3",
  icon = "__True-Nukes__/graphics/warheads/core-yy-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "tiny",
  yield = "2t",
  preciseSize = 10,
  explosion = nuke_explosions.N2t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-4--1",
  appendName = "-atomic-4t",
  order = "n-m-0004-1",
  icon = "__True-Nukes__/graphics/warheads/core-yg-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "medium",
  yield = "4t",
  preciseSize = 24,
  explosion = nuke_explosions.N4t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-4--2",
  appendName = "-atomic-4t",
  order = "n-m-0004-2",
  icon = "__True-Nukes__/graphics/warheads/core-yg-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "small",
  yield = "4t",
  preciseSize = 16,
  explosion = nuke_explosions.N4t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-8--1",
  appendName = "-atomic-8t",
  order = "n-m-0008-1",
  icon = "__True-Nukes__/graphics/warheads/core-gy-0.png",
  light = "__True-Nukes__/graphics/warheads/core-0-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "medium",
  yield = "8t",
  preciseSize = 28,
  explosion = nuke_explosions.N8t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-8--2",
  appendName = "-atomic-8t",
  order = "n-m-0008-2",
  icon = "__True-Nukes__/graphics/warheads/core-yg-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
  size = "small",
  yield = "8t",
  preciseSize = 18,
  explosion = nuke_explosions.N8t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-20--1",
  appendName = "-atomic-20t",
  order = "n-m-00020-1",
  icon = "__True-Nukes__/graphics/warheads/core-gy-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "large",
  yield = "20t",
  preciseSize = 32,
  explosion = nuke_explosions.N20t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-20--2",
  appendName = "-atomic-20t",
  order = "n-m-00020-2",
  icon = "__True-Nukes__/graphics/warheads/core-gy-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "medium",
  yield = "20t",
  preciseSize = 26,
  explosion = nuke_explosions.N20t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-20--3",
  appendName = "-atomic-20t",
  order = "n-m-00020-3",
  icon = "__True-Nukes__/graphics/warheads/core-yg-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "small",
  yield = "20t",
  preciseSize = 20,
  explosion = nuke_explosions.N20t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-500--1",
  appendName = "-atomic-500t",
  order = "n-m-005-1",
  icon = "__True-Nukes__/graphics/warheads/core-gg-0.png",
  light = "__True-Nukes__/graphics/warheads/core-0-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "large",
  yield = "500t",
  preciseSize = 38,
  explosion = nuke_explosions.N500t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-500--2",
  appendName = "-atomic-500t",
  order = "n-m-005-2",
  icon = "__True-Nukes__/graphics/warheads/core-gg-0.png",
  light = "__True-Nukes__/graphics/warheads/core-0-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "large",
  yield = "500t",
  preciseSize = 34,
  explosion = nuke_explosions.N500t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-500--3",
  appendName = "-atomic-500t",
  order = "n-m-005-3",
  icon = "__True-Nukes__/graphics/warheads/core-gy-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "medium",
  yield = "500t",
  preciseSize = 28,
  explosion = nuke_explosions.N500t_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-1k--1",
  appendName = "-atomic-1kt",
  order = "n-m-01-1",
  icon = "__True-Nukes__/graphics/warheads/core-gg-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "large",
  yield = "1kt",
  preciseSize = 40,
  explosion = nuke_explosions.N1kt_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-1k--2",
  appendName = "-atomic-1kt",
  order = "n-m-01-2",
  icon = "__True-Nukes__/graphics/warheads/core-gg-1.png",
  light = "__True-Nukes__/graphics/warheads/core-1-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "large",
  yield = "1kt",
  preciseSize = 36,
  explosion = nuke_explosions.N1kt_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-1k--3",
  appendName = "-atomic-1kt",
  order = "n-m-01-3",
  icon = "__True-Nukes__/graphics/warheads/core-gy-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "medium",
  yield = "1kt",
  preciseSize = 30,
  explosion = nuke_explosions.N1kt_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-15k--1",
  appendName = "-atomic-15kt",
  order = "n-m-15-1",
  icon = "__True-Nukes__/graphics/warheads/core-gg-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "huge",
  yield = "15kt",
  preciseSize = 44,
  explosion = nuke_explosions.N15kt_detonation
})
table.insert(nuclearCoreYields, {
  name = "TN-warhead-15k--2",
  appendName = "-atomic-15kt",
  order = "n-m-15-2",
  icon = "__True-Nukes__/graphics/warheads/core-gg-2.png",
  light = "__True-Nukes__/graphics/warheads/core-2-light.png",
  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
  size = "large",
  yield = "15kt",
  preciseSize = 38,
  explosion = nuke_explosions.N15kt_detonation
})
table.insert(nuclearCoreYields, {
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
})
table.insert(nuclearCoreYields, {
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
})
table.insert(nuclearCoreYields, {
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
})
