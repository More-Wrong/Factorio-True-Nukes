-- preciseSize is just a made up number - kinda exponential ish
-- <=10 is tiny, <=20 is small, <=30 is medium, <=40 is large, <=50 is huge
local sizes = {
  tiny = 10,
  small = 20,
  medium = 30,
  large = 40,
  huge = 50,
  all = 100
}
local function setupWeaponProjectileFor(setup, warhead, explosion)
  local projectile = table.deepcopy(setup.projectile);
  local effect = table.deepcopy(explosion.explosion);
  projectile.name = setup.baseName .. warhead.appendName .. explosion.appendName
  if(setup.keepAction) then
    projectile.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}} .. {projectile.action}
  else
    projectile.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}}
  end
  if(not warhead.piercing) then
    projectile.collision_box = {{0, 0}, {0, 0}}
    projectile.piercing_damage = nil
  end
  if(projectile.chart_picture) then
    projectile.chart_picture.filename = warhead.chart_picture
  end
  data:extend{projectile}
end

local function flattenToIcons(entry)
  local icons = {}
  if(type(entry) == "table") then
    if(entry.icon or entry.filename) then
      icons = {table.deepcopy(entry)}
    else
      for _,i in pairs(entry) do
        if(type(i) == "table") then
          table.insert(icons, table.deepcopy(i))
        else
          table.insert(icons, {
            icon = i,
            shift = {0, 0},
            icon_size = 64
          })
        end
      end
    end
  else
    icons = {
      {
        icon = entry,
        shift = {0, 0},
        icon_size = 64
      }
    }
  end
  return icons
end




local function setupIconsFor(item, setup, warhead, explosion)
  local coreIcons
  local defaultIcons

  if(warhead.appearance) then
    coreIcons = table.deepcopy(warhead.appearance.icons)
  else
    coreIcons = {
      {
        icon = warhead.icon,
        icon_size = 64
      }
    }
  end


  if(item.icon) then
    defaultIcons = {
      {
        icon = item.icon,
        shift = {0, 0},
        icon_size = item.icon_size
      }
    }
  else
    defaultIcons = table.deepcopy(item.icons)
  end

  if(setup.iconTable and setup.iconTable[warhead.appendName .. explosion.appendName])then
    local entry = setup.iconTable[warhead.appendName .. explosion.appendName]
    item.icons  = flattenToIcons(entry)
  else
    item.icons = defaultIcons
  end

  local icon_shift = setup.iconShift or {0, 0}
  for _,i in pairs(item.icons) do
    i.shift = i.shift or {0, 0}
    i.shift[1] = i.shift[1]+icon_shift[1]
    i.shift[2] = i.shift[2]+icon_shift[2]
  end

  local core_icon_shift = setup.coreShift or {10, -4}
  for _,i in pairs(coreIcons) do
    i.shift = i.shift or {0, 0}
    i.shift[1] = i.shift[1]+core_icon_shift[1]
    i.shift[2] = i.shift[2]+core_icon_shift[2]
    i.scale = i.scale or 1
    i.scale = i.scale/3
  end




  if(not setup.ignoreCoreIcon)then
    for _,i in pairs(coreIcons) do
      if(i.note ~= "yield") then
        table.insert(item.icons, i)
      end
    end
  end
  if(explosion.yield) then
    table.insert(item.icons, {
      icon_size = 128,
      icon = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
      scale = 0.25,
      shift = {0, -16}
    })
  end
end

local function iconToPicture(i)
  if(i.filename) then
    return i
  else
    local shift = {0,0}
    if(i.shift) then
      shift = {i.shift[1]*0.01875, i.shift[2]*0.01875}
    end
    return {
      filename = i.icon,
      size = i.icon_size,
      scale = (i.scale or 1)/4.0,
      shift = shift
    }
  end
end


local function setupDefaultPicturesFor(item, setup, name)
  local pictures = nil
  local icons = nil

  if(item.pictures) then
    pictures = table.deepcopy(item.pictures.layers)
  else
    if(item.icons) then
      icons = item.icons
    else
      icons = {
        {
          icon = item.icon,
          shift = {0, 0},
          icon_size = item.icon_size
        }
      }
    end
  end

  if(setup.iconTable and setup.iconTable[name])then
    pictures = nil
    icons  = flattenToIcons(setup.iconTable[name])
  end
  if(pictures == nil) then
    pictures = {}
    for _,i in pairs(icons) do
      table.insert(pictures, iconToPicture(i))
    end
  end
  return pictures
end


local function setupPicturesFor(item, setup, warhead, explosion)

  local corePictures
  local defaultPictures = setupDefaultPicturesFor(item, setup, warhead.appendName .. explosion.appendName)

  item.pictures = {layers = {}}

  if(warhead.appearance) then
    corePictures = table.deepcopy(warhead.appearance.pictures.layers)
  else
    corePictures = {
      {
        filename = warhead.icon,
        size = 64,
        scale = 0.25
      }
    }
  end


  if(setup.pictureTable and setup.pictureTable[warhead.appendName .. explosion.appendName])then
    local entry = setup.pictureTable[warhead.appendName .. explosion.appendName]
    local icons = flattenToIcons(entry)
    for _,l in pairs(icons) do
      table.insert(item.pictures.layers, iconToPicture(l))
    end
  else
    item.pictures.layers = defaultPictures
    if(setup.lightTable and setup.lightTable[warhead.appendName .. explosion.appendName])then
      local entry = setup.lightTable[warhead.appendName .. explosion.appendName]
      local icons = flattenToIcons(entry)

      for _,l in pairs(icons) do
        local pic = iconToPicture(l)
        if not pic.flags then
          pic.draw_as_light = true
          pic.flags = {"light"}
        end
        table.insert(item.pictures.layers, pic)
      end
    end
  end

  if(setup.iconShift) then
    local icon_shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875}
    for _,i in pairs(item.pictures.layers) do
      i.shift = i.shift or {0, 0}
      i.shift[1] = i.shift[1]*0.01875+icon_shift[1]
      i.shift[2] = i.shift[2]*0.01875+icon_shift[2]
    end
  end

  local core_shift = {0.1875, -0.075}
  if(setup.coreShift) then
    core_shift = {setup.coreShift[1]*0.01875, setup.coreShift[2]*0.01875}
  end
  for _,i in pairs(corePictures) do
    i.shift = i.shift or {0, 0}
    i.shift[1] = i.shift[1]*0.01875+core_shift[1]
    i.shift[2] = i.shift[2]*0.01875+core_shift[2]
    i.scale = i.scale or 1
    i.scale = i.scale*2/3.0
  end




  if(not setup.ignoreCoreIcon)then
    for _,i in pairs(corePictures) do
      if(i.note ~= "yield") then
        table.insert(item.pictures.layers, i)
      end
    end
  end
  if(explosion.yield) then
    table.insert(item.pictures.layers, {
      size = 128,
      filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
      scale = 0.125,
      shift = {0, -0.5}
    })
  end

end




local function setupWeaponItemFor(setup, warhead, explosion)
  local item = table.deepcopy(setup.item);
  if(item.order) then
    item.order = item.order .. explosion.order
  else
    item.order = explosion.order
  end
  item.name = setup.baseName .. warhead.appendName .. explosion.appendName
  setupPicturesFor(item, setup, warhead, explosion)
  setupIconsFor(item, setup, warhead, explosion)

  if(warhead.cooldown_modifier) then
    item.ammo_type.cooldown_modifier = item.ammo_type.cooldown_modifier*warhead.cooldown_modifier
  end
  if(warhead.range_modifier) then
    item.ammo_type.range_modifier = item.ammo_type.range_modifier*warhead.range_modifier
    if(item.ammo_type.action.action_delivery.max_range) then
      item.ammo_type.action.action_delivery.max_range = item.ammo_type.action.action_delivery.max_range*warhead.range_modifier
    end
  end
  if(warhead.target_type) then
    item.ammo_type.target_type = warhead.target_type
  end
  if(warhead.stack_size) then
    item.stack_size = warhead.stack_size
  end
  local effect = table.deepcopy(explosion.explosion);
  if(setup.hasProjectile) then
    item.ammo_type.action.action_delivery.projectile = setup.baseName .. warhead.appendName .. explosion.appendName
  else
    if(setup.keepAction) then
      item.ammo_type.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}} .. {item.ammo_type.action}
    else
      item.ammo_type.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}}
    end
  end
  data:extend{item}
end

local function setupWeaponRecipeFor(setup, warhead, explosion)
  local recipe = table.deepcopy(setup.recipe);
  recipe.name = setup.baseName .. warhead.appendName .. explosion.appendName
  recipe.result = setup.baseName .. warhead.appendName .. explosion.appendName
  local ingredients = setup.ingredients or {{setup.ingredient, 1}}
  if(warhead.explosion or warhead.explosions[1].appendName == explosion.appendName) then
    recipe.ingredients = {{warhead.name, 1}, table.unpack(explosion.ingedients), table.unpack(ingredients)}
  else
    recipe.ingredients = {{setup.baseName .. warhead.appendName .. warhead.explosions[1].appendName, 1}, table.unpack(explosion.ingedients)}
  end
  data:extend{recipe}
end

local function createItemProjRecipeFor(setup, w, e)
  if(setup.hasProjectile) then
    if(not data.raw.projectile[setup.baseName .. w.appendName .. e.appendName]) then
      setupWeaponProjectileFor(setup, w, e);
    end
  end
  if(not data.raw.ammo[setup.baseName .. w.appendName .. e.appendName]) then
    setupWeaponItemFor(setup, w, e);
  end
  if(not data.raw.recipe[setup.baseName .. w.appendName .. e.appendName]) then
    setupWeaponRecipeFor(setup, w, e);
  end
end

local function createNukesFor(setup)
  local ingredients
  if(setup.ingredient) then
    ingredients = {{setup.ingredient, 1}}
  else
    ingredients = setup.ingredients
  end
  local maxSizeInc
  if(type(setup.size) == "number") then
    maxSizeInc = setup.size
  else
    maxSizeInc = sizes[setup.size]
  end
  local minSizeExc = 0
  if(setup.minSize) then
    if(type(setup.minSize) == "number") then
      minSizeExc = setup.minSize
    else
      minSizeExc = sizes[setup.minSize]
    end
  end
  for _,w in pairs(warheadResults) do
    if(w.preciseSize<=maxSizeInc and w.preciseSize>minSizeExc) then
      if(w.explosions) then
        for _,e in pairs(w.explosions) do
          createItemProjRecipeFor(setup, w, e)
        end
      else
        createItemProjRecipeFor(setup, w, {ingedients = {}, appendName = "", explosion = w.explosion, yield = w.yield, order = w.orderResult})
      end
    end
  end
end




return {createNukesUtil = createNukesFor};
