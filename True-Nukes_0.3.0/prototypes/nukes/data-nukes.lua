require("data-radiation")
local nuke_explosions = require("data-nuke-explosions")
local nuke_materials = require("data-nukes-material")
require("data-nukes-intermediate")
require("data-nukes-warheads-create")
require("data-nukes-warheads-add")
local warheads_util = require("__True-Nukes__.prototypes.warhead-system.warheads")


local rocketIcon = {}
rocketIcon["small-1"] = "__True-Nukes__/graphics/rockets/small-1-atomic-bomb.png"
rocketIcon["small-2"] = "__True-Nukes__/graphics/rockets/small-2-atomic-bomb.png"
rocketIcon["small-3"] = "__True-Nukes__/graphics/rockets/small-3-atomic-bomb.png"
rocketIcon["big-1"] = "__base__/graphics/icons/atomic-bomb.png"
rocketIcon["big-2"] = "__True-Nukes__/graphics/rockets/big-2-atomic-bomb.png"
rocketIcon["big-3"] = "__True-Nukes__/graphics/rockets/big-3-atomic-bomb.png"
rocketIcon["thermo-1"] = "__True-Nukes__/graphics/rockets/thermobaric-rocket-1.png"
rocketIcon["thermo-2"] = "__True-Nukes__/graphics/rockets/thermobaric-rocket-2.png"

local rocketLight = {}
rocketLight["small-1"] = "__True-Nukes__/graphics/rockets/rocket-light-1.png"
rocketLight["small-2"] = "__True-Nukes__/graphics/rockets/rocket-light-2.png"
rocketLight["small-3"] = "__True-Nukes__/graphics/rockets/rocket-light-3.png"
rocketLight["big-1"] = "__True-Nukes__/graphics/rockets/rocket-light-1.png"
rocketLight["big-2"] = "__True-Nukes__/graphics/rockets/rocket-light-2.png"
rocketLight["thermo-1"] = "__True-Nukes__/graphics/blank-64.png"
rocketLight["thermo-2"] = "__True-Nukes__/graphics/blank-64.png"


local smallRocketSetup = {
  size = "small",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["rocket"]),
  projectile = table.deepcopy(data.raw.projectile["atomic-rocket"]),
  recipe = table.deepcopy(data.raw.recipe["atomic-bomb"]),
  ingredient = "rocket",
  baseName = "TN-small-rocket",
  iconTable = {},
  iconShift = {-4, 0},
  lightTable = {},
}


smallRocketSetup.iconTable["-atomic-0_1t"] = rocketIcon["small-1"]
smallRocketSetup.iconTable["-atomic-0_5t"] = rocketIcon["small-1"]
smallRocketSetup.iconTable["-atomic-2t"] = rocketIcon["small-2"]
smallRocketSetup.iconTable["-atomic-4t"] = rocketIcon["small-2"]
smallRocketSetup.iconTable["-atomic-8t"] = rocketIcon["small-2"]
smallRocketSetup.iconTable["-atomic-20t"] = rocketIcon["big-1"]
smallRocketSetup.iconTable["-thermobaric-1"] = rocketIcon["thermo-1"]

smallRocketSetup.lightTable["-atomic-0_1t"] = rocketLight["small-1"]
smallRocketSetup.lightTable["-atomic-0_5t"] = rocketLight["small-1"]
smallRocketSetup.lightTable["-atomic-2t"] = rocketLight["small-2"]
smallRocketSetup.lightTable["-atomic-4t"] = rocketLight["small-2"]
smallRocketSetup.lightTable["-atomic-8t"] = rocketLight["small-3"]
smallRocketSetup.lightTable["-atomic-20t"] = rocketLight["big-1"]
smallRocketSetup.lightTable["-thermobaric-1"] = rocketLight["thermo-1"]


-- The smaller rockets are targetted at enemies, are high fire rate, low range - >2t inadvisable...
smallRocketSetup.recipe.enabled = true;
smallRocketSetup.recipe.energy_required = 4;
smallRocketSetup.item.ammo_type.range_modifier = 1.5
smallRocketSetup.item.ammo_type.cooldown_modifier = 2
warheads_util.createNukesUtil(smallRocketSetup);


local ammoSetup = {
  size = "tiny",
  hasProjectile = false,
  item = table.deepcopy(data.raw.ammo["uranium-rounds-magazine"]),
  recipe = table.deepcopy(data.raw.recipe["uranium-rounds-magazine"]),
  ingredient = "uranium-rounds-magazine",
  baseName = "TN-rounds-magazine",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}

ammoSetup.iconTable["-atomic-0_1t"] = "__True-Nukes__/graphics/rounds/atomic-rounds-magazine.png"
ammoSetup.iconTable["-atomic-0_5t"] = "__True-Nukes__/graphics/rounds/big-atomic-rounds-magazine.png"
ammoSetup.iconTable["-atomic-2t"] = "__True-Nukes__/graphics/rounds/absurd-atomic-rounds-magazine.png"

ammoSetup.lightTable["-atomic-0_1t"] = "__True-Nukes__/graphics/rounds/atomic-rounds-magazine-light.png"
ammoSetup.lightTable["-atomic-0_5t"] = "__True-Nukes__/graphics/rounds/atomic-rounds-magazine-light.png"
ammoSetup.lightTable["-atomic-2t"] = "__True-Nukes__/graphics/rounds/atomic-rounds-magazine-light.png"


ammoSetup.recipe.enabled = true;
ammoSetup.recipe.energy_required = 5;
ammoSetup.item.ammo_type.range_modifier = 1.5
ammoSetup.item.ammo_type.cooldown_modifier = 2
ammoSetup.item.ammo_type.target_type = "position"
ammoSetup.item.ammo_type.clamp_position = true
warheads_util.createNukesUtil(ammoSetup);
data.raw.ammo["TN-rounds-magazine-atomic-2t"].ammo_type.cooldown_modifier = 8
data.raw.ammo["TN-rounds-magazine-atomic-0_5t"].ammo_type.cooldown_modifier = 4

local bigRocketSetup = {
  size = "medium",
  minSize = "small",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["rocket"]),
  projectile = table.deepcopy(data.raw.projectile["atomic-rocket"]),
  recipe = table.deepcopy(data.raw.recipe["atomic-bomb"]),
  ingredients = {{"rocket", 1}, {"rocket-control-unit", 5}, {"rocket-fuel", 10}},
  baseName = "TN-big-rocket",
  iconTable = {},
  iconShift = {-4, 0},
  lightTable = {},
}

bigRocketSetup.iconTable["-atomic-2t"] = rocketIcon["small-2"]
bigRocketSetup.iconTable["-atomic-4t"] = rocketIcon["small-2"]
bigRocketSetup.iconTable["-atomic-8t"] = rocketIcon["small-3"]
bigRocketSetup.iconTable["-atomic-20t"] = rocketIcon["big-1"]
bigRocketSetup.iconTable["-atomic-500t"] = rocketIcon["big-2"]
bigRocketSetup.iconTable["-atomic-1kt"] = rocketIcon["big-3"]
bigRocketSetup.iconTable["-thermobaric-2"] = rocketIcon["thermo-2"]

bigRocketSetup.lightTable["-atomic-2t"] = rocketLight["small-2"]
bigRocketSetup.lightTable["-atomic-4t"] = rocketLight["small-2"]
bigRocketSetup.lightTable["-atomic-8t"] = rocketLight["small-3"]
bigRocketSetup.lightTable["-atomic-20t"] = rocketLight["big-1"]
bigRocketSetup.lightTable["-atomic-500t"] = rocketIcon["big-2"]
bigRocketSetup.lightTable["-atomic-1kt"] = rocketIcon["big-3"]
bigRocketSetup.lightTable["-thermobaric-2"] = rocketLight["thermo-2"]

bigRocketSetup.recipe.enabled = true;
bigRocketSetup.recipe.energy_required = 6;
bigRocketSetup.item.ammo_type.range_modifier = 5
bigRocketSetup.item.ammo_type.cooldown_modifier = 50
bigRocketSetup.item.ammo_type.target_type = "position"
bigRocketSetup.item.ammo_type.action.action_delivery.starting_speed = 0.01

warheads_util.createNukesUtil(bigRocketSetup);

data.raw.projectile["TN-big-rocket-atomic-1kt"].created_effect = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = {
      type = "script",
      effect_id = "Nuke firing"
    }
  }
}
--Hack to fix Make Artillery Great Again's removal of the 'chart_picture'... 
if(not data.raw["artillery-projectile"]["artillery-projectile"].chart_picture) then
  data.raw["artillery-projectile"]["artillery-projectile"].chart_picture = {
    filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
    flags = { "icon" },
    frame_count = 1,
    width = 64,
    height = 64,
    priority = "high",
    scale = 0.25
  }
end

local artillerySetup = {
  size = "large",
  minSize = "medium",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["artillery-shell"]),
  projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"]),
  recipe = table.deepcopy(data.raw.recipe["artillery-shell"]),
  ingredient = "artillery-shell",
  baseName = "TN-artillery",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}
artillerySetup.iconTable["-atomic-20t"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-1.png"
artillerySetup.iconTable["-atomic-500t"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-2.png"
artillerySetup.iconTable["-atomic-1kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-3.png"
artillerySetup.iconTable["-atomic-15kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4.png"
artillerySetup.iconTable["-atomic-2-stage-15kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4.png"
artillerySetup.iconTable["-atomic-2-stage-100kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-5.png"
artillerySetup.iconTable["-thermobaric-3"] = "__True-Nukes__/graphics/artillery/thermobaric-artillery-shell.png"

artillerySetup.lightTable["-atomic-20t"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-1-light.png"
artillerySetup.lightTable["-atomic-500t"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-2-light.png"
artillerySetup.lightTable["-atomic-1kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-3-light.png"
artillerySetup.lightTable["-atomic-15kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4-light.png"
artillerySetup.lightTable["-atomic-2-stage-15kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4-light.png"
artillerySetup.lightTable["-atomic-2-stage-100kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4-light.png"
artillerySetup.lightTable["-thermobaric-3"] = "__True-Nukes__/graphics/blank-64.png"

artillerySetup.recipe.enabled = true;
artillerySetup.recipe.energy_required = 8;
artillerySetup.item.ammo_type.cooldown_modifier = 10

warheads_util.createNukesUtil(artillerySetup);

data.raw["artillery-projectile"]["TN-artillery-atomic-2-stage-15kt"].created_effect = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = {
      type = "script",
      effect_id = "Nuke firing"
    }
  }
}
data.raw["artillery-projectile"]["TN-artillery-atomic-15kt"].created_effect = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = {
      type = "script",
      effect_id = "Nuke firing"
    }
  }
}
data.raw["artillery-projectile"]["TN-artillery-atomic-1kt"].created_effect = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects = {
      type = "script",
      effect_id = "Nuke firing"
    }
  }
}


local cannonSetup = {
  size = "small",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["uranium-cannon-shell"]),
  projectile = table.deepcopy(data.raw["projectile"]["uranium-cannon-projectile"]),
  recipe = table.deepcopy(data.raw.recipe["uranium-cannon-shell"]),
  ingredient = "uranium-cannon-shell",
  baseName = "TN-cannon",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}
cannonSetup.iconTable["-atomic-0_1t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-1.png"
cannonSetup.iconTable["-atomic-0_5t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-1.png"
cannonSetup.iconTable["-atomic-2t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-2.png"
cannonSetup.iconTable["-atomic-4t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-2.png"
cannonSetup.iconTable["-atomic-8t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-3.png"
cannonSetup.iconTable["-atomic-20t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-3.png"
cannonSetup.iconTable["-thermobaric-1"] = "__True-Nukes__/graphics/cannon/thermobaric-cannon-shell.png"

cannonSetup.lightTable["-atomic-0_1t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-light.png"
cannonSetup.lightTable["-atomic-0_5t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-light.png"
cannonSetup.lightTable["-atomic-2t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-light.png"
cannonSetup.lightTable["-atomic-4t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-light.png"
cannonSetup.lightTable["-atomic-8t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-light.png"
cannonSetup.lightTable["-atomic-20t"] = "__True-Nukes__/graphics/cannon/atomic-cannon-shell-light.png"
cannonSetup.lightTable["-thermobaric-1"] = "__True-Nukes__/graphics/blank-64.png"

cannonSetup.recipe.enabled = true;
cannonSetup.recipe.energy_required = 4;
cannonSetup.item.ammo_type.cooldown_modifier = 2
cannonSetup.item.ammo_type.range_modifier = 3
cannonSetup.item.ammo_type.target_type = "position"
cannonSetup.item.ammo_type.action.action_delivery.max_range = cannonSetup.item.ammo_type.action.action_delivery.max_range*3
cannonSetup.item.stack_size = 50
cannonSetup.projectile.collision_box = {{0, 0}, {0, 0}}

warheads_util.createNukesUtil(cannonSetup);





if settings.startup["enable-atomic-bomb"].value then
  data.raw.projectile["atomic-rocket"].action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects = nuke_explosions.N20t_detonation

      }
    }
  data.raw.ammo["atomic-bomb"].ammo_type.range_modifier = 6
  data.raw.recipe["atomic-bomb"].energy_required=90
  if mods["bobelectronics"] then
    data.raw.recipe["atomic-bomb"].ingredients=
      {
        {"plastic-bar", 20},
        {"superior-circuit-board", 5},
        {"explosives", 10},
        {nuke_materials.boomMaterial, 30},
      }
  else
    data.raw.recipe["atomic-bomb"].ingredients=
      {
        {"rocket-control-unit", 10},
        {"processing-unit", 5},
        {"explosives", 10},
        {nuke_materials.boomMaterial, 30},
      }
  end
end

local atom = data.raw["ammo"]["atomic-bomb"]
atom.icon = "__True-Nukes__/graphics/atomic-bomb.png"
atom.pictures.layers[1].filename="__True-Nukes__/graphics/atomic-bomb.png"
atom.pictures.layers[1].mipmap_count = 4
atom.pictures.layers[2].filename="__True-Nukes__/graphics/rocket-light-1.png"
atom.pictures.layers[2].mipmap_count = 4


if(settings.startup["enable-small-atomic-bomb"].value or settings.startup["enable-very-small-atomic-bomb"].value or settings.startup["enable-really-very-small-atomic-bomb"].value) then
  data.raw["ammo"]["rocket"].icon = "__True-Nukes__/graphics/rocket.png"
end



--if(settings.startup["enable-very-small-atomic-artillery"].value or settings.startup["enable-small-atomic-artillery"].value
--  or settings.startup["enable-atomic-artillery"].value or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
--  require("data-nukes-artillery")
--end












--if(settings.startup["enable-big-atomic-ammo"].value or settings.startup["enable-big-atomic-cannons"].value
--  or settings.startup["enable-big-atomic-bomb"].value or settings.startup["enable-very-big-atomic-bomb"].value
--  or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
--  local scary_nuke_tech = table.deepcopy(data.raw["technology"]["atomic-bomb"])
--  scary_nuke_tech.name = "scary-atomic-weapons"
--  scary_nuke_tech.effects = {}
--
--  if (settings.startup["enable-big-atomic-bomb"].value) then
--    table.insert(scary_nuke_tech.effects,
--      {
--        type = "unlock-recipe",
--        recipe = "big-atomic-bomb"
--      })
--  end
--  if (settings.startup["enable-very-big-atomic-bomb"].value) then
--    table.insert(scary_nuke_tech.effects,
--      {
--        type = "unlock-recipe",
--        recipe = "very-big-atomic-bomb"
--      })
--  end
--  if (settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
--    table.insert(scary_nuke_tech.effects,
--      {
--        type = "unlock-recipe",
--        recipe = "TN-big-atomic-artillery-shell"
--      })
--  end
--  scary_nuke_tech.unit.count=1000
--  scary_nuke_tech.unit.ingredients = {
--    {"automation-science-pack", 1},
--    {"logistic-science-pack", 1},
--    {"chemical-science-pack", 1},
--    {"military-science-pack", 1},
--    {"production-science-pack", 1},
--    {"utility-science-pack", 1},
--    {"space-science-pack", 1}
--  }
--  scary_nuke_tech.order = "e-b-a"
--  scary_nuke_tech.prerequisites = {} -- "atomic-artillery-shells", "californium-processing"
--  if(settings.startup["enable-atomic-ammo"].value or settings.startup["enable-big-atomic-ammo"].value
--    or settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) then
--    table.insert(scary_nuke_tech.prerequisites, "californium-processing")
--    if(settings.startup["enable-small-atomic-artillery"].value or settings.startup["enable-atomic-artillery"].value
--      or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
--      table.insert(scary_nuke_tech.prerequisites, "atomic-artillery-shells")
--    end
--  elseif(settings.startup["enable-small-atomic-artillery"].value or settings.startup["enable-atomic-artillery"].value
--    or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
--    table.insert(scary_nuke_tech.prerequisites, "atomic-artillery-shells")
--  else
--    table.insert(scary_nuke_tech.prerequisites, "atomic-bomb")
--  end
--  scary_nuke_tech.icon = "__True-Nukes__/graphics/scary-atomic-tech.png"
--  scary_nuke_tech.icon_mipmaps = 1
--  data:extend{scary_nuke_tech}
--end

--if(settings.startup["enable-atomic-ammo"].value or settings.startup["enable-big-atomic-ammo"].value
--  or settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) then
--  require("data-nukes-californium")
--end

--if(settings.startup["enable-very-big-atomic-artillery"].value or settings.startup["enable-fusion-building"].value or settings.startup["enable-mega-fusion-building"].value) then
--  require("data-nukes-huge")
--end






if ((settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) and mods["SchallTankPlatoon"] )then
  require("data-nukes-schall")
end
if(settings.startup["enable-fire-shield"].value) then
  table.insert(data.raw.technology["atomic-bomb"].effects, {
    type = "unlock-recipe",
    recipe = "fire-shield-equipment"
  })
end
      
