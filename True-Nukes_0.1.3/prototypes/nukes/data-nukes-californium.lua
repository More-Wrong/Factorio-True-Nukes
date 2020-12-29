local fireutil = require("__base__.prototypes.fire-util")
local nuke_explosions = require("data-nuke-explosions")

local circuit_type;
local upgrade_circuit_mult = 5
if not mods["bobelectronics"] then
	circuit_type = "processing-unit"
else
	circuit_type = "superior-circuit-board"
	upgrade_circuit_mult = 1
end

local material;
if(settings.startup["use-californium"].value) then
	material = "californium"
	data:extend({
	  {
	    type = "item",
	    name = "californium",
	    icon = "__True-Nukes__/graphics/californium.png",
	    icon_size = 64, icon_mipmaps = 4,
	    subgroup = "intermediate-product",
	    order = "r[z-californium]",
	    stack_size = 100
	  },
	  {
	    type = "recipe",
	    name = "californium-processing",
	    energy_required = 120,
	    enabled = false,
	    category = "centrifuging",
	    ingredients = {{"uranium-235", 10}, {"uranium-238", 1}},
	    icon = "__True-Nukes__/graphics/californium-processing.png",
	    icon_size = 64, icon_mipmaps = 4,
	    subgroup = "intermediate-product",
	    order = "r[uranium-processing]-d[californium-processing]",
	    main_product = "californium",
	    results = {{"uranium-235", 9}, {"californium", 1}},
	    allow_decomposition = false
	  },

	});
else
	material = "uranium-235"
end


local atomic_ammo_recipe = {
    type = "recipe",
    name = "atomic-rounds-magazine",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"uranium-rounds-magazine", 1},
      {"low-density-structure", 10},
      {material, 10},
      {circuit_type, 2}
    },
    result = "atomic-rounds-magazine"
  }
local  atomic_ammo_item = {
    type = "ammo",
    name = "atomic-rounds-magazine",
    icon = "__True-Nukes__/graphics/atomic-rounds-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      cooldown_modifier = 2.5,
      category = "bullet",
      target_type = "position",
      clamp_position = true,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects = nuke_explosions.N0_1t_detonation
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-d[atomic-rounds-magazine]",
    stack_size = 20
  }



data:extend{atomic_ammo_recipe, atomic_ammo_item}


local big_atomic_ammo_recipe = {
    type = "recipe",
    name = "big-atomic-rounds-magazine",
    enabled = false,
    energy_required = 240,
    ingredients =
    {
      {"atomic-rounds-magazine", 1},
      {"low-density-structure", 10},
      {material, 20},
      {"processing-unit", 2*upgrade_circuit_mult}
    },
    result = "big-atomic-rounds-magazine"
  }
local  big_atomic_ammo_item = {
    type = "ammo",
    name = "big-atomic-rounds-magazine",
    icon = "__True-Nukes__/graphics/big-atomic-rounds-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    ammo_type =
    {
      cooldown_modifier = 5,
      category = "bullet",
      target_type = "position",
      clamp_position = true,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects = nuke_explosions.N0_5t_detonation
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-d[big-atomic-rounds-magazine]",
    stack_size = 10
  }



data:extend{big_atomic_ammo_recipe, big_atomic_ammo_item}


local atomic_cannon_recipe = {
    type = "recipe",
    name = "atomic-cannon-shell",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"explosive-uranium-cannon-shell", 1},
      {"explosives", 5},
      {material, 10},
      {circuit_type, 5}
    },
    result = "atomic-cannon-shell"
  }

local  atomic_cannon_item = table.deepcopy(data.raw["ammo"]["explosive-uranium-cannon-shell"])
atomic_cannon_item.name = "atomic-cannon-shell"
atomic_cannon_item.collision_box = {{0, 0}, {0, 0}}
atomic_cannon_item.order = "d[explosive-cannon-shell]-dA[nuclear]"
atomic_cannon_item.ammo_type.range_modifier = 3
atomic_cannon_item.ammo_type.cooldown_modifier = 3
atomic_cannon_item.ammo_type.action.action_delivery.projectile = "atomic-cannon-projectile"
atomic_cannon_item.icon = "__True-Nukes__/graphics/atomic-cannon-shell.png"

local atomic_cannon_projectile = table.deepcopy(data.raw["projectile"]["explosive-uranium-cannon-projectile"])
atomic_cannon_projectile.name = "atomic-cannon-projectile"
atomic_cannon_projectile.collision_box = {{0, 0}, {0, 0}}
atomic_cannon_projectile.final_action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = nuke_explosions.N2t_detonation
  }
}
data:extend{atomic_cannon_recipe, atomic_cannon_item, atomic_cannon_projectile}

local big_atomic_cannon_recipe = {
    type = "recipe",
    name = "big-atomic-cannon-shell",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"atomic-cannon-shell", 1},
      {material, 15},
      {"low-density-structure", 10},
      {"processing-unit", 3*upgrade_circuit_mult}
    },
    result = "big-atomic-cannon-shell"
  }

local  big_atomic_cannon_item = table.deepcopy(data.raw["ammo"]["explosive-uranium-cannon-shell"])
big_atomic_cannon_item.name = "big-atomic-cannon-shell"
big_atomic_cannon_item.order = "d[explosive-cannon-shell]-dB[nuclear]"
big_atomic_cannon_item.ammo_type.range_modifier = 3
big_atomic_cannon_item.ammo_type.cooldown_modifier = 3
big_atomic_cannon_item.ammo_type.action.action_delivery.projectile = "big-atomic-cannon-projectile"
big_atomic_cannon_item.icon = "__True-Nukes__/graphics/big-atomic-cannon-shell.png"
atomic_cannon_item.stack_size = 20

local big_atomic_cannon_projectile = table.deepcopy(data.raw["projectile"]["explosive-uranium-cannon-projectile"])
big_atomic_cannon_projectile.name = "big-atomic-cannon-projectile"
big_atomic_cannon_projectile.collision_box = {{0, 0}, {0, 0}}
big_atomic_cannon_projectile.final_action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = nuke_explosions.N4t_detonation
  }
}
data:extend{big_atomic_cannon_recipe, big_atomic_cannon_item, big_atomic_cannon_projectile}
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
        recipe = "atomic-rounds-magazine"
      },
      {
        type = "unlock-recipe",
        recipe = "atomic-cannon-shell"
      }
    },
    prerequisites = { "kovarex-enrichment-process", "atomic-bomb"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 500
    },
    order = "e-p-b-c"
  }
}
if(settings.startup["use-californium"].value) then
	table.insert(data.raw.technology["californium-processing"].effects, 1, {
	        type = "unlock-recipe",
	        recipe = "californium-processing"
 	     })
end

table.insert(data.raw.technology["scary-atomic-weapons"].effects, 1, {
        type = "unlock-recipe",
        recipe = "big-atomic-rounds-magazine"
      })
table.insert(data.raw.technology["scary-atomic-weapons"].effects, 2, {
        type = "unlock-recipe",
        recipe = "big-atomic-cannon-shell"
      })
