

script.on_init(function()
	global.waitingNukes = {}
	global.blastWaves = {}
end)

local function moveBlast()
	 if(global.blastWaves ==nil) then
		global.blastWaves = {}
	 end
	if(#global.blastWaves>0) then
		
		for i,blast in ipairs(global.blastWaves) do
			local surface = game.surfaces[blast["s"]]
			local center = blast["pos"]
			local sideOffset = blast.speed*1.5
			local extraSpace = blast.speed
			local regions = {{{center.x-blast.r/2-sideOffset, center.y+(blast.r-extraSpace)*0.86603-0.5}, {center.x+blast.r/2+sideOffset, center.y+blast.r+1}}, 
					 		 {{center.x-blast.r/2-sideOffset, center.y-blast.r}, {center.x+blast.r/2+sideOffset, center.y-(blast.r-extraSpace)*0.86603+0.5}}, 
							 {{center.x+(blast.r-extraSpace)*0.86603-0.5, center.y-blast.r/2-sideOffset}, {center.x+blast.r+1, center.y+blast.r/2+sideOffset}}, 
							 {{center.x-blast.r, center.y-blast.r/2-sideOffset}, {center.x-(blast.r-extraSpace)*0.86603+0.5, center.y+blast.r/2+sideOffset}}, 

							 {{center.x-(blast.r-extraSpace)*0.86603-0.5, center.y+blast.r/2-extraSpace/2-0.5}, {center.x-blast.r/2+extraSpace/2+0.5, center.y+(blast.r-extraSpace)*0.86603+0.5}}, 
							 {{center.x+blast.r/2-extraSpace/2-0.5, center.y+blast.r/2-extraSpace/2-0.5}, {center.x+(blast.r-extraSpace)*0.86603+0.5, center.y+(blast.r-extraSpace)*0.86603+0.5}}, 
							 {{center.x-(blast.r-extraSpace)*0.86603-0.5, center.y-(blast.r-extraSpace)*0.86603-0.5}, {center.x-blast.r/2+extraSpace/2+0.5, center.y-blast.r/2+extraSpace/2+0.5}}, 
							 {{center.x+blast.r/2-extraSpace/2-0.5, center.y-(blast.r-extraSpace)*0.86603-0.5}, {center.x+(blast.r-extraSpace)*0.86603+0.5, center.y-blast.r/2+extraSpace/2+0.5}}}
			for _,area in pairs(regions) do
				local entities = surface.find_entities(area)
				for _,entity in pairs(entities) do
					if entity.valid then
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
							end
							if(t=="tree") then
								if(blast.fire) then
									surface.create_entity{name="fire-flame-on-tree",position=entity.position, initial_ground_flame_count=255}
								end
								damage = math.random(damage/10, damage)
							else
								damage = math.random(damage/2, damage*2)
							end
							entity.damage(math.random(damage/2, damage*2), "enemy","impact")
							if blast.fire and entity.valid and (entity.type == "unit" or entity.type == "car") then
								surface.create_entity{name="fire-sticker", position=entity.position, target=entity}
								entity.damage(20, "enemy", "fire")
								if(entity.valid and entity.name =="tank") then
									entity.damage(100, "enemy", "fire")
								end
							elseif blast.fire and entity.valid and (not (entity.type == "tree")) then
								entity.damage(100, "enemy", "fire")
							end
						elseif ((not (blast.fire)) and entity.type =="explosion" and not (entity.name=="nuke-explosion")) then
							entity.destroy()
						end
					end
				end
			end
			if(blast.fire) then
				for _,area in pairs(regions) do
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
			end
			blast.r = blast.r + blast.speed
			if(blast.r>blast.max) then
				table.remove(global.blastWaves, i)
			end
		end
	end
end
script.on_event(defines.events.on_tick, moveBlast);



local function atomic_weapon_hit(event, crater_internal_r, crater_external_r, fireball_r, fire_outer_r, blast_max_r, tree_fire_max_r, thermal_max_r, load_r, visable_r, flame_proportion)
	 local force
	 local position = event.target_position
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
	 if (settings.global["nuke-random-fires"].value) then
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
				if(not (v.name=="spidertron")) then
					if(v.type=="tree") then
						if(math.random(0, 100)<1) then
							game.surfaces[event.surface_index].create_entity{name="fire-flame-on-tree",position=v.position, initial_ground_flame_count=1+math.min(254,thermal_max_r*thermal_max_r/distSq)}
						end
				 		v.damage(math.random(damage/10, damage), force,"fire")
					else
						v.damage(math.random(damage/2, damage*2), force,"fire")
						if(v.valid and (v.type == "unit" or v.type == "car")) then
							game.surfaces[event.surface_index].create_entity{name="fire-sticker", position=v.position, target=v}
						end
					end
				end
			end
		end
	 end
	 table.insert(global.blastWaves, {r = fireball_r, pos = position, pow = fireball_r*fireball_r, max = blast_max_r, s = event.surface_index, fire = false, damage_init = 5000.0, speed = 2, fire_rad = 0, blast_min_damage = 0})
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
	 table.insert(global.blastWaves, {r = explosion_r, pos = position, pow = explosion_r*explosion_r, max = blast_max_r, s = event.surface_index, fire = true, damage_init = 400.0, speed = 1, fire_rad = fire_r, blast_min_damage = 30})
end


--local function atomic_weapon_hit(event, crater_internal_r, crater_external_r, fireball_r, fire_outer_r, blast_max_r, tree_fire_max_r, thermal_max_r, load_r, visable_r, flame_proportion)
script.on_event(defines.events.on_script_trigger_effect, function(event)
  if(event.effect_id=="Thermobaric Weapon hit small") then
	 thermobaric_weapon_hit(event, 3, 40, 25, 40, 20);
  elseif(event.effect_id=="Thermobaric Weapon hit medium") then
	 thermobaric_weapon_hit(event, 6, 80, 50, 80, 50);
  elseif(event.effect_id=="Thermobaric Weapon hit large") then
	 thermobaric_weapon_hit(event, 9, 120, 100, 120, 100);
  elseif(event.effect_id=="Atomic Weapon hit 2t") then
	 atomic_weapon_hit(event, 0, 5, 5, 15, 80, 50, 100, 100, 50, 2);
  elseif(event.effect_id=="Atomic Weapon hit 20t") then
	 atomic_weapon_hit(event, 5, 10, 20, 30, 320, 320, 320, 180, 150, 1);
  elseif(event.effect_id=="Atomic Weapon hit 500t") then
	 atomic_weapon_hit(event, 10, 20, 40, 35, 400, 400, 600, 400, 300, 1);
  elseif(event.effect_id=="Atomic Weapon hit 1kt") then
	 atomic_weapon_hit(event, 20, 40, 80, 75, 800, 800, 1200, 800, 300, 2);
  elseif(event.effect_id=="Atomic Weapon hit 15kt") then
	 atomic_weapon_hit(event, 50, 100, 200, 150, 2000/settings.global["hiroshima-blast-range-scaledown"].value, 1000, 3000, 1000, 500, settings.global["hiroshima-fire-scaledown"].value);
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
