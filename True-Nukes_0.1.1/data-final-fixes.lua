
if mods["MushroomCloud"] then
	function add_mushroom_cloud_effect(effect, prefix)
	    table.insert(effect, 2, {
		                    type = "create-entity",
		                    entity_name = "uranium-explosion-LUQ",
		                    trigger_created_entity = "true"                
		                })
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
	add_mushroom_cloud_effect(data.raw["artillery-projectile"]["TN-small-atomic-artillery-projectile"].action.action_delivery.target_effects, "")
	local big_explosion_LUQ = table.deepcopy(data.raw.explosion["uranium-explosion-LUQ"])
	big_explosion_LUQ.name = "big-" .. big_explosion_LUQ.name
	big_explosion_LUQ.animations[1].scale = 8
	big_explosion_LUQ.animations[1].shift = {-32,-32}
	local big_explosion_RUQ = table.deepcopy(data.raw.explosion["uranium-explosion-RUQ"])
	big_explosion_RUQ.name = "big-" .. big_explosion_RUQ.name
	big_explosion_RUQ.animations[1].scale = 8
	big_explosion_RUQ.animations[1].shift = {32,-32}
	local big_explosion_LLQ = table.deepcopy(data.raw.explosion["uranium-explosion-LLQ"])
	big_explosion_LLQ.name = "big-" .. big_explosion_LLQ.name
	big_explosion_LLQ.animations[1].scale = 8
	big_explosion_LLQ.animations[1].shift = {-32,32}
	local big_explosion_RLQ = table.deepcopy(data.raw.explosion["uranium-explosion-RLQ"])
	big_explosion_RLQ.name = "big-" .. big_explosion_RLQ.name
	big_explosion_RLQ.animations[1].scale = 8
	big_explosion_RLQ.animations[1].shift = {32,32}
	data:extend({big_explosion_LUQ,big_explosion_RUQ,big_explosion_LLQ,big_explosion_RLQ})

	add_mushroom_cloud_effect(data.raw["artillery-projectile"]["TN-atomic-artillery-projectile"].action.action_delivery.target_effects, "big-")
	
	local huge_explosion_LUQ = table.deepcopy(data.raw.explosion["uranium-explosion-LUQ"])
	huge_explosion_LUQ.name = "huge-" .. huge_explosion_LUQ.name
	huge_explosion_LUQ.animations[1].scale = 16
	huge_explosion_LUQ.animations[1].shift = {-64,-64}
	local huge_explosion_RUQ = table.deepcopy(data.raw.explosion["uranium-explosion-RUQ"])
	huge_explosion_RUQ.name = "huge-" .. huge_explosion_RUQ.name
	huge_explosion_RUQ.animations[1].scale = 16
	huge_explosion_RUQ.animations[1].shift = {64,-64}
	local huge_explosion_LLQ = table.deepcopy(data.raw.explosion["uranium-explosion-LLQ"])
	huge_explosion_LLQ.name = "huge-" .. huge_explosion_LLQ.name
	huge_explosion_LLQ.animations[1].scale = 16
	huge_explosion_LLQ.animations[1].shift = {-64,64}
	local huge_explosion_RLQ = table.deepcopy(data.raw.explosion["uranium-explosion-RLQ"])
	huge_explosion_RLQ.name = "huge-" .. huge_explosion_RLQ.name
	huge_explosion_RLQ.animations[1].scale = 16
	huge_explosion_RLQ.animations[1].shift = {64,64}
	data:extend({huge_explosion_LUQ,huge_explosion_RUQ,huge_explosion_LLQ,huge_explosion_RLQ})

	add_mushroom_cloud_effect(data.raw["artillery-projectile"]["TN-big-atomic-artillery-projectile"].action.action_delivery.target_effects, "huge-")
	
	
	local really_huge_explosion_LUQ = table.deepcopy(data.raw.explosion["uranium-explosion-LUQ"])
	really_huge_explosion_LUQ.name = "really-huge-" .. really_huge_explosion_LUQ.name
	really_huge_explosion_LUQ.animations[1].scale = 32
	really_huge_explosion_LUQ.animations[1].shift = {-128,-128}
	local really_huge_explosion_RUQ = table.deepcopy(data.raw.explosion["uranium-explosion-RUQ"])
	really_huge_explosion_RUQ.name = "really-huge-" .. really_huge_explosion_RUQ.name
	really_huge_explosion_RUQ.animations[1].scale = 32
	really_huge_explosion_RUQ.animations[1].shift = {128,-128}
	local really_huge_explosion_LLQ = table.deepcopy(data.raw.explosion["uranium-explosion-LLQ"])
	really_huge_explosion_LLQ.name = "really-huge-" .. really_huge_explosion_LLQ.name
	really_huge_explosion_LLQ.animations[1].scale = 32
	really_huge_explosion_LLQ.animations[1].shift = {-128,128}
	local really_huge_explosion_RLQ = table.deepcopy(data.raw.explosion["uranium-explosion-RLQ"])
	really_huge_explosion_RLQ.name = "really-huge-" .. really_huge_explosion_RLQ.name
	really_huge_explosion_RLQ.animations[1].scale = 32
	really_huge_explosion_RLQ.animations[1].shift = {128,128}
	data:extend({really_huge_explosion_LUQ, really_huge_explosion_RUQ, really_huge_explosion_LLQ, really_huge_explosion_RLQ})
	add_mushroom_cloud_effect(data.raw["artillery-projectile"]["TN-very-big-atomic-artillery-projectile"].action.action_delivery.target_effects, "really-huge-")
end
