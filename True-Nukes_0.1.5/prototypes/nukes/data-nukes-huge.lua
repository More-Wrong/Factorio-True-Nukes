local fireutil = require("__base__.prototypes.fire-util")
local nuke_explosions = require("data-nuke-explosions")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local very_big_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["TN-atomic-artillery-projectile"])
very_big_atomic_artillery_projectile.name = "TN-really-huge-atomic-artillery-projectile"
very_big_atomic_artillery_projectile.action.action_delivery.target_effects = nuke_explosions.N1Mt_detonation
data:extend{very_big_atomic_artillery_projectile}


data:extend{
  {
    type = "recipe-category",
    name = "nuclear-detonation"
  },
  {
    type = "recipe",
    name = "megaton-nuke",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"speed-module", 4},
      {"assembling-machine-2", 2}
    },
    result = "megaton-nuke"
  },
  {
    type = "item",
    name = "tritium-canister",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "a[tritium-canister]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "megaton-detonation",
    category = "nuclear-detonation",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"tritium-canister", 50}
    },
    result = "megaton-detonation"
  },
  {
    type = "item",
    name = "megaton-nuke",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "a[stone-furnace]",
    place_result = "megaton-nuke",
    stack_size = 50
  },
  {
    type = "item",
    name = "megaton-detonation",
    icon = "__base__/graphics/icons/stone-furnace.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "smelting-machine",
    order = "a[stone-furnace]",
    stack_size = 1
  },



  {
    type = "assembling-machine",
    name = "megaton-nuke",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 10, result = "megaton-nuke"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "massive-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fixed_recipe = "megaton-detonation",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    alert_icon_shift = util.by_pixel(-3, -12),
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
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
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
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.5
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  }}




      
