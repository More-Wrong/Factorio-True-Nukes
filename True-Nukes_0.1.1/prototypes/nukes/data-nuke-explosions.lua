local sounds = require("__base__.prototypes.entity.sounds")
local N0_1t_detonation = {
	  {
	    type = "camera-effect",
	    effect = "screen-burn",
	    duration = 30,
	    ease_in_duration = 5,
	    ease_out_duration = 30,
	    delay = 0,
	    strength = 3,
	    full_strength_max_distance = 5,
	    max_distance = 20
	  },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 25,
            volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 25,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "create-trivial-smoke",
            smoke_name = "artillery-smoke",
            initial_height = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005,
            offset_deviation = {{-4, -4}, {4, 4}},
            max_radius = 3.5,
            repeat_count = 4 * 4 * 15
          },
      {
        type = "script",
		effect_id = "Atomic Weapon hit 0.1t"
      },
      {
        type = "create-entity",
        entity_name = "medium-scorchmark-tintable",
        check_buildability = true
      },
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
      {
        type = "destroy-cliffs",
        radius = 1 
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 1
      },
	  {
		type = "nested-result",
		action =
		{
		  type = "area",
		  target_entities = true,
		  trigger_from_target = true,
		  radius = 10,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "nuclear-fire",
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
	      radius = 1,
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
        
local N0_5t_detonation = {
	  {
	    type = "camera-effect",
	    effect = "screen-burn",
	    duration = 15,
	    ease_in_duration = 5,
	    ease_out_duration = 15,
	    delay = 0,
	    strength = 6,
	    full_strength_max_distance = 10,
	    max_distance = 50
	  },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 50,
            volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 50,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
      {
        type = "script",
		effect_id = "Atomic Weapon hit 0.5t"
      },
      {
        type = "create-entity",
        entity_name = "medium-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "create-entity",
        entity_name = "big-artillery-explosion"
      },
      {
        type = "destroy-cliffs",
        radius = 3 
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 3
      },
      {
        type = "nested-result",
        action =
		  {
		    type = "area",
		    radius = 50,
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
		    radius = 50,
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
		  radius = 20,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "nuclear-fire",
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
	      radius = 2,
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
    
local N2t_detonation = {
	  {
	    type = "camera-effect",
	    effect = "screen-burn",
	    duration = 30,
	    ease_in_duration = 5,
	    ease_out_duration = 30,
	    delay = 0,
	    strength = 6,
	    full_strength_max_distance = 20,
	    max_distance = 100
	  },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 100,
            volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 100,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
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
        entity_name = "nuke-explosion"
      },
      {
        type = "destroy-cliffs",
        radius = 5 
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
				  entity_name = "nuclear-fire",
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
            show_in_tooltip = false,
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
            show_in_tooltip = false,
	        projectile = "fallout",
	        starting_speed = 0.0001
	      }
	    }
	  }
    }
    
    
local N4t_detonation = {
	  {
	    type = "camera-effect",
	    effect = "screen-burn",
	    duration = 60,
	    ease_in_duration = 5,
	    ease_out_duration = 60,
	    delay = 0,
	    strength = 6,
	    full_strength_max_distance = 45,
	    max_distance = 200
	  },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 200,
            volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 200,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
      {
        type = "script",
		effect_id = "Atomic Weapon hit 4t"
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
        entity_name = "nuke-explosion"
      },
      {
        type = "destroy-cliffs",
        radius = 8 
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
		    radius = 200,
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
		    radius = 200,
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
		  radius = 70,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "nuclear-fire",
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
	      repeat_count = 3,
	      radius = 10,
	      action_delivery =
	      {
	        type = "projectile",
            show_in_tooltip = false,
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
	      repeat_count = 10,
	      radius = 30,
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
  
local N8t_detonation = {
	  {
	    type = "camera-effect",
	    effect = "screen-burn",
	    duration = 120,
	    ease_in_duration = 5,
	    ease_out_duration = 120,
	    delay = 0,
	    strength = 6,
	    full_strength_max_distance = 75,
	    max_distance = 300
	  },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 300,
            volume_modifier = 1,
            audible_distance_modifier = 3
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 300,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          },
      {
        type = "script",
		effect_id = "Atomic Weapon hit 8t"
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
        entity_name = "nuke-explosion"
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
		    radius = 250,
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
		    radius = 250,
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
		  radius = 100,
		  action_delivery =
		  {
			type = "instant",
			target_effects = {
	 		  {
				  type = "create-fire",
				  entity_name = "nuclear-fire",
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
	      repeat_count = 5,
	      radius = 15,
	      action_delivery =
	      {
	        type = "projectile",
            show_in_tooltip = false,
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
	      repeat_count = 15,
	      radius = 40,
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
local N20t_detonation = 
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
				  entity_name = "nuclear-fire",
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
if not mods["MushroomCloud"] then
	table.insert(N20t_detonation, 
      {
        type = "create-entity",
        entity_name = "nuke-explosion"
      });
	table.insert(N20t_detonation, 
      {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 60,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 200,
            max_distance = 800
          });
	table.insert(N20t_detonation, 
      {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          });
	table.insert(N20t_detonation, 
      {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          });
end
local N1kt_detonation = {
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
				  entity_name = "nuclear-fire",
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
if not mods["MushroomCloud"] then
	table.insert(N1kt_detonation, 
      {
        type = "create-entity",
        entity_name = "nuke-explosion"
      });
	table.insert(N1kt_detonation, 
      {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 60,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 200,
            max_distance = 800
          });
	table.insert(N1kt_detonation, 
      {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          });
	table.insert(N1kt_detonation, 
      {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3
          });
end
local N500t_detonation = table.deepcopy(N1kt_detonation)
N500t_detonation[1].effect_id = "Atomic Weapon hit 500t"
N500t_detonation[4].radius = 60
N500t_detonation[5].radius = 60
N500t_detonation[6].action.radius = 150
N500t_detonation[7].action.radius = 60
N500t_detonation[8].action.radius = 25
N500t_detonation[8].action.repeat_count = 15
N500t_detonation[9].action.radius = 50
N500t_detonation[9].action.repeat_count = 15
N500t_detonation[10].action.radius = 50
N500t_detonation[10].action.repeat_count = 25
N500t_detonation[11].action.radius = 50
N500t_detonation[11].action.repeat_count = 40

local N15kt_detonation = table.deepcopy(N1kt_detonation)
N15kt_detonation[1].effect_id = "Atomic Weapon hit 15kt"
N15kt_detonation[4].radius = 200
N15kt_detonation[5].radius = 100
N15kt_detonation[6].action.radius = 500
N15kt_detonation[7].action.radius = 400
N15kt_detonation[8].action.radius = 100
N15kt_detonation[9].action.radius = 200
N15kt_detonation[9].action.repeat_count = 200
N15kt_detonation[10].action.radius = 150
N15kt_detonation[10].action.repeat_count = 300
N15kt_detonation[11].action.radius = 250
N15kt_detonation[11].action.repeat_count = 100

local N100kt_detonation = table.deepcopy(N1kt_detonation)
N100kt_detonation[1].effect_id = "Atomic Weapon hit 100kt"
N100kt_detonation[4].radius = 500
N100kt_detonation[5].radius = 500
N100kt_detonation[6].action.radius = 1000
N100kt_detonation[7].action.radius = 1000
N100kt_detonation[8].action.radius = 100
N100kt_detonation[9].action.radius = 100
N100kt_detonation[9].action.repeat_count = 500
N100kt_detonation[10].action.radius = 150
N100kt_detonation[10].action.repeat_count = 300
N100kt_detonation[11].action.radius = 250
N100kt_detonation[11].action.repeat_count = 100

return {
	N0_1t_detonation = N0_1t_detonation,
	N0_5t_detonation = N0_5t_detonation,
	N2t_detonation = N2t_detonation,
	N4t_detonation = N4t_detonation,
	N8t_detonation = N8t_detonation,
	N20t_detonation = N20t_detonation,
	N500t_detonation = N500t_detonation,
	N1kt_detonation = N1kt_detonation,
	N15kt_detonation = N15kt_detonation,
	N100kt_detonation = N100kt_detonation
}

