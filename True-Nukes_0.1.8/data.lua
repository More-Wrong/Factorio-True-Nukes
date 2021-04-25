require("MushroomCloudInBuilt.explosions")
require("MushroomCloudInBuilt.radiation_noise")
require("MushroomCloudInBuilt.ground_zero")
require("MushroomCloudInBuilt.explosion_sizes")

	
local fireutil = require("__base__.prototypes.fire-util")

data:extend({
fireutil.add_basic_fire_graphics_and_effects_definitions
{
  type = "fire",
  name = "thermobaric-wave-fire",
  flags = {"placeable-off-grid", "not-on-map"},
  damage_per_tick = {amount = 13 / 60, type = "fire"},
  maximum_damage_multiplier = 6,
  damage_multiplier_increase_per_added_fuel = 1,
  damage_multiplier_decrease_per_tick = 0.005,

  spawn_entity = "fire-flame-on-tree",

  spread_delay = 300,
  spread_delay_deviation = 180,
  maximum_spread_count = 100,

  emissions_per_second = 0.005,

  initial_lifetime = 5,
  lifetime_increase_by = 150,
  lifetime_increase_cooldown = 4,
  maximum_lifetime = 1800,
  delay_between_initial_flames = 10,
  --initial_flame_count = 1,

}})
require("prototypes.nukes.data-nukes")

if(settings.startup["enable-thermobaric"].value) then
	require("prototypes.thermobarics.data-thermobaric")
end
data:extend({
  {
    type = "energy-shield-equipment",
    name = "fire-shield-equipment",
    sprite =
    {
      filename = "__True-Nukes__/graphics/fire-shield-equipment.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    max_shield_value = 1,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "2000kJ",
      input_flow_limit = "250kW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "20kJ",
    categories = {"armor"}
  },
  {
    type = "item",
    name = "fire-shield-equipment",
    icon = "__True-Nukes__/graphics/fire-shield-equipment-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    placed_as_equipment_result = "fire-shield-equipment",
    subgroup = "military-equipment",
    order = "a[shield]-aA[fire-shield-equipment]",
    default_request_amount = 5,
    stack_size = 10
  },
  {
    type = "recipe",
    name = "fire-shield-equipment",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {"low-density-structure", 10},
      {"empty-barrel", 10}
    },
    result = "fire-shield-equipment"
  }
  })
  
  
  
  
  
  

function add_mushroom_cloud_effect(effect, prefix)
    table.insert(effect, 2, {
	                    type = "create-entity",
	                    entity_name = prefix .. "uranium-explosion-LUQ",
	                })
    table.insert(effect, 3, {
	                    type = "create-entity",
	                    entity_name = prefix .. "uranium-explosion-RUQ"
	                })
    table.insert(effect, 4, {
	                    type = "create-entity",
	                    entity_name = prefix .. "uranium-explosion-LLQ"
	                })
    table.insert(effect, 5, {
	                    type = "create-entity",
	                    entity_name = prefix .. "uranium-explosion-RLQ"
	                })
    table.insert(effect, 6, {
	                    type = "create-entity",
	                    entity_name = "nuclear-scorchmark",
	                    check_buildability = true
	                })
    table.insert(effect, 7, {
			     type = "create-entity",
			     entity_name = "radiation-cloud"
		        })



end
	
if(settings.startup["enable-thermobaric"].value) then
	add_mushroom_cloud_effect(data.raw.projectile["thermobaric-rocket"].action.action_delivery.target_effects, "small-")
	add_mushroom_cloud_effect(data.raw["artillery-projectile"]["thermobaric-artillery-projectile"].action.action_delivery.target_effects, "")
	if mods["SchallTankPlatoon"] then
		add_mushroom_cloud_effect(data.raw.projectile["thermobaric-cannon-H2-projectile"].action.action_delivery.target_effects, "small-")
	end
end
