data.raw.projectile["atomic-rocket"].action = 
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "script",
		effect_id = "Atomic Weapon hit 20t"
      },
      {
          repeat_count = 1000,
          type = "create-trivial-smoke",
          smoke_name = "nuclear-smoke",
          offset_deviation = {{-1, -1}, {1, 1}},
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5,
          speed_from_center = 3
      },
      {
        type = "create-entity",
        entity_name = "big-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "create-entity",
        entity_name = "big-artillery-explosion"
      },
      {
        type = "destroy-cliffs",
        radius = 10 
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
        radius = 20 -- large radius for demostrative purposes
      },
      {
        type = "nested-result",
        action =
		  {
		    type = "area",
		    radius = 340,
		    action_delivery =
		    {
		      type = "instant",
		      target_effects =
		      {
		        type = "damage",
		        damage = {amount = 0.1, type = "fire"}
		      }
		    }
		  }
      },
	  {
		type = "nested-result",
		action =
		{
		  type = "area",
		  target_entities = true,
		  trigger_from_target = true,
		  radius = 140,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "fire-flame",
				  initial_ground_flame_count = 1
			  }
			}
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
	      repeat_count = 50,
	      radius = 30,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "lingering-fallout",
	        starting_speed = 0.0001
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
	      repeat_count = 100,
	      radius = 30,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
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
	      repeat_count = 100,
	      radius = 50,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
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
	      repeat_count = 100,
	      radius = 100,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
	      }
	    }
	  }
    }
  }
}
data.raw.recipe["atomic-bomb"].energy_required=60
data.raw.recipe["atomic-bomb"].ingredients=
    {
      {"rocket-control-unit", 10},
      {"processing-unit", 5},
      {"explosives", 10},
      {"uranium-235", 30},
    }




local debris = table.deepcopy(data.raw.projectile["piercing-shotgun-pellet"])
debris.action.action_delivery.target_effects.damage.ammount=100
debris.name = "nuclear-blast-debris"
debris.animation=
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }


local radiation_cloud_vis_dum = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud-visual-dummy"])
radiation_cloud_vis_dum.name="radiation-cloud-visual-dummy"
radiation_cloud_vis_dum.color = {r = 0.220, g = 0.220, b = 0.220, a = 0.800}
radiation_cloud_vis_dum.duration=60*60

local radiation_cloud = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud"])
radiation_cloud.name="dangerous-radiation-cloud"
radiation_cloud.action.action_delivery.target_effects.action.action_delivery.target_effects.damage.amount=20
radiation_cloud.color = {r = 0.220, g = 0.220, b = 0.220, a = 0.800}
radiation_cloud.created_effect[1].action_delivery.target_effects.entity_name = "radiation-cloud-visual-dummy"
radiation_cloud.created_effect[2].action_delivery.target_effects.entity_name = "radiation-cloud-visual-dummy"
radiation_cloud.duration=60*60

local fallout = table.deepcopy(data.raw.projectile["poison-capsule"])
fallout.name="fallout"
fallout.action[1].action_delivery.target_effects[1].entity_name = "dangerous-radiation-cloud"
table.remove(fallout.action[1].action_delivery.target_effects, 2)
fallout.smoke = nil
fallout.shadow = nil
fallout.light = nil
fallout.animation=
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }




local lingering_radiation_cloud_vis_dum = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud-visual-dummy"])
lingering_radiation_cloud_vis_dum.name="lingering-radiation-cloud-visual-dummy"
lingering_radiation_cloud_vis_dum.color = {r = 0.220, g = 0.220, b = 0.220, a = 0.800}
lingering_radiation_cloud_vis_dum.duration=60*300
lingering_radiation_cloud_vis_dum.fade_away_duration = 60 * 60


local lingering_radiation_cloud = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud"])
lingering_radiation_cloud.name="lingering-radiation-cloud"
lingering_radiation_cloud.color = {r = 0.220, g = 0.220, b = 0.220, a = 0.800}
lingering_radiation_cloud.duration=60*300
lingering_radiation_cloud.fade_away_duration = 40 * 60
lingering_radiation_cloud.created_effect[1].action_delivery.target_effects.entity_name = "lingering-radiation-cloud-visual-dummy"
lingering_radiation_cloud.created_effect[2].action_delivery.target_effects.entity_name = "lingering-radiation-cloud-visual-dummy"

local lingering_fallout = table.deepcopy(data.raw.projectile["poison-capsule"])
lingering_fallout.name="lingering-fallout"
lingering_fallout.action[1].action_delivery.target_effects[1].entity_name = "lingering-radiation-cloud"
table.remove(lingering_fallout.action[1].action_delivery.target_effects, 2)
lingering_fallout.smoke = nil
lingering_fallout.shadow = nil
lingering_fallout.light = nil
lingering_fallout.animation=
    {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high"
    }

data:extend{debris, radiation_cloud_vis_dum, radiation_cloud, fallout, lingering_radiation_cloud_vis_dum, lingering_radiation_cloud, lingering_fallout}




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
atomic_artillery_item.ammo_type.action.action_delivery.projectile = "atomic-artillery-projectile"
atomic_artillery_item.icon = "__True-Nukes__/graphics/atomic-artillery-shell.png"

local atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])
atomic_artillery_projectile.name = "atomic-artillery-projectile"
atomic_artillery_projectile.chart_picture.filename = "__True-Nukes__/graphics/atomic-artillery-map-visualization.png"
atomic_artillery_projectile.action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "script",
		effect_id = "Atomic Weapon hit 1kt"
      },
      {
          repeat_count = 10000,
          type = "create-trivial-smoke",
          smoke_name = "nuclear-smoke",
          offset_deviation = {{-1, -1}, {1, 1}},
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5,
          speed_from_center = 3
      },
      {
        type = "create-entity",
        entity_name = "big-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "create-entity",
        entity_name = "big-artillery-explosion"
      },
      {
        type = "destroy-cliffs",
        radius = 80 
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 80
      },
      {
        type = "nested-result",
        action =
		  {
		    type = "area",
		    radius = 300,
		    action_delivery =
		    {
		      type = "instant",
		      target_effects =
		      {
		        type = "damage",
		        damage = {amount = 2, type = "impact"}
		      }
		    }
		  }
      },
	  {
		type = "nested-result",
		action =
		{
		  type = "area",
		  target_entities = true,
		  trigger_from_target = true,
		  radius = 150,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "fire-flame",
				  initial_ground_flame_count = 1
			  }
			}
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
	      repeat_count = 50,
	      radius = 50,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "lingering-fallout",
	        starting_speed = 0.0001
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
	      repeat_count = 100,
	      radius = 50,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
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
	      repeat_count = 100,
	      radius = 100,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
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
	      repeat_count = 100,
	      radius = 200,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
	      }
	    }
	  }
    }
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
big_atomic_artillery_item.ammo_type.action.action_delivery.projectile = "nuclear-artillery-projectile"
big_atomic_artillery_item.icon = "__True-Nukes__/graphics/big-atomic-artillery-shell.png"

local big_atomic_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])
big_atomic_artillery_projectile.name = "nuclear-artillery-projectile"
big_atomic_artillery_projectile.action.action_delivery.target_effects[1].effect_id = "Atomic Weapon hit 15kt"
big_atomic_artillery_projectile.action.action_delivery.target_effects[5].radius = 200
big_atomic_artillery_projectile.action.action_delivery.target_effects[6].radius = 100
big_atomic_artillery_projectile.action.action_delivery.target_effects[7].action.radius = 500
big_atomic_artillery_projectile.action.action_delivery.target_effects[8].action.radius = 400
big_atomic_artillery_projectile.action.action_delivery.target_effects[9].action.radius = 100
big_atomic_artillery_projectile.action.action_delivery.target_effects[10].action.radius = 200
big_atomic_artillery_projectile.action.action_delivery.target_effects[10].action.repeat_count = 200
big_atomic_artillery_projectile.action.action_delivery.target_effects[11].action.radius = 150
big_atomic_artillery_projectile.action.action_delivery.target_effects[11].action.repeat_count = 300
big_atomic_artillery_projectile.action.action_delivery.target_effects[12].action.radius = 250
big_atomic_artillery_projectile.action.action_delivery.target_effects[12].action.repeat_count = 100
data:extend{big_atomic_artillery_recipe, big_atomic_artillery_item, big_atomic_artillery_projectile}

















local atomic_cannon_recipe = {
    type = "recipe",
    name = "atomic-cannon-shell",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {"explosive-uranium-cannon-shell", 1},
      {"explosives", 5},
      {"uranium-235", 10},
      {"processing-unit", 5}
    },
    result = "atomic-cannon-shell"
  }

local  atomic_cannon_item = table.deepcopy(data.raw["ammo"]["explosive-uranium-cannon-shell"])
atomic_cannon_item.name = "atomic-cannon-shell"
atomic_cannon_item.ammo_type.action.action_delivery.projectile = "atomic-cannon-projectile"
atomic_cannon_item.icon = "__True-Nukes__/graphics/atomic-cannon-shell.png"

local atomic_cannon_projectile = table.deepcopy(data.raw["projectile"]["explosive-uranium-cannon-projectile"])
atomic_cannon_projectile.name = "atomic-cannon-projectile"
atomic_cannon_projectile.action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "script",
		effect_id = "Atomic Weapon hit 2t"
      },
      {
          repeat_count = 100,
          type = "create-trivial-smoke",
          smoke_name = "nuclear-smoke",
          offset_deviation = {{-1, -1}, {1, 1}},
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5,
          speed_from_center = 3
      },
      {
        type = "create-entity",
        entity_name = "big-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "create-entity",
        entity_name = "big-artillery-explosion"
      },
      {
        type = "destroy-cliffs",
        radius = 10 
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 10
      },
      {
        type = "nested-result",
        action =
		  {
		    type = "area",
		    radius = 150,
		    action_delivery =
		    {
		      type = "instant",
		      target_effects =
		      {
		        type = "damage",
		        damage = {amount = 0.1, type = "fire"}
		      }
		    }
		  }
      },
      {
        type = "nested-result",
        action =
		  {
		    type = "area",
		    radius = 150,
		    action_delivery =
		    {
		      type = "instant",
		      target_effects =
		      {
		        type = "damage",
		        damage = {amount = 2, type = "impact"}
		      }
		    }
		  }
      },
	  {
		type = "nested-result",
		action =
		{
		  type = "area",
		  target_entities = true,
		  trigger_from_target = true,
		  radius = 50,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "fire-flame",
				  initial_ground_flame_count = 1
			  }
			}
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
	      repeat_count = 1,
	      radius = 10,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "lingering-fallout",
	        starting_speed = 0.0001
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
	      radius = 20,
	      action_delivery =
	      {
	        type = "projectile",
	        projectile = "fallout",
	        starting_speed = 0.0001
	      }
	    }
	  }
    }
  }
}
data:extend{atomic_cannon_recipe, atomic_cannon_item, atomic_cannon_projectile}


table.insert(data.raw.technology["atomic-bomb"].effects, {
        type = "unlock-recipe",
        recipe = "atomic-cannon-shell"
      })
local artillery_nuke_tech = table.deepcopy(data.raw["technology"]["atomic-bomb"])
artillery_nuke_tech.name = "atomic-artillery-shells"
artillery_nuke_tech.effects =
    {
      {
        type = "unlock-recipe",
        recipe = "atomic-artillery-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "big-atomic-artillery-shell"
      }
    }
artillery_nuke_tech.prerequisites = {"atomic-bomb", "artillery"}
artillery_nuke_tech.icon = "__True-Nukes__/graphics/atomic-artillery-tech.png",
data:extend{artillery_nuke_tech}
