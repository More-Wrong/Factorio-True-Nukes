
if mods["MushroomCloud"] then
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
	local tmp = {}
	for _,v in pairs(data.raw["artillery-projectile"]["atomic-artillery-projectile"].action.action_delivery.target_effects) do
		if(v.type == "create-entity" and string.find(v.entity_name, "explosion") and string.find(v.entity_name, "uranium")) then
			local newEnt = table.deepcopy(v)
			newEnt.entity_name = "big-" .. newEnt.entity_name
    		table.insert(tmp, newEnt)
		end
	end
	for _,v in pairs(tmp) do
		table.insert(data.raw["artillery-projectile"]["atomic-artillery-projectile"].action.action_delivery.target_effects, v)
	end
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

	local tmp2 = {}
	for _,v in pairs(data.raw["artillery-projectile"]["nuclear-artillery-projectile"].action.action_delivery.target_effects) do
		if(v.type == "create-entity" and string.find(v.entity_name, "explosion") and string.find(v.entity_name, "uranium")) then
			local newEnt = table.deepcopy(v)
			newEnt.entity_name = "huge-" .. newEnt.entity_name
    		table.insert(tmp2, newEnt)
		end
	end
	for _,v in pairs(tmp2) do
    		table.insert(data.raw["artillery-projectile"]["nuclear-artillery-projectile"].action.action_delivery.target_effects, v)
	end
end
