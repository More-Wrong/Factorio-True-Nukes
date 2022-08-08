local util = require("warheads")



local function sanitseWeapontype(weapontype)
  local item = weapontype.item
  local projectile = weapontype.projectile

  local result = {}
  result.type = weapontype.type -- projectile, artillery, land-mine, bullet, capsule, other...

  result.name = weapontype.baseName
  result.order = weapontype.baseOrder or weapontype.item.order

  result.size = {}
  result.size.max = weapontype.size or weapontype.max_size
  result.size.min = weapontype.min_size
  if (type(result.size.max)=="string") then
    result.size.max = util.sizes[result.size.max]
  else
    result.size.max = result.size.max or util.sizes["all"]
  end
  if (type(result.size.min)=="string") then
    result.size.min = util.sizes[result.size.min]
  else
    result.size.min = result.size.min or util.sizes["none"]
  end


  result.appearance = {}
  result.appearance.image_base_shift = weapontype.image_base_shift
  result.appearance.image_warhead_shift = weapontype.image_warhead_shift
  result.appearance.ignore_warhead_image = weapontype.ignore_warhead_image

  result.appearances = {}
  result.appearances["default"] = {}

  if (weapontype.icons) then
    for w, e in pairs(weapontype.icons) do
      if not result.appearances[w] then
        result.appearances[w] = {}
      end
      if(type(e) == "table" and e.filename == nil and e.icon == nil) then
        result.appearances[w].icons = e
      else
        result.appearances[w].icon = e
      end
    end
  end
  if (weapontype.pictures) then
    for w, e in pairs(weapontype.pictures) do
      if not result.appearances[w] then
        result.appearances[w] = {}
      end
      if(type(e) == "table" and e.filename == nil and e.icon == nil) then
        result.appearances[w].pictures = e
      else
        result.appearances[w].picture = e
      end
    end
  end
  if (weapontype.lights) then
    for w, e in pairs(weapontype.lights) do
      if not result.appearances[w] then
        result.appearances[w] = {}
      end
      if(type(e) == "table" and e.filename == nil and e.icon == nil) then
        result.appearances[w].lights = e
      else
        result.appearances[w].light = e
      end
    end
  end
  if(weapontype.icon) then
    result.appearances["default"].icon = weapontype.icon
  end
  if(weapontype.picture) then
    result.appearances["default"].picture = weapontype.picture
  end
  if(weapontype.light) then
    result.appearances["default"].light = weapontype.light
  end

  if (result.appearances["default"].icon == nil and result.appearances["default"].icons == nil) then
    if(item.icon) then
      result.appearances["default"].icon = item.icon
    else
      result.appearances["default"].icons = item.icons
    end
  end

  result.item = {}
  result.item.subgroup = weapontype.subgroup or item.subgroup
  result.item.stack_size = weapontype.stack_size or item.stack_size

  result.item.magazine_size = weapontype.magazine_size or item.magazine_size or 1
  result.item.reload_time = weapontype.reload_time or item.reload_time or 0

  result.item.radius_color = weapontype.radius_color

  result.item.default_radius_color = weapontype.default_radius_color or item.radius_color

  result.item.target_type = weapontype.target_type
  if(item.ammo_type and not result.item.target_type) then result.item.target_type = item.ammo_type.target_type end
  result.item.target_type = result.item.target_type or "entity"

  result.item.range_modifier = weapontype.range_modifier
  if(item.ammo_type and not result.item.range_modifier) then result.item.range_modifier = item.ammo_type.range_modifier end
  result.item.range_modifier = result.item.range_modifier or 1

  result.item.cooldown_modifier = weapontype.cooldown_modifier
  if(item.ammo_type and not result.item.cooldown_modifier) then result.item.cooldown_modifier = item.ammo_type.cooldown_modifier end
  result.item.cooldown_modifier = result.item.cooldown_modifier or 1

  result.item.clamp_position = weapontype.clamp_position
  if(item.ammo_type and (result.item.clamp_position == nil)) then result.item.clamp_position = item.ammo_type.clamp_position end

  result.item.action_creator = weapontype.action_creator

  result.item.ammo_category = weapontype.ammo_category
  if(item.ammo_type and (result.item.ammo_category == nil)) then result.item.ammo_category = item.ammo_type.category end

  -- default action creators
  if not result.item.action_creator then
    if result.type == "projectile" or result.type == "artillery" then
      result.item.action_creator = function (projectile, range_mult, target_effects, final_effects, source_effects)
        local a = table.deepcopy(item.ammo_type.action)
        a.action_delivery.projectile = projectile
        if(a.action_delivery.max_range) then
          a.action_delivery.max_range = range_mult * a.action_delivery.max_range
        end
        if not a.action_delivery.source_effects then
          a.action_delivery.source_effects = {}
        end
        if source_effects then
          for _,e in pairs(source_effects) do
            table.insert(a.action_delivery.source_effects, e)
          end
        end
        return a
      end
    elseif result.type == "land-mine" then
      result.item.action_creator = function (projectile, range_mult, target_effects, final_effects, source_effects)
        local a = table.deepcopy(item.action)
        if not a.action_delivery.source_effects then
          a.action_delivery.source_effects = {}
        end
        if source_effects then
          for _,e in pairs(source_effects) do
            table.insert(a.action_delivery.source_effects, e)
          end
        end
        if not a.action_delivery.target_effects then
          a.action_delivery.target_effects = {}
        end
        if target_effects then
          for _,e in pairs(target_effects) do
            table.insert(a.action_delivery.target_effects, e)
          end
        end
        return a
      end
    elseif result.type == "bullet" then
      result.item.action_creator = function (projectile, range_mult, target_effects, final_effects, source_effects)
        local a = table.deepcopy(item.ammo_type.action)
        if not a.action_delivery.target_effects then
          a.action_delivery.target_effects = {}
        end
        if target_effects then
          for _,e in pairs(target_effects) do
            table.insert(a.action_delivery.target_effects, e)
          end
        end
        if final_effects then
          for _,e in pairs(final_effects) do
            table.insert(a.action_delivery.target_effects, e)
          end
        end
        if not a.action_delivery.source_effects then
          a.action_delivery.source_effects = {}
        end
        if source_effects then
          for _,e in pairs(source_effects) do
            table.insert(a.action_delivery.source_effects, e)
          end
        end
        return a

      end

    elseif result.type == "capsule" then
      --should work on grenades... not sure about much else
      result.item.action_creator = function (projectile, range_mult, target_effects, final_effects, source_effects)
        local a = table.deepcopy(item.capsule_action)
        if not a.attack_parameters.ammo_type.action[2].action_delivery.source_effects then
          a.attack_parameters.ammo_type.action[2].action_delivery.source_effects = {}
        end
        for _,e in pairs(source_effects) do
          table.insert(a.attack_parameters.ammo_type.action[2].action_delivery.source_effects, e)
        end
        a.attack_parameters.ammo_type.action[1].action_delivery.projectile = projectile
        return a

      end

    end
  end

  result.weapontype = weapontype

  result.recipe = {}
  result.recipe.result_count = weapontype.result_count or 1
  result.recipe.additional_results = weapontype.additional_results or {}

  result.recipe.ingredients = {{name = weapontype.base_item, amount = 1}}
  if(weapontype.extra_ingredients) then
    for _,i in pairs(weapontype.extra_ingredients) do
      table.insert(result.recipe.ingredients, i)
    end
  end
  result.recipe.energy_required = weapontype.energy_required
  result.recipe.warhead_count = weapontype.warhead_count or 1

  result.land_mine = {}
  result.land_mine.corpse = weapontype.land_mine_corpse  or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).corpse
  result.land_mine.trigger_radius = weapontype.trigger_radius  or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).trigger_radius
  result.land_mine.max_health = weapontype.land_mine_max_health or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).max_health
  result.land_mine.damaged_trigger_effect = weapontype.land_mine_damaged_trigger_effect or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).damaged_trigger_effect
  result.land_mine.selection_box = weapontype.land_mine_selection_box or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).selection_box
  result.land_mine.collision_box = weapontype.land_mine_collision_box or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).collision_box
  result.land_mine.dying_explosion = weapontype.land_mine_dying_explosion or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).dying_explosion

  result.land_mine.pictures = weapontype.land_mine_pictures
  if not result.land_mine.pictures then
    result.land_mine.pictures = {}
  end
  if not result.land_mine.pictures["default"] then
    result.land_mine.pictures["default"] = {
      picture_safe = (weapontype.landmine or data.raw["land-mine"]["land-mine"]).picture_safe,
      picture_set = (weapontype.landmine or data.raw["land-mine"]["land-mine"]).picture_set,
      picture_set_enemy = (weapontype.landmine or data.raw["land-mine"]["land-mine"]).picture_set_enemy
    }
  end
  result.land_mine.minable = {
    mining_time = weapontype.land_mine_mining_time or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).mining_time,
    mining_particle = weapontype.land_mine_mining_particle or (weapontype.landmine or data.raw["land-mine"]["land-mine"]).mining_particle
  }

  result.projectile = {}
  if weapontype.projectile then
    result.projectile.acceleration = weapontype.acceleration or weapontype.projectile.acceleration
    result.projectile.picture = weapontype.picture or weapontype.animation or weapontype.projectile.picture or weapontype.projectile.animation
    result.projectile.shadow = weapontype.shadow  or weapontype.projectile.shadow
    result.projectile.smoke = weapontype.smoke  or weapontype.projectile.smoke
    result.projectile.light = weapontype.light  or weapontype.projectile.light
    result.projectile.animation = weapontype.animation or weapontype.picture or weapontype.projectile.animation or weapontype.projectile.picture
    result.projectile.max_speed = weapontype.max_speed  or weapontype.projectile.max_speed

    result.projectile.height = weapontype.height or weapontype.height_from_ground or weapontype.projectile.height or weapontype.projectile.height_from_ground

    result.projectile.direction_only = weapontype.direction_only

    if(weapontype.direction_only == nil) then
      result.projectile.direction_only =  weapontype.projectile.direction_only
    end
    result.projectile.turn_speed = weapontype.turn_speed  or weapontype.projectile.turn_speed

    result.projectile.reveal_map = weapontype.reveal_map
    if(weapontype.reveal_map == nil) then
      result.projectile.reveal_map =  weapontype.projectile.reveal_map
    end
    if(weapontype.reveal_map == nil) then
      result.projectile.reveal_map =  true
    end
    result.projectile.map_color = weapontype.map_color or weapontype.projectile.map_color
  else
    result.projectile.acceleration = weapontype.acceleration
    result.projectile.picture = weapontype.picture
    result.projectile.shadow = weapontype.shadow
    result.projectile.smoke = weapontype.smoke
    result.projectile.light = weapontype.light
    result.projectile.animation = weapontype.animation
    result.projectile.max_speed = weapontype.max_speed

    result.projectile.height = weapontype.height or weapontype.height_from_ground

    result.projectile.direction_only = weapontype.direction_only

    result.projectile.turn_speed = weapontype.turn_speed

    result.projectile.reveal_map = weapontype.reveal_map
  end
  return result
end






return sanitseWeapontype



