
local mushroomFunctions = require("MushroomCloudInBuilt.control")
local createBlastSoundsAndFlash = mushroomFunctions[1]
script.on_init(function()
	global.waitingNukes = {}
	global.blastWaves = {}
end)

local function moveBlast(i,blast,pastEHits)
	local regNum = 8
	if(blast.r<=500 or not blast.doItts) then
		regNum = 8
	elseif(blast.r<=2000) then
		regNum = 24
	elseif(blast.r<=4000) then
		regNum = 48
	else
		regNum = 96
	end
	blast.ittframe = blast.ittframe+1
	if(blast.itt > regNum and blast.ittframe >=8) then
		blast.r = blast.r + blast.speed
		blast.ittframe = 1
		blast.itt = 1
	elseif (blast.itt > regNum) then
		return
	end

	local surface = game.surfaces[blast["s"]]
	local center = blast["pos"]
	local sideOffset = blast.speed*1.5
	local extraSpace = blast.speed
	
	local eHits = pastEHits
	
	local area = {{}, {}}

	local regions = {{{center.x-blast.r/2-sideOffset, center.y+(blast.r-extraSpace)*0.86603-0.5}, {center.x+blast.r/2+sideOffset, center.y+blast.r+1}}, 
		 		 {{center.x-blast.r/2-sideOffset, center.y-blast.r}, {center.x+blast.r/2+sideOffset, center.y-(blast.r-extraSpace)*0.86603+0.5}}, 
				 {{center.x+(blast.r-extraSpace)*0.86603-0.5, center.y-blast.r/2-sideOffset}, {center.x+blast.r+1, center.y+blast.r/2+sideOffset}}, 
				 {{center.x-blast.r, center.y-blast.r/2-sideOffset}, {center.x-(blast.r-extraSpace)*0.86603+0.5, center.y+blast.r/2+sideOffset}}, 

				 {{center.x-(blast.r-extraSpace)*0.86603-0.5, center.y+blast.r/2-extraSpace/2-0.5}, {center.x-blast.r/2+extraSpace/2+0.5, center.y+(blast.r-extraSpace)*0.86603+0.5}}, 
				 {{center.x+blast.r/2-extraSpace/2-0.5, center.y+blast.r/2-extraSpace/2-0.5}, {center.x+(blast.r-extraSpace)*0.86603+0.5, center.y+(blast.r-extraSpace)*0.86603+0.5}}, 
				 {{center.x-(blast.r-extraSpace)*0.86603-0.5, center.y-(blast.r-extraSpace)*0.86603-0.5}, {center.x-blast.r/2+extraSpace/2+0.5, center.y-blast.r/2+extraSpace/2+0.5}}, 
				 {{center.x+blast.r/2-extraSpace/2-0.5, center.y-(blast.r-extraSpace)*0.86603-0.5}, {center.x+(blast.r-extraSpace)*0.86603+0.5, center.y-blast.r/2+extraSpace/2+0.5}}}

	if(blast.r<=500 or not blast.doItts) then
		area = regions[blast.itt]
	else

		local reg = blast.itt % (regNum/4)
		local currentQuadrant = (math.floor(blast.itt/(regNum/4)))%4
		local angleUnit = 2*3.14159/regNum
		local angleRelative = math.min(angleUnit*(reg+1), angleUnit*(regNum/4-reg-1))
		local angleStart = angleUnit*((regNum/4)*currentQuadrant+reg)
		local overstep = math.sqrt( (blast.r*math.sin(angleRelative))^2+2*blast.r*blast.speed+blast.speed*blast.speed)-blast.r*math.sin(angleRelative)+2;

		

		if(currentQuadrant==0) then
			if(reg<regNum/8) then
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit), center.y + (blast.r)*math.sin(angleStart)}, 
						{center.x + (blast.r)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)+overstep}}
			elseif(reg==regNum/8) then
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit), center.y + (blast.r-blast.speed)*math.sin(angleStart)}, 
							{center.x + (blast.r-blast.speed)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)}}
			else
				area = {{center.x + (blast.r)*math.cos(angleStart+angleUnit), center.y + (blast.r-blast.speed)*math.sin(angleStart)}, 
						{center.x + (blast.r-blast.speed)*math.cos(angleStart)+overstep, center.y + (blast.r)*math.sin(angleStart+angleUnit)}}
			end
		elseif(currentQuadrant==1) then
			if(reg<regNum/8) then
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit)-overstep, center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)}, 
						{center.x + (blast.r)*math.cos(angleStart), center.y + (blast.r)*math.sin(angleStart)}}
			elseif(reg==regNum/8) then
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit), center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)}, 
						{center.x + (blast.r-blast.speed)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart)}}
			else
				area = {{center.x + (blast.r)*math.cos(angleStart+angleUnit), center.y + (blast.r)*math.sin(angleStart+angleUnit)}, 
						{center.x + (blast.r-blast.speed)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart)+overstep}}
			end
		elseif(currentQuadrant==2) then
			if(reg<regNum/8) then
				area = {{center.x + (blast.r)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)-overstep}, 
						{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit), center.y + (blast.r)*math.sin(angleStart)}}
			elseif(reg==regNum/8) then
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)}, 
							{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit), center.y + (blast.r-blast.speed)*math.sin(angleStart)}}
			else
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart)-overstep, center.y + (blast.r)*math.sin(angleStart+angleUnit)}, 
						{center.x + (blast.r)*math.cos(angleStart+angleUnit), center.y + (blast.r-blast.speed)*math.sin(angleStart)}}
			end
		else
			if(reg<regNum/8) then
				area = {{center.x + (blast.r)*math.cos(angleStart), center.y + (blast.r)*math.sin(angleStart)}, 
						{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit)+overstep, center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)}}
			elseif(reg==regNum/8) then
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart)}, 
							{center.x + (blast.r-blast.speed)*math.cos(angleStart+angleUnit), center.y + (blast.r-blast.speed)*math.sin(angleStart+angleUnit)}}
			else
				area = {{center.x + (blast.r-blast.speed)*math.cos(angleStart), center.y + (blast.r-blast.speed)*math.sin(angleStart)-overstep}, 
						{center.x + (blast.r)*math.cos(angleStart+angleUnit), center.y + (blast.r)*math.sin(angleStart+angleUnit)}}
			end
		end
	end

	local entities = surface.find_entities(area)
	eHits = eHits + #entities
	--game.players[1].print(math.floor(blast.itt/6) .. " {" .. area[1][1] .. ", " .. area[1][2] .. "}, {" .. area[2][1] .. ", " .. area[2][2] .. "}")
	for _,entity in pairs(entities) do
		if (entity.valid and entity.position) then
			local xdif = entity.position.x-center.x
			local ydif = entity.position.y-center.y
			local distSq = xdif*xdif + ydif*ydif
			if((not (entity.prototype.max_health == 0)) and distSq > (blast.r - blast.speed)*(blast.r - blast.speed) and distSq <= blast["r"]*blast["r"]) then 
				local dist = math.sqrt(xdif*xdif + ydif*ydif)
				local damage = blast.pow/distSq*blast.damage_init+blast.blast_min_damage
				local t = entity.type
				if(t=="curved-rail") then
					damage = damage/10
				elseif (t=="straight-rail") then
					damage = damage/10
				elseif (t=="transport-belt") then
					damage = damage/10
				elseif (t=="land-mine") then
					damage = damage/10
				elseif(t=="car" or t=="spider-vehicle") then
					if (next(entity.prototype.collision_mask)==nil)then
						damage = damage/5
					end
				end
				if(t=="tree") then
					if(blast.fire) then
						surface.create_entity{name="fire-flame-on-tree",position=entity.position, initial_ground_flame_count=255}
					end
					damage = math.random(damage/10, damage)
				else
					damage = math.random(damage/2, damage*2)
				end
				if(t=="tree") then
					if((((not entity.prototype.resistances) or not entity.prototype.resistances.fire) and entity.health<damage) or (entity.prototype.resistances and entity.prototype.resistances.fire and entity.health<(damage-entity.prototype.resistances.explosion.decrease)*(1-entity.prototype.resistances.explosion.percent))) then
						local destPos = entity.position
						entity.destroy()
						surface.create_entity{name="tree-01-stump",position=destPos}
					else
						entity.damage(damage, "enemy","explosion")
					end
				else
					entity.damage(damage, "enemy","explosion")
				end
				if blast.fire and entity.valid and (entity.type == "unit" or entity.type == "car" or entity.type == "spider-vehicle") then
					local fireShield = nil
					if entity.grid then
						for _,e in pairs(entity.grid.equipment) do
							if(e.name=="fire-shield-equipment" and e.energy>=500000) then
								fireShield = e;
								break;
							end	
						end
					end
					if fireShield then
						fireShield.energy = fireShield.energy-500000
					else
						surface.create_entity{name="fire-sticker", position=entity.position, target=entity}
					end
					entity.damage(20, "enemy", "fire")
					if(entity.valid)then
						entity.damage(40, "enemy", "physical")
					end
					if(entity.valid and entity.type == "car" and (entity.prototype.max_health >= 1000 or fireShield)) then
						entity.damage(80, "enemy", "fire")
					end
				elseif blast.fire and entity.valid and (not (entity.type == "tree")) then
					entity.damage(100, "enemy", "fire")
				end
			end
		end
	end

	if(blast.fire) then
		local area = regions[blast.itt]
		local tiles = surface.find_tiles_filtered{area=area}
		for _,tile in pairs(tiles) do
			local xdif = tile.position.x-center.x
			local ydif = tile.position.y-center.y
			local distSq = xdif*xdif + ydif*ydif
			if(distSq > (blast["r"] - blast.speed)*(blast["r"] - blast.speed) and distSq <= blast["r"]*blast["r"]) then 
				if (blast.fire_rad >= blast.r) then 
					local chance = math.random(0, blast.fire_rad)
					if(chance*chance>distSq) then
						surface.create_entity{name="fire-flame",position=tile.position}
					else
						surface.create_entity{name="thermobaric-wave-fire",position=tile.position}
					end
				else
					local chanceWave = math.random(blast.fire_rad, blast.max)
					if(chanceWave*chanceWave>distSq) then
						surface.create_entity{name="thermobaric-wave-fire",position=tile.position}
					end
				end
			end
		end
	end
	if (blast.ittframe>=8) then
		if(blast.itt == regNum) then
			blast.r = blast.r + blast.speed
			blast.itt = 1
		else 
			blast.itt = blast.itt+1
			if(not blast.doItts or eHits<4000) then
				moveBlast(i, blast,eHits)
			end
		end
	end
	if(blast.r>blast.max) then
		table.remove(global.blastWaves, i)
	end
end

local function tickHandler(event)
	mushroomFunctions[2](event)
	 if(global.blastWaves ==nil) then
		global.blastWaves = {}
	 end
	if(#global.blastWaves>0) then
		for i,blast in ipairs(global.blastWaves) do
			moveBlast(i,blast,0)
		end
	end
end
script.on_event(defines.events.on_tick, tickHandler);





local function atomic_weapon_hit(event, crater_internal_r, crater_external_r, fireball_r, fire_outer_r, blast_max_r, tree_fire_max_r, thermal_max_r, load_r, visable_r, flame_proportion, create_small_fires)
	 local force
	 local position = event.target_position
	 if(not position) then
	 	position = event.source_position
	 end
	 if(not (event.source_entity==nil)) then
	 	force = event.source_entity.force
	 else
		force = "enemy"
	 end
	 if(global.waitingNukes ==nil) then
		global.waitingNukes = {}
	 end
	 if crater_internal_r>0 and settings.global["crater-water-filling"].value then
	 	table.insert(global.waitingNukes, {t = 0, pos = position, d = crater_internal_r, s = event.surface_index})
	 end
	 game.surfaces[event.surface_index].request_to_generate_chunks(position, load_r/32)
	 game.surfaces[event.surface_index].force_generate_chunk_requests()

	 for _,f in pairs(game.forces) do
		f.chart(game.surfaces[event.surface_index], {{position.x-visable_r,position.y-visable_r},{position.x+visable_r,position.y+visable_r}})
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_entities_filtered{position=position, radius=fireball_r}) do
		if(v.valid and (not (string.match(v.type, "ghost")))) then
			if v.type=="tree" or not v.die(nil) then
				v.destroy()
			end
		end
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_decoratives_filtered{area = {{position.x-fireball_r, position.y-fireball_r}, {position.x+fireball_r, position.y+fireball_r}}}) do
		if(v.position.x*v.position.x+v.position.y*v.position.y<=fireball_r) then
			game.surfaces[event.surface_index].destroy_decoratives{position = v.position};
		end
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_entities_filtered{position=position, radius=fireball_r}) do
		if(not (string.match(v.type, "ghost"))) then
			v.die(nil);
			v.destroy();
		end
	 end
	 local tileTable = {}
	 for _,v in pairs(game.surfaces[event.surface_index].find_tiles_filtered{position=position, radius=crater_external_r}) do
		table.insert(tileTable, {name = "nuclear-ground", position = v.position})
	 end
	 game.surfaces[event.surface_index].set_tiles(tileTable)
	 for _,v in pairs(game.surfaces[event.surface_index].find_tiles_filtered{position=position, radius=fire_outer_r}) do
		local rand = math.random(0, fire_outer_r)
		if(math.random(0, flame_proportion)<1 and rand*rand>(v.position.x-position.x)*(v.position.x-position.x)+(v.position.y-position.y)*(v.position.y-position.y)) then 
			game.surfaces[event.surface_index].create_entity{name="nuclear-fire",position=v.position}
		end
	 end
	 if (settings.global["nuke-random-fires"].value and create_small_fires) then
		for i=0,(tree_fire_max_r*tree_fire_max_r/10) do
			local dist = math.random(0, math.random(0, tree_fire_max_r))
			local angle = math.random()*3.1416*2
			game.surfaces[event.surface_index].create_entity{name="thermobaric-wave-fire",position={position.x+dist*math.cos(angle), position.y+dist*math.sin(angle)}}
		end
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_entities_filtered{position=position, radius=thermal_max_r}) do
		if(v.valid and not (v.prototype.max_health == 0)) then
			local distSq = (v.position.x-position.x)*(v.position.x-position.x)+(v.position.y-position.y)*(v.position.y-position.y)
			if(distSq>fireball_r) then
				local damage = thermal_max_r*thermal_max_r/distSq*10	
				if(v.type=="tree") then
					if(math.random(0, 100)<1) then
						game.surfaces[event.surface_index].create_entity{name="fire-flame-on-tree",position=v.position, initial_ground_flame_count=1+math.min(254,thermal_max_r*thermal_max_r/distSq)}
					end
					local damage = math.random(damage/10, damage)
					if((((not v.prototype.resistances) or not v.prototype.resistances.fire) and v.health<damage) or (v.prototype.resistances and v.prototype.resistances.fire and v.health<(damage-v.prototype.resistances.fire.decrease)*(1-v.prototype.resistances.fire.percent))) then
						local surface = v.surface
						local destPos = v.position
						v.destroy()
						surface.create_entity{name="tree-01-stump",position=destPos}
					else
						v.damage(damage, force,"fire")
					end
				else
					v.damage(math.random(damage/2, damage*2), force,"fire")
					if(v.valid and (v.type == "unit" or v.type == "car" or v.type == "spider-vehicle")) then
						local fireShield = nil
						if v.grid then
							for _,e in pairs(v.grid.equipment) do
								if(e.name=="fire-shield-equipment" and e.energy>=1000000) then
									fireShield = e;
									break;
								end	
							end
						end
						if fireShield then
							fireShield.energy = fireShield.energy-1000000
						else
							game.surfaces[event.surface_index].create_entity{name="fire-sticker", position=v.position, target=v}
						end
					end
				end
			end
		end
	 end
	 table.insert(global.blastWaves, {r = fireball_r, pos = position, pow = fireball_r*fireball_r, max = blast_max_r, s = event.surface_index, fire = false, damage_init = 5000.0, speed = 8, fire_rad = 0, blast_min_damage = 0, itt = 1, doItts = true, ittframe = 1})
end

local function thermobaric_weapon_hit(event, explosion_r, blast_max_r, fire_r, load_r, visable_r)
	 local force
	 local position = event.target_position
	 if(not (event.source_entity==nil)) then
	 	force = event.source_entity.force
	 else
		force = "enemy"
	 end
	 game.surfaces[event.surface_index].request_to_generate_chunks(position, load_r/32)
	 game.surfaces[event.surface_index].force_generate_chunk_requests()

	 for _,f in pairs(game.forces) do
		f.chart(game.surfaces[event.surface_index], {{position.x-visable_r,position.y-visable_r},{position.x+visable_r,position.y+visable_r}})
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_tiles_filtered{position=position, radius=explosion_r}) do
		game.surfaces[event.surface_index].create_entity{name="fire-flame",position=v.position}
	 end
	 table.insert(global.blastWaves, {r = explosion_r, pos = position, pow = explosion_r*explosion_r, max = blast_max_r, s = event.surface_index, fire = true, damage_init = 600.0, speed = 1, fire_rad = fire_r, blast_min_damage = 30, itt = 1, doItts = false, ittframe = 1})
end



local function nukeFiredScan(event)
	local entity;
	if(event.entity) then
	 	entity = event.entity
	elseif(event.source_entity) then
	 	entity = event.source_entity
	end
	if (entity) then
		local position = event.target_entity.position 
		if(entity.prototype.name == "TN-very-big-atomic-artillery-projectile") then
	 		game.surfaces[event.surface_index].request_to_generate_chunks(position, 2500/32)
		elseif(entity.prototype.name == "TN-big-atomic-artillery-projectile") then
	 		game.surfaces[event.surface_index].request_to_generate_chunks(position, 1500/32)
		elseif(entity.prototype.name == "TN-atomic-artillery-projectile" or entity.prototype.name == "big-atomic-bomb-projectile") then
	 		game.surfaces[event.surface_index].request_to_generate_chunks(position, 800/32)
		elseif(entity.prototype.name == "TN-small-atomic-artillery-projectile" or entity.prototype.name == "very-big-atomic-bomb-projectile") then
	 		game.surfaces[event.surface_index].request_to_generate_chunks(position, 400/32)
		end
	end
end


--local function atomic_weapon_hit(event, crater_internal_r, crater_external_r, fireball_r, fire_outer_r, blast_max_r, tree_fire_max_r, thermal_max_r, load_r, visable_r, flame_proportion)
script.on_event(defines.events.on_script_trigger_effect, function(event)
  if(event.effect_id=="Thermobaric Weapon hit small-") then
	 thermobaric_weapon_hit(event, 1, 15, 10, 10, 10);
  elseif(event.effect_id=="Thermobaric Weapon hit small") then
	 thermobaric_weapon_hit(event, 3, 30, 20, 30, 15);
  elseif(event.effect_id=="Thermobaric Weapon hit small+") then
	 thermobaric_weapon_hit(event, 4, 45, 30, 45, 25);
  elseif(event.effect_id=="Thermobaric Weapon hit medium-") then
	 thermobaric_weapon_hit(event, 5, 60, 40, 60, 35);
  elseif(event.effect_id=="Thermobaric Weapon hit medium") then
	 thermobaric_weapon_hit(event, 6, 80, 50, 80, 50);
  elseif(event.effect_id=="Thermobaric Weapon hit large") then
	 thermobaric_weapon_hit(event, 9, 120, 100, 120, 100);
  elseif(event.effect_id=="Atomic Weapon hit 0.1t") then
	 atomic_weapon_hit(event, 0, 1, 1, 3, 30, 15, 30, 15, 15, 1, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 60, 100, 200, 700, 10, 0.06);
  elseif(event.effect_id=="Atomic Weapon hit 0.5t") then
	 atomic_weapon_hit(event, 0, 3, 3, 5, 50, 25, 30, 30, 20, 1, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 80, 150, 300, 1000, 20, 0.12);
  elseif(event.effect_id=="Atomic Weapon hit 2t") then
	 atomic_weapon_hit(event, 0, 5, 5, 15, 80, 50, 100, 100, 50, 2, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 100, 250, 500, 2000, 40, 0.25);
  elseif(event.effect_id=="Atomic Weapon hit 4t") then
	 atomic_weapon_hit(event, 1, 6, 7, 20, 130, 120, 150, 180, 80, 1, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 120, 300, 900, 4000, 70, 0.4);
  elseif(event.effect_id=="Atomic Weapon hit 8t") then
	 atomic_weapon_hit(event, 3, 8, 14, 25, 200, 200, 200, 180, 100, 1, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 150, 400, 1250, 10000, 100, 0.6);
  elseif(event.effect_id=="Atomic Weapon hit 20t") then
	 atomic_weapon_hit(event, 5, 10, 20, 30, 320, 320, 320, 180, 150, 1, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 250, 600, 1800, 15000, 160, 1);
  elseif(event.effect_id=="Atomic Weapon hit 500t") then
	 atomic_weapon_hit(event, 10, 20, 40, 35, 400, 400, 600, 400, 300, 1*settings.global["large-nuke-fire-scaledown"].value, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 400, 800, 2500, 25000, 300, 2);
  elseif(event.effect_id=="Atomic Weapon hit 1kt") then
	 atomic_weapon_hit(event, 20, 40, 80, 75, 800, 800, 1200, 800, 300, 2*settings.global["large-nuke-fire-scaledown"].value, true);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 600, 1200, 8000, 60000, 600, 4);
  elseif(event.effect_id=="Atomic Weapon hit 15kt") then
	 atomic_weapon_hit(event, 50, 100, 200, 150, 2000/settings.global["large-nuke-blast-range-scaledown"].value, 1000, 3000, 1000, 500, settings.global["huge-nuke-fire-scaledown"].value, false);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 1500, 3000, 20000, 100000, 1500, 8);
  elseif(event.effect_id=="Atomic Weapon hit 100kt") then
	 atomic_weapon_hit(event, 90, 180, 500, 400, 5500/settings.global["really-huge-nuke-blast-range-scaledown"].value, 2500, 6000, 1500, 1000, 2*settings.global["really-huge-nuke-fire-scaledown"].value, false);
	 createBlastSoundsAndFlash(event.target_position, game.surfaces[event.surface_index], 2700, 5400, 36000, 200000, 2700, 16);
  elseif(event.effect_id=="Nuke firing") then
	 nukeFiredScan(event);
  end
end)




script.on_nth_tick(3600, function(event)
	if(global.waitingNukes ==nil) then
		global.waitingNukes = {}
	end
	if(#global.waitingNukes>0) then
		for _,v in pairs(global.waitingNukes) do
			if(v["t"]>5+v["d"]) then
				local force = nil
				for _,w in pairs(game.surfaces[v["s"]].find_entities_filtered{position=v["pos"], radius=v["t"]-4}) do
					if(string.match(w.type, "ghost") or w.prototype.is_building) then
						force = w.force
						break
					end
				end
				if(not (force==nil)) then
					for j,w in ipairs(game.surfaces[v["s"]].find_tiles_filtered{position=v["pos"], radius=v["t"]-3}) do
						game.surfaces[v["s"]].create_entity{name="tile-ghost",position=w.position,inner_name="landfill",force=force}
					end
				end
				table.remove(global.waitingNukes, i)
			else 
				v["t"] = v["t"]+1
				if(v["t"]>5) then
					 for _,w in pairs(game.surfaces[v["s"]].find_entities_filtered{position=v["pos"], radius=v["t"]-3}) do
						if(w.prototype.is_building) then
							w.die(nil)
						end
					 end
					 local tileTable = {}
					 for _,w in pairs(game.surfaces[v["s"]].find_tiles_filtered{position=v["pos"], radius=v["t"]-4}) do
						if((w.position["x"]-v["pos"]["x"])*(w.position["x"]-v["pos"]["x"])+(w.position["y"]-v["pos"]["y"])*(w.position["y"]-v["pos"]["y"])>=(math.max(v["t"]-10, 0))*(v["t"]-10)) then
							table.insert(tileTable, {name = "water-shallow", position = w.position})
						end
					 end
					 game.surfaces[v["s"]].set_tiles(tileTable, true, false)
				end
			end
		end
	end
end)
