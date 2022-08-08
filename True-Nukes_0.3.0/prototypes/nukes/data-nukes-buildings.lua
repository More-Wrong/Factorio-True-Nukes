local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

table.insert(data.raw.technology["fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "nuclear-test-site"
  })
table.insert(data.raw.technology["fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-15kt"
  })
table.insert(data.raw.technology["fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-100kt"
  })
table.insert(data.raw.technology["compact-fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-1Mt"
  })
table.insert(data.raw.technology["compact-fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-5Mt"
  })
table.insert(data.raw.technology["compact-fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-10Mt"
  })
table.insert(data.raw.technology["compact-fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-50Mt"
  })
table.insert(data.raw.technology["compact-fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-100Mt"
  })
table.insert(data.raw.technology["compact-fusion-weapons"].effects,
  {
    type = "unlock-recipe",
    recipe = "detonation-atomic-2-stage-1Gt"
  })

local warheads = {
  {
    name = "-atomic-0_1t",
    warhead = "TN-warhead-0-1--1",
    label = "-1",
    energy = 10
  },
  {
    name = "-atomic-0_1t",
    warhead = "TN-warhead-0-1--2",
    label = "-2",
    energy = 10
  },
  {
    name = "-atomic-0_5t",
    warhead = "TN-warhead-0-5--1",
    label = "-1",
    energy = 10
  },
  {
    name = "-atomic-0_5t",
    warhead = "TN-warhead-0-5--2",
    label = "-2",
    energy = 10
  },

  {
    name = "-atomic-2t",
    warhead = "TN-warhead-2--1",
    label = "-1",
    energy = 10
  },
  {
    name = "-atomic-2t",
    warhead = "TN-warhead-2--2",
    label = "-2",
    energy = 10
  },
  {
    name = "-atomic-2t",
    warhead = "TN-warhead-2--3",
    label = "-3",
    energy = 10
  },

  {
    name = "-atomic-4t",
    warhead = "TN-warhead-4--1",
    label = "-1",
    energy = 10
  },
  {
    name = "-atomic-4t",
    warhead = "TN-warhead-4--2",
    label = "-2",
    energy = 10
  },
  {
    name = "-atomic-8t",
    warhead = "TN-warhead-8--1",
    label = "-1",
    energy = 10
  },
  {
    name = "-atomic-8t",
    warhead = "TN-warhead-8--2",
    label = "-2",
    energy = 10
  },

  {
    name = "-atomic-20t",
    warhead = "TN-warhead-20--1",
    label = "-1",
    energy = 20
  },
  {
    name = "-atomic-20t",
    warhead = "TN-warhead-20--2",
    label = "-2",
    energy = 20
  },
  {
    name = "-atomic-20t",
    warhead = "TN-warhead-20--3",
    label = "-3",
    energy = 20
  },

  {
    name = "-atomic-500t",
    warhead = "TN-warhead-500--1",
    label = "-1",
    energy = 30
  },
  {
    name = "-atomic-500t",
    warhead = "TN-warhead-500--2",
    label = "-2",
    energy = 30
  },
  {
    name = "-atomic-500t",
    warhead = "TN-warhead-500--3",
    label = "-3",
    energy = 30
  },

  {
    name = "-atomic-1kt",
    warhead = "TN-warhead-1k--1",
    label = "-1",
    energy = 30
  },
  {
    name = "-atomic-1kt",
    warhead = "TN-warhead-1k--2",
    label = "-2",
    energy = 30
  },
  {
    name = "-atomic-1kt",
    warhead = "TN-warhead-1k--3",
    label = "-3",
    energy = 30
  },

  {
    name = "-atomic-15kt",
    warhead = "TN-warhead-15k--1",
    label = "-1",
    energy = 60
  },
  {
    name = "-atomic-15kt",
    warhead = "TN-warhead-15k--2",
    label = "-2",
    energy = 60
  },


  {
    name = "-atomic-2-stage-15kt",
    warhead = "TN-warhead-big--1",
    explosion = 1,
    label = "-1",
    energy = 60
  },
  {
    name = "-atomic-2-stage-100kt",
    warhead = "TN-warhead-big--1",
    explosion = 2,
    label = "-1",
    energy = 90
  },
  {
    name = "-atomic-2-stage-1Mt",
    warhead = "TN-warhead-big--1",
    explosion = 3,
    label = "-1",
    energy = 120
  },
  {
    name = "-atomic-2-stage-5Mt",
    warhead = "TN-warhead-big--1",
    explosion = 4,
    label = "-1",
    energy = 120
  },
  {
    name = "-atomic-2-stage-10Mt",
    warhead = "TN-warhead-big--1",
    explosion = 5,
    label = "-1",
    energy = 180
  },
  {
    name = "-atomic-2-stage-50Mt",
    warhead = "TN-warhead-big--1",
    explosion = 6,
    label = "-1",
    energy = 300
  },
  {
    name = "-atomic-2-stage-100Mt",
    warhead = "TN-warhead-big--1",
    explosion = 7,
    label = "-1",
    energy = 480
  },
  {
    name = "-atomic-2-stage-1Gt",
    warhead = "TN-warhead-big--1",
    explosion = 8,
    label = "-1",
    energy = 600
  },


  {
    name = "-atomic-2-stage-15kt",
    warhead = "TN-warhead-big--2",
    explosion = 1,
    label = "-2",
    energy = 60
  },
  {
    name = "-atomic-2-stage-100kt",
    warhead = "TN-warhead-big--2",
    explosion = 2,
    label = "-2",
    energy = 90
  },
  {
    name = "-atomic-2-stage-1Mt",
    warhead = "TN-warhead-big--2",
    explosion = 3,
    label = "-2",
    energy = 120
  },
  {
    name = "-atomic-2-stage-5Mt",
    warhead = "TN-warhead-big--2",
    explosion = 4,
    label = "-2",
    energy = 120
  },


  {
    name = "-atomic-2-stage-15kt",
    warhead = "TN-warhead-big--3",
    explosion = 1,
    label = "-3",
    energy = 60
  },
  {
    name = "-atomic-2-stage-100kt",
    warhead = "TN-warhead-big--3",
    explosion = 2,
    label = "-3",
    energy = 90
  },
}
for _,w in pairs(warheads) do
  data:extend{
    {
      type = "recipe",
      name = "detonation" .. w.name .. w.label,
      category = "nuclear-detonation",
      enabled = false,
      hide_from_player_crafting = true,
      hide_from_stats = true,
      energy_required = 120,
      ingredients =
      {
        {"TN-warhead-big--1", 1},
        {"tritium-canister", 20}
      },
      result = "detonation-atomic-2-stage-1Mt"
    },
    {
      type = "item",
      name = "detonation-atomic-2-stage-1Mt",
      icon = "__True-Nukes__/graphics/megaton-detonation.png",
      icon_size = 64, icon_mipmaps = 1,
      enabled = false,
      subgroup = "TN-atomic-detonation",
      order = "a[nuke]-ba[1Mt]",
      stack_size = 1
    }
  }
end








data:extend{
  {
    type = "recipe-category",
    name = "nuclear-detonation"
  },
  {
    name = "TN-atomic-detonation",
    type = "item-subgroup",
    group = "combat",
    order = "z1[TN-atomic-detonation]"
  },
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-1Mt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 120,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 20}
    },
    result = "detonation-atomic-2-stage-1Mt"
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-1Mt",
    icon = "__True-Nukes__/graphics/megaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-ba[1Mt]",
    stack_size = 1
  }
}

data:extend{
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-5Mt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 120,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 100}
    },
    result = "detonation-atomic-2-stage-5Mt"
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-5Mt",
    icon = "__True-Nukes__/graphics/5megaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-bb[5Mt]",
    stack_size = 1
  }
}

data:extend{
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-10Mt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 300,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 200}
    },
    result = "detonation-atomic-2-stage-10Mt"
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-10Mt",
    icon = "__True-Nukes__/graphics/10megaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-bc[10Mt]",
    stack_size = 1
  }
}

data:extend{
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-50Mt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 300,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 1000}
    },
    result = "detonation-atomic-2-stage-50Mt"
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-50Mt",
    icon = "__True-Nukes__/graphics/50megaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-bd[50Mt]",
    stack_size = 1
  }
}

data:extend{
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-100Mt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 600,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 2000}
    },
    result = "detonation-atomic-2-stage-100Mt"
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-100Mt",
    icon = "__True-Nukes__/graphics/100megaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-be[100Mt]",
    stack_size = 1
  }
}

data:extend{
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-1Gt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 600,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 20000}
    },
    result = "detonation-atomic-2-stage-1Gt"
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-1Gt",
    icon = "__True-Nukes__/graphics/1gigaton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-bf[1Gt]",
    stack_size = 1
  }
}



data:extend{
  {
    type = "recipe",
    name = "nuclear-test-site",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"steel-plate", 200},
      {"refined-concrete", 200},
      {"advanced-circuit", 25},
      {"accumulator", 10}
    },
    result = "nuclear-test-site"
  },
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-100kt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 120,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
      {"tritium-canister", 2}
    },
    result = "detonation-atomic-2-stage-100kt"
  },
  {
    type = "recipe",
    name = "detonation-atomic-2-stage-15kt",
    category = "nuclear-detonation",
    enabled = false,
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 120,
    ingredients =
    {
      {"TN-warhead-big--1", 1},
    },
    result = "detonation-atomic-2-stage-15kt"
  },
  {
    type = "item",
    name = "nuclear-test-site",
    icon = "__True-Nukes__/graphics/megaton-nuke.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "defensive-structure",
    order = "e[nuke]-a[nuclear-test-site]",
    place_result = "nuclear-test-site",
    stack_size = 1
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-100kt",
    icon = "__True-Nukes__/graphics/100kiloton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-a[100kt]",
    stack_size = 1
  },
  {
    type = "item",
    name = "detonation-atomic-2-stage-15kt",
    icon = "__True-Nukes__/graphics/15kiloton-detonation.png",
    icon_size = 64, icon_mipmaps = 1,
    enabled = false,
    subgroup = "TN-atomic-detonation",
    order = "a[nuke]-a[015kt]",
    stack_size = 1
  },
  {
    type = "assembling-machine",
    name = "nuclear-test-site",
    icon = "__True-Nukes__/graphics/megaton-nuke.png",
    icon_size = 64, icon_mipmaps = 1,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 10, result = "nuclear-test-site"},
    max_health = 5000,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "massive-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.90, -1.40}, {1.90, 1.40}},
    selection_box = {{-2, -1.5}, {2, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    alert_icon_shift = util.by_pixel(-3, -12),
    map_color = {r = 0, g = 1, b = 0, a = 1},
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects = {
          type = "script",
          effect_id = "Mega-nuke built"
        }
      }
    },
    dying_trigger_effect =
    {
      type = "nested-result",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects = {
            {
              type = "nested-result",
              action =
              {
                type = "area",
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 1,
                radius = 1,
                action_delivery =
                {
                  type = "projectile",
                  show_in_tooltip = false,
                  projectile = "lingering-fallout",
                  starting_speed = 0.0001,
                }
              }
            },
            {
              type = "nested-result",
              action =
              {
                type = "area",
                target_entities = false,
                trigger_from_target = true,
                repeat_count = 5,
                radius = 5,
                action_delivery =
                {
                  type = "projectile",
                  show_in_tooltip = false,
                  projectile = "fallout",
                  starting_speed = 0.0001
                }
              }
            }
          }
        }
      }
    },
    animation =
    {
      layers =
      {
        {
          filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-base.png",
          width = 212,
          height = 192,
          shift = util.by_pixel(0, -5),
          scale = 0.5,
          hr_version =
          {
            filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-base.png",
            width = 212,
            height = 192,
            shift = util.by_pixel(0, -5),
            scale = 0.5
          }
        },
        {
          filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-shadow.png",
          priority = "high",
          width = 287,
          height = 159,
          repeat_count = repeat_count,
          shift = util.by_pixel(20, 6),
          draw_as_shadow = true,
          scale = 0.5,
          hr_version =
          {
            filename = "__True-Nukes__/graphics/megaton-nuke/megaton-nuke-shadow.png",
            priority = "high",
            width = 287,
            height = 159,
            repeat_count = repeat_count,
            shift = util.by_pixel(20, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"nuclear-detonation"},
    crafting_speed = 1,
    energy_source = {type = "void"},
    energy_usage = "1kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/silo-alarm.ogg",
        volume = 1.0
      },
      use_doppler_shift = false,
      audible_distance_modifier = 1,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  }
}
