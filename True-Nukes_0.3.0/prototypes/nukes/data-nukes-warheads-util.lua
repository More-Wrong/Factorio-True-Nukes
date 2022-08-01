local nuke_explosions = require("data-nuke-explosions")
local nuke_materials = require("data-nukes-material")

--function genericClusterProjectile(setup)
--  local name = "TN-nuke-projectile-" .. setup.name
--  if (not data.raw.projectile[name]) then
--    data:extend({
--      {
--        type = "projectile",
--        name = name,
--        flags = {"not-on-map"},
--        acceleration = 0,
--        direction_only = true,
--        action =
--        {
--          type = "direct",
--          action_delivery =
--          {
--            type = "instant",
--            target_effects = setup.effects
--          }
--        },
--        animation = {
--          filename = "__core__/graphics/empty.png",
--          width = 1,
--          frame_count = 1,
--          height = 1
--        },
--      }
--    })
--  end
--  return name
--end
--
--function generalCluster(size, count, radius, explosions)
--  return {
--    type = "nested-result",
--    action =
--    {
--      type = "area",
--      target_entities = false,
--      trigger_from_target = true,
--      repeat_count = count,
--      radius = radius,
--      action_delivery =
--      {
--        type = "projectile",
--        projectile = genericClusterProjectile({name = size, effects = explosions}),
--        starting_speed = 0.6 * 0.8,
--        starting_speed_deviation = 0.1,
--        max_range = radius/2,
--        range_deviation = radius/4,
--      }
--    }
--  }
--end




local fusionMaterial = nuke_materials.fusionMaterial
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


nuclearCoreYields = {
  {
    name = "TN-warhead-0-1--1",
    appendName = "-atomic-0_1t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "0_1t",
    preciseSize = 6,
    explosion = nuke_explosions.N0_1t_detonation
  },
  {
    name = "TN-warhead-0-1--2",
    appendName = "-atomic-0_1t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "0_1t",
    preciseSize = 3,
    explosion = nuke_explosions.N0_1t_detonation
  },

  {
    name = "TN-warhead-0-5--1",
    appendName = "-atomic-0_5t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "0_5t",
    preciseSize = 12,
    explosion = nuke_explosions.N0_5t_detonation
  },
  {
    name = "TN-warhead-0-5--2",
    appendName = "-atomic-0_5t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "0_5t",
    preciseSize = 8,
    explosion = nuke_explosions.N0_5t_detonation
  },

--  {
--    name = "TN-warhead-0-1--1x20",
--    appendName = "-atomic-0_1t",
--    icon = "__True-Nukes__/graphics/warheads/core-yy-0x20.png",
--    light = "__True-Nukes__/graphics/warheads/core-1x20-light.png",
--    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
--    size = "tiny",
--    yield = "0_1t",
--    preciseSize = 32,
--    explosion =  generalCluster("0_1t", 20, 10, nuke_explosions.N0_1t_detonation)
--  },
--  {
--    name = "TN-warhead-0-5--1x20",
--    appendName = "-atomic-0_5tx20",
--    icon = "__True-Nukes__/graphics/warheads/core-yy-1x20.png",
--    light = "__True-Nukes__/graphics/warheads/core-1x20-light.png",
--    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
--    size = "large",
--    yield = "0_5tx20",
--    preciseSize = 38,
--    explosion =  generalCluster("0_5t", 20, 20, nuke_explosions.N0_5t_detonation)
--  },

  {
    name = "TN-warhead-2--1",
    appendName = "-atomic-2t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "2t",
    preciseSize = 18,
    explosion = nuke_explosions.N2t_detonation
  },
  {
    name = "TN-warhead-2--2",
    appendName = "-atomic-2t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "2t",
    preciseSize = 14,
    explosion = nuke_explosions.N2t_detonation
  },
  {
    name = "TN-warhead-2--3",
    appendName = "-atomic-2t",
    icon = "__True-Nukes__/graphics/warheads/core-yy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "tiny",
    yield = "2t",
    preciseSize = 10,
    explosion = nuke_explosions.N2t_detonation
  },

  {
    name = "TN-warhead-4--1",
    appendName = "-atomic-4t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "medium",
    yield = "4t",
    preciseSize = 24,
    explosion = nuke_explosions.N4t_detonation
  },
  {
    name = "TN-warhead-4--2",
    appendName = "-atomic-4t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "4t",
    preciseSize = 16,
    explosion = nuke_explosions.N4t_detonation
  },

  {
    name = "TN-warhead-8--1",
    appendName = "-atomic-8t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "medium",
    yield = "8t",
    preciseSize = 28,
    explosion = nuke_explosions.N8t_detonation
  },
  {
    name = "TN-warhead-8--2",
    appendName = "-atomic-8t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
    size = "small",
    yield = "8t",
    preciseSize = 18,
    explosion = nuke_explosions.N8t_detonation
  },

  {
    name = "TN-warhead-20--1",
    appendName = "-atomic-20t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "20t",
    preciseSize = 32,
    explosion = nuke_explosions.N20t_detonation
  },
  {
    name = "TN-warhead-20--2",
    appendName = "-atomic-20t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "medium",
    yield = "20t",
    preciseSize = 26,
    explosion = nuke_explosions.N20t_detonation
  },
  {
    name = "TN-warhead-20--3",
    appendName = "-atomic-20t",
    icon = "__True-Nukes__/graphics/warheads/core-yg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "small",
    yield = "20t",
    preciseSize = 20,
    explosion = nuke_explosions.N20t_detonation
  },

  {
    name = "TN-warhead-500--1",
    appendName = "-atomic-500t",
    icon = "__True-Nukes__/graphics/warheads/core-gg-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "500t",
    preciseSize = 38,
    explosion = nuke_explosions.N500t_detonation
  },
  {
    name = "TN-warhead-500--2",
    appendName = "-atomic-500t",
    icon = "__True-Nukes__/graphics/warheads/core-gg-0.png",
    light = "__True-Nukes__/graphics/warheads/core-0-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "500t",
    preciseSize = 34,
    explosion = nuke_explosions.N500t_detonation
  },
  {
    name = "TN-warhead-500--3",
    appendName = "-atomic-500t",
    icon = "__True-Nukes__/graphics/warheads/core-gy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "medium",
    yield = "500t",
    preciseSize = 28,
    explosion = nuke_explosions.N500t_detonation
  },

  {
    name = "TN-warhead-1k--1",
    appendName = "-atomic-1kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "1kt",
    preciseSize = 40,
    explosion = nuke_explosions.N1kt_detonation
  },
  {
    name = "TN-warhead-1k--2",
    appendName = "-atomic-1kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "1kt",
    preciseSize = 36,
    explosion = nuke_explosions.N1kt_detonation
  },
  {
    name = "TN-warhead-1k--3",
    appendName = "-atomic-1kt",
    icon = "__True-Nukes__/graphics/warheads/core-gy-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "medium",
    yield = "1kt",
    preciseSize = 30,
    explosion = nuke_explosions.N1kt_detonation
  },

  {
    name = "TN-warhead-15k--1",
    appendName = "-atomic-15kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "huge",
    yield = "15kt",
    preciseSize = 44,
    explosion = nuke_explosions.N15kt_detonation
  },
  {
    name = "TN-warhead-15k--2",
    appendName = "-atomic-15kt",
    icon = "__True-Nukes__/graphics/warheads/core-gg-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-map-visualization.png",
    size = "large",
    yield = "15kt",
    preciseSize = 38,
    explosion = nuke_explosions.N15kt_detonation
  },

  {
    name = "TN-warhead-big--1",
    appendName = "-atomic-2-stage",
    icon = "__True-Nukes__/graphics/warheads/core-bb-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    size = "massive",
    preciseSize = 56,
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 2}},
        appendName = "-100kt",
        yield = "100kt",
        explosion = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 20}},
        appendName = "-1Mt",
        yield = "1Mt",
        explosion = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 100}},
        appendName = "-5Mt",
        yield = "5Mt",
        explosion = nuke_explosions.N5Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 200}},
        appendName = "-10Mt",
        yield = "10Mt",
        explosion = nuke_explosions.N10Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 1000}},
        appendName = "-50Mt",
        yield = "50Mt",
        explosion = nuke_explosions.N50Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 2000}},
        appendName = "-100Mt",
        yield = "100Mt",
        explosion = nuke_explosions.N100Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 20000}},
        appendName = "-1Gt",
        yield = "1Gt",
        explosion = nuke_explosions.N1Gt_detonation
      }
    }
  },
  {
    name = "TN-warhead-big--2",
    appendName = "-atomic-2-stage",
    icon = "__True-Nukes__/graphics/warheads/core-gb-1.png",
    light = "__True-Nukes__/graphics/warheads/core-1-light.png",
    size = "huge",
    preciseSize = 46,
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 4}},
        appendName = "-100kt",
        yield = "100kt",
        explosion = nuke_explosions.N100kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 40}},
        appendName = "-1Mt",
        yield = "1Mt",
        explosion = nuke_explosions.N1Mt_detonation
      },
      {
        ingedients = {{fusionMaterial, 200}},
        appendName = "-5Mt",
        yield = "5Mt",
        explosion = nuke_explosions.N5Mt_detonation
      }
    }
  },
  {
    name = "TN-warhead-big--3",
    appendName = "-atomic-2-stage",
    icon = "__True-Nukes__/graphics/warheads/core-gb-2.png",
    light = "__True-Nukes__/graphics/warheads/core-2-light.png",
    size = "large",
    preciseSize = 40,
    chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-fusion-map-visualization.png",
    explosions = {
      {
        ingedients = {},
        appendName = "-15kt",
        yield = "15kt",
        explosion = nuke_explosions.N15kt_detonation
      },
      {
        ingedients = {{fusionMaterial, 8}},
        appendName = "-100kt",
        yield = "100kt",
        explosion = nuke_explosions.N100kt_detonation
      }
    }
  }
}
local function createNukeProjectileFor(setup, warhead, explosion)
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

local function setupNukeItemFor(setup, warhead, explosion)
  local item = table.deepcopy(setup.item);
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
      },
      {
        icon_size = 128,
        icon = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
        scale = 0.25,
        shift = {0, -16}
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
      },
      {
        icon_size = 128,
        icon = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
        scale = 0.25,
        shift = {0, -16}
      }
    }
    item.icon = nil
  end
  local shiftCalc = {0.1875, -0.075}
  if(setup.coreShift) then
    shiftCalc = {setup.coreShift[1]*0.01875, setup.coreShift[2]*0.01875}
  end
  if(setup.lightTable and setup.lightTable[warhead.appendName .. explosion.appendName]) then
    if(setup.ignoreCoreIcon)then
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
        },
        {
          size = 128,
          filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
          scale = 0.125,
          shift = {0, -0.5}
        }
      }
    else
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
        },
        {
          filename = warhead.icon,
          size = 64,
          shift = shiftCalc,
          scale = 0.166
        },
        {
          filename = warhead.light,
          size = 64,
          shift = shiftCalc,
          draw_as_light = true,
          flags = {"light"},
          scale = 0.166
        },
        {
          size = 128,
          filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
          scale = 0.125,
          shift = {0, -0.5}
        }
      }
    end
  elseif (item.pictures) then
    item.pictures.layers =  {
      table.unpack(item.pictures.layers),
      {
        filename = warhead.icon,
        size = 64,
        shift = shiftCalc,
        scale = 0.166
      },
      {
        filename = warhead.light,
        size = 64,
        shift = shiftCalc,
        scale = 0.166
      },
      {
        size = 128,
        filename = "__True-Nukes__/graphics/warheads/text_" .. explosion.yield .. ".png",
        scale = 0.125,
        shift = {0, -0.5}
      }
    }
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

local function setupNukeRecipeFor(setup, warhead, explosion)
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
      createNukeProjectileFor(setup, w, e);
    end
  end
  if(not data.raw.ammo[setup.baseName .. w.appendName .. e.appendName]) then
    setupNukeItemFor(setup, w, e);
  end
  if(not data.raw.recipe[setup.baseName .. w.appendName .. e.appendName]) then
    setupNukeRecipeFor(setup, w, e);
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
        createItemProjRecipeFor(setup, w, {ingedients = {}, appendName = "", explosion = w.explosion, yield = w.yield})
      end
    end
  end
end




return {createNukesUtil = createNukesFor};

