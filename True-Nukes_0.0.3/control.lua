

script.on_init(function()
	global.waitingNukes = {}
	global.nukeBlasts = {}
end)


local function moveBlast()
	 if(global.nukeBlasts ==nil) then
		global.nukeBlasts = {}
	 end
	if(#global.nukeBlasts>0) then
		
		for _,blast in pairs(global.nukeBlasts) do
			local surface = game.surfaces[blast["s"]]
			local center = blast["pos"]
			local regions = {{{center.x-blast.r/2-4.5, center.y+(blast.r-3)*0.86603}, {center.x+blast.r/2+4.5, center.y+blast.r}}, 
					 		 {{center.x-blast.r/2-4.5, center.y-blast.r}, {center.x+blast.r/2+4.5, center.y-(blast.r-3)*0.86603}}, 
							 {{center.x+(blast.r-3)*0.86603, center.y-blast.r/2-4.5}, {center.x+blast.r, center.y+blast.r/2+4.5}}, 
							 {{center.x-blast.r, center.y-blast.r/2-4.5}, {center.x-(blast.r-3)*0.86603, center.y+blast.r/2+4.5}}, 

							 {{center.x-(blast.r-3)*0.86603, center.y+blast.r/2-1.5}, {center.x-blast.r/2+1.5, center.y+(blast.r-3)*0.86603}}, 
							 {{center.x+blast.r/2-1.5, center.y+blast.r/2-1.5}, {center.x+(blast.r-3)*0.86603, center.y+(blast.r-3)*0.86603}}, 
							 {{center.x-(blast.r-3)*0.86603, center.y-(blast.r-3)*0.86603}, {center.x-blast.r/2+1.5, center.y-blast.r/2+1.5}}, 
							 {{center.x+blast.r/2-1.5, center.y-(blast.r-3)*0.86603}, {center.x+(blast.r-3)*0.86603, center.y-blast.r/2+1.5}}}
			for _,area in pairs(regions) do
				local entities = surface.find_entities(area)
				for _,entity in pairs(entities) do
					if entity.valid then
						local xdif = entity.position.x-center.x
						local ydif = entity.position.y-center.y
						local distSq = xdif*xdif + ydif*ydif
						if((not (entity.prototype.max_health == 0)) and distSq > (blast["r"] - 3)*(blast["r"] - 3) and distSq <= blast["r"]*blast["r"]) then 
							local dist = math.sqrt(xdif*xdif + ydif*ydif)
							local damage = blast.pow/distSq*5000.0
							local t = entity.type
							if(t=="curved-rail") then
								damage = damage/10
							elseif (t=="straight-rail") then
								damage = damage/10
							elseif (t=="transport-belt") then
								damage = damage/10
							end
							if(t=="tree") then
								damage = math.random(damage/10, damage)
							else
								damage = math.random(damage/2, damage*2)
							end
							entity.damage(math.random(damage/2, damage*2), "enemy","impact")
						elseif (entity.type =="explosion" and not (entity.name=="big-artillery-explosion")) then
							entity.destroy()
						end
					end
				end
			end
			blast.r = blast.r + 3
			if(blast.r>blast.max) then
				table.remove(global.nukeBlasts, i)
			end
		end
	end
end
script.on_event(defines.events.on_tick, moveBlast);



local function atomic_weapon_hit(event, crater_internal_r, crater_external_r, fireball_r, fire_outer_r, blast_max_r, tree_fire_max_r, thermal_max_r, load_r, visable_r, flame_proportion)
	 local force
	 if(not (event.source_entity==nil)) then
	 	force = event.source_entity.force
	 else
		force = "enemy"
	 end
	 if(global.waitingNukes ==nil) then
		global.waitingNukes = {}
	 end
	 if crater_internal_r>0 and settings.global["crater-water-filling"].value then
	 	table.insert(global.waitingNukes, {t = 0, pos = event.target_position, d = crater_internal_r, s = event.surface_index})
	 end
	 game.surfaces[event.surface_index].request_to_generate_chunks(event.target_position, load_r/32)
	 game.surfaces[event.surface_index].force_generate_chunk_requests()

	 for _,f in pairs(game.forces) do
		f.chart(game.surfaces[event.surface_index], {{event.target_position.x-visable_r,event.target_position.y-visable_r},{event.target_position.x+visable_r,event.target_position.y+visable_r}})
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_entities_filtered{position=event.target_position, radius=fireball_r}) do
		if( not (string.match(v.type, "ghost"))) then
			if v.type=="tree" or not v.die(nil) then
				v.destroy()
			end
		end
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_entities_filtered{position=event.target_position, radius=fireball_r}) do
		if(not (string.match(v.type, "ghost"))) then
			v.destroy()
		end
	 end
	 local tileTable = {}
	 for _,v in pairs(game.surfaces[event.surface_index].find_tiles_filtered{position=event.target_position, radius=crater_external_r}) do
		table.insert(tileTable, {name = "landfill", position = v.position})
	 end
	 game.surfaces[event.surface_index].set_tiles(tileTable)
	 for _,v in pairs(game.surfaces[event.surface_index].find_tiles_filtered{position=event.target_position, radius=fire_outer_r}) do
		local rand = math.random(0, fire_outer_r)
		if(math.random(0, flame_proportion)<1 and rand*rand>(v.position.x-event.target_position.x)*(v.position.x-event.target_position.x)+(v.position.y-event.target_position.y)*(v.position.y-event.target_position.y)) then 
			game.surfaces[event.surface_index].create_entity{name="fire-flame",position=v.position}
		end
	 end
	 for _,v in pairs(game.surfaces[event.surface_index].find_entities_filtered{position=event.target_position, radius=thermal_max_r}) do
		if(not (v.prototype.max_health == 0)) then
			local distSq = (v.position.x-event.target_position.x)*(v.position.x-event.target_position.x)+(v.position.y-event.target_position.y)*(v.position.y-event.target_position.y)
			if(distSq>fireball_r) then
				local damage = thermal_max_r*thermal_max_r/distSq*10
				if(v.type=="tree") then
					if(math.random(0, 100)<1) then
						game.surfaces[event.surface_index].create_entity{name="fire-flame-on-tree",position=v.position, initial_ground_flame_count=1+math.min(254,thermal_max_r*thermal_max_r/distSq)}
					end
			 		v.damage(math.random(damage/10, damage), force,"fire")
				else
					v.damage(math.random(damage/2, damage*2), force,"fire")
				end
			end
		end
	 end
	 table.insert(global.nukeBlasts, {r = fireball_r, pos = event.target_position, pow = fireball_r*fireball_r, max = blast_max_r, s = event.surface_index})
end


--local function atomic_weapon_hit(event, crater_internal_r, crater_external_r, fireball_r, fire_outer_r, blast_max_r, tree_fire_max_r, thermal_max_r, load_r, visable_r, flame_proportion)
script.on_event(defines.events.on_script_trigger_effect, function(event)
  if(event.effect_id=="Atomic Weapon hit 2t") then
	 atomic_weapon_hit(event, 0, 5, 5, 8, 80, 50, 100, 100, 50, 2);
  elseif(event.effect_id=="Atomic Weapon hit 20t") then
	 atomic_weapon_hit(event, 5, 10, 20, 30, 320, 320, 320, 180, 150, 1);
  elseif(event.effect_id=="Atomic Weapon hit 500t") then
	 atomic_weapon_hit(event, 10, 20, 40, 35, 400, 400, 600, 400, 300, 1);
  elseif(event.effect_id=="Atomic Weapon hit 1kt") then
	 atomic_weapon_hit(event, 20, 40, 80, 75, 800, 800, 1200, 800, 300, 2);
  elseif(event.effect_id=="Atomic Weapon hit 15kt") then
	 atomic_weapon_hit(event, 50, 100, 200, 150, 1100, 1000, 3000, 1000, 500, 10);
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
