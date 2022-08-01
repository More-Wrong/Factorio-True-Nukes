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

data:extend({
  {
    name = "TN-tiny-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y1[TN-tiny-warheads]"
  },
  {
    name = "TN-small-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y2[TN-small-warheads]"
  },
  {
    name = "TN-medium-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y3[TN-medium-warheads]"
  },
  {
    name = "TN-large-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y4[TN-large-warheads]"
  },
  {
    name = "TN-huge-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y5[TN-huge-warheads]"
  }
})

nuclearCoreYields = {}


local function setupWeaponProjectileFor(setup, warhead, explosion)
  local projectile = table.deepcopy(setup.projectile);
  local effect = table.deepcopy(explosion.explosion);
  projectile.name = setup.baseName .. warhead.appendName .. explosion.appendName
  if(setup.keepAction) then
    projectile.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}} .. {projectile.action}
  else
    projectile.action = {{type = "direct", action_delivery = {type = "instant", target_effects = effect}}}
  end
  if(projectile.chart_picture) then
    projectile.chart_picture.filename = warhead.chart_picture
  end
  data:extend{projectile}
end

local function setupWeaponItemFor(setup, warhead, explosion)
  local item = table.deepcopy(setup.item);
  item.order = item.order .. explosion.order
  item.name = setup.baseName .. warhead.appendName .. explosion.appendName
  if(setup.ignoreCoreIcon)then
    item.icons = {
      {
        icon = setup.iconTable[warhead.appendName .. explosion.appendName],
        shift = setup.iconShift,
        size = 64
      }
    }
  elseif(setup.iconTable and setup.iconTable[warhead.appendName .. explosion.appendName])then
    item.icon = nil
    item.icons = {
      {
        icon = setup.iconTable[warhead.appendName .. explosion.appendName],
        shift = setup.iconShift,
        size = 64
      },
      {
        icon = warhead.icon,
        size = 64,
        shift = setup.coreShift or {10, -4},
        scale = 0.333
      }
    }
  else
    item.icons = {
      {
        icon = item.icon,
        shift = setup.iconShift,
        size = 64
      },
      {
        icon = warhead.icon,
        size = 64,
        shift = setup.coreShift or {10, -4},
        scale = 0.25
      }
    }
    item.icon = nil
  end
  if(explosion.yield) then
    table.insert(item.icons, {
      icon_size = 128,
      icon = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
      scale = 0.25,
      shift = {0, -16}
    })
  end
  local shiftCalc = {0.1875, -0.075}
  if(setup.coreShift) then
    shiftCalc = {setup.coreShift[1]*0.01875, setup.coreShift[2]*0.01875}
  end
  if(setup.lightTable and setup.lightTable[warhead.appendName .. explosion.appendName]) then
    item.pictures = {layers = {}}
    item.pictures.layers = {
      {
        filename = setup.iconTable[warhead.appendName .. explosion.appendName],
        size = 64,
        shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875},
        scale = 0.25
      },
      {
        filename = setup.lightTable[warhead.appendName .. explosion.appendName],
        flags = {"light"},
        draw_as_light = true,
        size = 64,
        shift = {setup.iconShift[1]*0.01875, setup.iconShift[2]*0.01875},
        scale = 0.25
      }
    }
    if(not setup.ignoreCoreIcon)then
      table.insert(item.pictures.layers, {
        filename = warhead.icon,
        size = 64,
        shift = shiftCalc,
        scale = 0.166
      })
      if(warhead.light) then
        table.insert(item.pictures.layers, {
          filename = warhead.light,
          size = 64,
          shift = shiftCalc,
          draw_as_light = true,
          flags = {"light"},
          scale = 0.166
        })
      end
    end
  elseif (item.pictures) then
    table.insert(item.pictures.layers, {
      filename = warhead.icon,
      size = 64,
      shift = shiftCalc,
      scale = 0.166
    })
    if(warhead.light) then
      table.insert(item.pictures.layers, {
        filename = warhead.light,
        size = 64,
        shift = shiftCalc,
        draw_as_light = true,
        flags = {"light"},
        scale = 0.166
      })
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
  for _,w in pairs(nuclearCoreYields) do
    if(w.preciseSize<=maxSizeInc and w.preciseSize>minSizeExc) then
      if(w.explosions) then
        for _,e in pairs(w.explosions) do
          createItemProjRecipeFor(setup, w, e)
        end
      else
        createItemProjRecipeFor(setup, w, {ingedients = {}, appendName = "", explosion = w.explosion, yield = w.yield, order = w.order})
      end
    end
  end
end




return {createNukesUtil = createNukesFor};

