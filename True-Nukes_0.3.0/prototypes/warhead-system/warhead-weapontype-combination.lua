local sizes = require("warheads")
local generateAppearance = require("appearance-util")

local function combineAppearances(weapontypeGeneral, weaponAppearance, warheadWeapon)

  local icons = table.deepcopy(weaponAppearance.icons)


  if(weapontypeGeneral.image_base_shift) then
    local icon_shift = weapontypeGeneral.image_base_shift or {0, 0}
    for _,i in pairs(icons) do
      i.shift = i.shift or {0, 0}
      i.shift[1] = i.shift[1]+icon_shift[1]
      i.shift[2] = i.shift[2]+icon_shift[2]
    end
  end

  if(not weapontypeGeneral.ignore_warhead_image)then
    local core_icon_shift = weapontypeGeneral.image_warhead_shift or {10, -4}
    for _,i in pairs(table.deepcopy(warheadWeapon.icons)) do
      if(not i.no_shift) then
        i.shift = i.shift or {0, 0}
        i.shift[1] = i.shift[1]+core_icon_shift[1]
        i.shift[2] = i.shift[2]+core_icon_shift[2]
      end
      i.scale = i.scale or 1
      i.scale = i.scale/3
      table.insert(icons, i)
    end
  end

  local pictures = table.deepcopy(weaponAppearance.pictures)


  if(weapontypeGeneral.image_base_shift) then
    local icon_shift = {weapontypeGeneral.image_base_shift[1]*0.01875, weapontypeGeneral.image_base_shift[2]*0.01875}
    for _,i in pairs(pictures) do
      i.shift = i.shift or {0, 0}
      i.shift[1] = i.shift[1]*0.01875+icon_shift[1]
      i.shift[2] = i.shift[2]*0.01875+icon_shift[2]
    end
  end

  local core_shift = {0.1875, -0.075}
  if(weapontypeGeneral.image_warhead_shift) then
    core_shift = {weapontypeGeneral.image_warhead_shift[1]*0.01875, weapontypeGeneral.image_warhead_shift[2]*0.01875}
  end
  for _,i in pairs(table.deepcopy(warheadWeapon.pictures)) do
    i.shift = i.shift or {0, 0}
    i.scale = i.scale or 1
    if i.no_shift then
      i.shift[1] = i.shift[1]*0.01875
      i.shift[2] = i.shift[2]*0.01875
      i.scale = i.scale/4.0
    else
      i.shift[1] = i.shift[1]*0.01875+core_shift[1]
      i.shift[2] = i.shift[2]*0.01875+core_shift[2]
      i.scale = i.scale*2/3.0
    end
    table.insert(pictures, i)
  end


  return {icons = icons, pictures = pictures}
end





local function combine(weapontype, warheadWeapon)
  local result = {}

  local item = {type = "item"}
  local name = weapontype.name .. warheadWeapon.appendName
  if(warheadWeaponNameMap[weapontype.name .. warheadWeapon.appendName]) then
    name = warheadWeaponNameMap[name]
  end
  item.name = name
  item.order = weapontype.order .. warheadWeapon.appendOrder

  local weaponAppearance = generateAppearance(weapontype.appearances[warheadWeapon.appendName] or weapontype.appearance["default"])

  local appearance = combineAppearances(weapontype.appearance, weaponAppearance, warheadWeapon.appearence)
  item.icons = appearance.icons
  item.pictures = appearance.pictures
  item.stack_size = math.min(weapontype.item.stack_size, warheadWeapon.item.stack_size_max)

  item.magazine_size = weapontype.item.magazine_size

  if (weapontype.item.reload_time) then
    item.reload_time = weapontype.item.reload_time*warheadWeapon.item.reload_time_modifier
  end
  if (weapontype.type == "projectile" or weapontype.type == "artillery" or weapontype.type == "bullet") then
    item.ammo_type = {}
    item.ammo_type.range_modifier = weapontype.item.range_modifier * warheadWeapon.item.range_modifier
    item.ammo_type.cooldown_modifier = weapontype.item.cooldown_modifier * warheadWeapon.item.cooldown_modifier
    item.ammo_type.target_type = warheadWeapon.item.target_type or weapontype.item.target_type
    item.ammo_type.clamp_position = weapontype.item.clamp_position or warheadWeapon.item.clamp_position
    item.ammo_type.category = warheadWeapon.item.ammo_category
    item.ammo_type.action = weapontype.item.action_creator(name, warheadWeapon.projectile.action, warheadWeapon.projectile.created_effect)
  elseif(weapontype.type == "land-mine") then
    item.place_result = name
  elseif(weapontype.type == "capsule") then
    item.capsule_action = weapontype.item.action_creator(name, warheadWeapon.projectile.action, warheadWeapon.projectile.created_effect)
    item.radius_color = weapontype.item.radius_color or warheadWeapon.item.radius_color or weapontype.item.default_radius_color
  end

  result.item = item

  local recipe = {type = "recipe"}
  recipe.name = name
  recipe.order = weapontype.order .. warheadWeapon.appendOrder
  recipe.energy_required = weapontype.recipe.energy_required * warheadWeapon.recipe.energy_required_modifier
  recipe.crafting_machine_tint = warheadWeapon.recipe.crafting_machine_tint
  recipe.ingredients = weapontype.recipe.ingredients
  table.insert(recipe.ingredients, {warheadWeapon.recipe.warhead_name, amount = weapontype.recipe.warhead_count})
  for _,i in pairs(warheadWeapon.recipe.additional_ingedients) do
    table.insert(recipe.ingredients, i)
  end
  recipe.icons = appearance.icons
  recipe.results = {{type="item", name=name, amount = weapontype.recipe.result_count}}
  for _,r in pairs(weapontype.recipe.additional_results) do
    table.insert(recipe.results, r)
  end
  for _,r in pairs(warheadWeapon.recipe.additional_results) do
    table.insert(recipe.results, r)
  end

  result.recipe = result

  if (weapontype.type == "projectile" or weapontype.type == "capsule" or weapontype.type == "artillery") then
    local projectile = {}
    projectile.name = name
    projectile.order = weapontype.order .. warheadWeapon.appendOrder
    projectile.icons = appearance.icons

    if (weapontype.type == "projectile" or weapontype.type == "capsule")then
      projectile.type = "projectile"

      projectile.acceleration = weapontype.projectile.acceleration * warheadWeapon.projectile.acceleration_modifier
      projectile.animation = weapontype.projectile.animation
      projectile.direction_only = weapontype.projectile.direction_only
      projectile.height = weapontype.projectile.height
      projectile.light = weapontype.projectile.light
      projectile.max_speed = weapontype.projectile.max_speed * warheadWeapon.projectile.max_speed_modifier

      projectile.piercing_damage = weapontype.projectile.piercing_damage * warheadWeapon.projectile.piercing_damage_modifier + warheadWeapon.projectile.piercing_damage_extra
      if not warheadWeapon.projectile.piercing then
        projectile.piercing_damage = 0
      end

      projectile.shadow = weapontype.projectile.shadow
      projectile.smoke = weapontype.projectile.smoke
      projectile.height_from_ground = weapontype.projectile.height_from_ground

    else
      projectile.type = "artillery-projectile"

      projectile.chart_picture = warheadWeapon.projectile.chart_picture
      projectile.reveal_map = warheadWeapon.projectile.reveal_map
    end
    projectile.action = warheadWeapon.projectile.action
    projectile.final_action = warheadWeapon.projectile.final_action
    projectile.created_effect = warheadWeapon.projectile.created_effect
    projectile.picture = weapontype.projectile.picture
    projectile.shadow = weapontype.projectile.shadow

    result.projectile = projectile
  elseif(weapontype.type == "land-mine") then
    local landmine = {}
    landmine.ammo_category = warheadWeapon.landmine.ammo_category
    landmine.trigger_radius = weapontype.land_mine.trigger_radius*warheadWeapon.land_mine.trigger_radius_modifier
    landmine.picture_safe = (weapontype.land_mine.pictures[warheadWeapon.appendName] or weapontype.land_mine.pictures["default"]).picture_safe
    landmine.picture_set = (weapontype.land_mine.pictures[warheadWeapon.appendName] or weapontype.land_mine.pictures["default"]).picture_set
    landmine.picture_set_enemy = (weapontype.land_mine.pictures[warheadWeapon.appendName] or weapontype.land_mine.pictures["default"]).picture_set_enemy
    landmine.max_health = weapontype.land_mine.max_health*warheadWeapon.land_mine.max_health_modifier
    landmine.selection_box = weapontype.land_mine.selection_box
    landmine.created_effect = warheadWeapon.land_mine.created_effect
    landmine.ammo_category = warheadWeapon.land_mine.ammo_category
    landmine.minable = table.deepcopy(weapontype.land_mine.minable)
    landmine.minable.result = item.name
    landmine.corpse = weapontype.land_mine.corpse
    landmine.collision_box = weapontype.land_mine.collision_box
    landmine.selection_box = weapontype.land_mine.selection_box
    landmine.damaged_trigger_effect = weapontype.land_mine.damaged_trigger_effect
    landmine.dying_explosion = warheadWeapon.landmine.dying_explosion or weapontype.land_mine.damaged_trigger_effect

    landmine.flags =
      {
        "placeable-player",
        "placeable-enemy",
        "player-creation",
        "placeable-off-grid",
        "not-on-map"
      }
    landmine.open_sound = sounds.machine_open
    landmine.close_sound = sounds.machine_close
    landmine.mined_sound = { filename = "__core__/sound/deconstruct-small.ogg" }
    result.landmine = landmine
  end
  result.valid = true
  if(warheadWeaponIgnore[weapontype.name .. warheadWeapon.appendName]) then
    result.valid = false
  end
  if(warheadOverrides[weapontype.name .. warheadWeapon.appendName]) then
    for _,override in pairs(warheadOverrides[weapontype.name .. warheadWeapon.appendName]) do
      override(result)
    end
  end
  return result
end






return combine




