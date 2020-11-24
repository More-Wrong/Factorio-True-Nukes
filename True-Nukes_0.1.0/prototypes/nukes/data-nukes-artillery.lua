local fireutil = require("__base__.prototypes.fire-util")
local nuke_explosions = require("data-nuke-explosions")



local atomic_artillery_recipe = {
    type = "recipe",
    name = "atomic-artillery-shell",
    enabled = false,
    energy_required = 120,
    ingredients =
    {
      {"artillery-shell", 1},
      {"processing-unit", 20},
      {"uranium-235", 100},
      {"explosives", 10}
    },
    result = "atomic-artillery-shell"
}

local atomic_artillery_item = table.deepcopy(data.raw["ammo"]["artillery-shell"])
atomic_artillery_item.name = "atomic-artillery-shell"
if mods["SchallTankPlatoon"] then
	atomic_artillery_item.order = "h[artillery]-e[atomic-artillery]"
else
	atomic_artillery_item.order = "d[explosive-cannon-shell]-e[atomic-artillery]"
end
atomic_artillery_item.ammo_type.cooldown_modifier = 10
atomic_artillery_item.ammo_type.action.action_delivery.projectile = "atomic-artillery-projectile"
atomic_artillery_item.icon = "__True-Nukes__/graphics/atomic-artillery-shell.png"

local atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])
atomic_artillery_projectile.name = "atomic-artillery-projectile"

--Hack to fix Make Artillery Great Again's removal of the 'chart_picture'... also just being defensive
if(atomic_artillery_projectile.chart_picture) then
	atomic_artillery_projectile.chart_picture.filename = "__True-Nukes__/graphics/atomic-artillery-map-visualization.png"
else
	atomic_artillery_projectile.chart_picture = {
	      filename = "__True-Nukes__/graphics/atomic-artillery-map-visualization.png",
	      flags = { "icon" },
	      frame_count = 1,
	      width = 64,
	      height = 64,
	      priority = "high",
	      scale = 0.25
	    }
end

atomic_artillery_projectile.action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = nuke_explosions.N1kt_detonation
  }
}
data:extend{atomic_artillery_recipe, atomic_artillery_item, atomic_artillery_projectile}

local big_atomic_artillery_recipe = {
    type = "recipe",
    name = "big-atomic-artillery-shell",
    enabled = false,
    energy_required = 300,
    ingredients =
    {
      {"atomic-artillery-shell", 1},
      {"processing-unit", 100},
      {"uranium-235", 200},
      {"explosives", 100}
    },
    result = "big-atomic-artillery-shell"
}

local big_atomic_artillery_item = table.deepcopy(data.raw["ammo"]["artillery-shell"])
big_atomic_artillery_item.name = "big-atomic-artillery-shell"
if mods["SchallTankPlatoon"] then
	big_atomic_artillery_item.order = "h[artillery]-e[big-atomic-artillery]"
else
	big_atomic_artillery_item.order = "d[explosive-cannon-shell]-e[big-atomic-artillery]"
end
big_atomic_artillery_item.ammo_type.cooldown_modifier = 15
big_atomic_artillery_item.ammo_type.action.action_delivery.projectile = "nuclear-artillery-projectile"
big_atomic_artillery_item.icon = "__True-Nukes__/graphics/big-atomic-artillery-shell.png"

local big_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])
big_atomic_artillery_projectile.name = "nuclear-artillery-projectile"
big_atomic_artillery_projectile.action.action_delivery.target_effects = nuke_explosions.N15kt_detonation
data:extend{big_atomic_artillery_recipe, big_atomic_artillery_item, big_atomic_artillery_projectile}


local very_big_atomic_artillery_recipe = {
    type = "recipe",
    name = "very-big-atomic-artillery-shell",
    enabled = false,
    energy_required = 300,
    ingredients =
    {
      {"big-atomic-artillery-shell", 1},
      {"processing-unit", 200},
      {"uranium-235", 1000},
      {"uranium-238", 100},
      {"explosives", 500}
    },
    result = "very-big-atomic-artillery-shell"
}

local very_big_atomic_artillery_item = table.deepcopy(data.raw["ammo"]["artillery-shell"])
very_big_atomic_artillery_item.name = "very-big-atomic-artillery-shell"
if mods["SchallTankPlatoon"] then
	very_big_atomic_artillery_item.order = "h[artillery]-e[very-big-atomic-artillery]"
else
	very_big_atomic_artillery_item.order = "d[explosive-cannon-shell]-e[very-big-atomic-artillery]"
end
very_big_atomic_artillery_item.ammo_type.cooldown_modifier = 30
very_big_atomic_artillery_item.ammo_type.action.action_delivery.projectile = "nuclear-artillery-projectile"
very_big_atomic_artillery_item.icon = "__True-Nukes__/graphics/very-big-atomic-artillery-shell.png"

local very_big_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])
very_big_atomic_artillery_projectile.name = "nuclear-artillery-projectile"
very_big_atomic_artillery_projectile.action.action_delivery.target_effects = nuke_explosions.N100kt_detonation
data:extend{very_big_atomic_artillery_recipe, very_big_atomic_artillery_item, very_big_atomic_artillery_projectile}


local small_atomic_artillery_recipe = {
    type = "recipe",
    name = "small-atomic-artillery-shell",
    enabled = false,
    energy_required = 300,
    ingredients =
    {
      {"artillery-shell", 1},
      {"processing-unit", 10},
      {"uranium-235", 75},
      {"explosives", 10}
    },
    result = "small-atomic-artillery-shell"
}

local small_atomic_artillery_item = table.deepcopy(data.raw["ammo"]["artillery-shell"])
small_atomic_artillery_item.name = "small-atomic-artillery-shell"
if mods["SchallTankPlatoon"] then
	small_atomic_artillery_item.order = "h[artillery]-d[atomic-artillery]"
else
	small_atomic_artillery_item.order = "d[explosive-cannon-shell]-d[atomic-artillery]"
end
small_atomic_artillery_item.ammo_type.cooldown_modifier = 3
small_atomic_artillery_item.ammo_type.action.action_delivery.projectile = "artillery-projectile-nuclear"
small_atomic_artillery_item.icon = "__True-Nukes__/graphics/small-atomic-artillery-shell.png"

local small_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])
small_atomic_artillery_projectile.name = "artillery-projectile-nuclear"
small_atomic_artillery_projectile.action.action_delivery.target_effects = nuke_explosions.N500t_detonation
data:extend{small_atomic_artillery_recipe, small_atomic_artillery_item, small_atomic_artillery_projectile}



local artillery_nuke_tech = table.deepcopy(data.raw["technology"]["atomic-bomb"])
artillery_nuke_tech.name = "atomic-artillery-shells"
artillery_nuke_tech.effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-atomic-artillery-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "atomic-artillery-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "big-atomic-artillery-shell"
      }
    }
artillery_nuke_tech.unit.count=2000
artillery_nuke_tech.prerequisites = {"atomic-bomb", "artillery"}
artillery_nuke_tech.icon = "__True-Nukes__/graphics/atomic-artillery-tech.png",
data:extend{artillery_nuke_tech}

      
