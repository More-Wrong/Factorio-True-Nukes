require("data-radiation")
local nuke_explosions = require("data-nuke-explosions")
local nuke_materials = require("data-nukes-material")
local nuke_warheads = require("data-nukes-warheads")

local rocketIcon = {}
rocketIcon["small-1"] = "__True-Nukes__/graphics/rockets/small-1-atomic-bomb.png"
rocketIcon["small-2"] = "__True-Nukes__/graphics/rockets/small-2-atomic-bomb.png"
rocketIcon["small-3"] = "__True-Nukes__/graphics/rockets/small-3-atomic-bomb.png"
rocketIcon["big-1"] = "__base__/graphics/icons/atomic-bomb.png"
rocketIcon["big-2"] = "__True-Nukes__/graphics/rockets/big-2-atomic-bomb.png"
rocketIcon["big-3"] = "__True-Nukes__/graphics/rockets/big-3-atomic-bomb.png"

local rocketLight = {}
rocketLight["small-1"] = "__True-Nukes__/graphics/rockets/rocket-light-1.png"
rocketLight["small-2"] = "__True-Nukes__/graphics/rockets/rocket-light-2.png"
rocketLight["small-3"] = "__True-Nukes__/graphics/rockets/rocket-light-3.png"
rocketLight["big-1"] = "__True-Nukes__/graphics/rockets/rocket-light-1.png"
rocketLight["big-2"] = "__True-Nukes__/graphics/rockets/rocket-light-2.png"
rocketLight["big-3"] = "__True-Nukes__/graphics/rockets/rocket-light-3.png"


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

smallRocketSetup.lightTable["-atomic-0_1t"] = rocketLight["small-1"]
smallRocketSetup.lightTable["-atomic-0_5t"] = rocketLight["small-1"]
smallRocketSetup.lightTable["-atomic-2t"] = rocketLight["small-2"]
smallRocketSetup.lightTable["-atomic-4t"] = rocketLight["small-2"]
smallRocketSetup.lightTable["-atomic-8t"] = rocketLight["small-3"]
smallRocketSetup.lightTable["-atomic-20t"] = rocketLight["big-1"]


-- The smaller rockets are targetted at enemies, are high fire rate, low range - >2t inadvisable...
smallRocketSetup.recipe.enabled = true;
smallRocketSetup.recipe.energy = 4;
smallRocketSetup.item.ammo_type.range_modifier = 1.5
smallRocketSetup.item.ammo_type.cooldown_modifier = 2
nuke_warheads.createNukesUtil(smallRocketSetup);


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
ammoSetup.recipe.energy = 5;
ammoSetup.item.ammo_type.range_modifier = 1.5
ammoSetup.item.ammo_type.cooldown_modifier = 2
ammoSetup.item.ammo_type.target_type = "position"
ammoSetup.item.ammo_type.clamp_position = true
nuke_warheads.createNukesUtil(ammoSetup);
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

bigRocketSetup.lightTable["-atomic-2t"] = rocketLight["small-2"]
bigRocketSetup.lightTable["-atomic-4t"] = rocketLight["small-2"]
bigRocketSetup.lightTable["-atomic-8t"] = rocketLight["small-3"]
bigRocketSetup.lightTable["-atomic-20t"] = rocketLight["big-1"]
bigRocketSetup.lightTable["-atomic-500t"] = rocketIcon["big-2"]
bigRocketSetup.lightTable["-atomic-1kt"] = rocketIcon["big-3"]

bigRocketSetup.recipe.enabled = true;
bigRocketSetup.recipe.energy = 6;
bigRocketSetup.item.ammo_type.range_modifier = 5
bigRocketSetup.item.ammo_type.cooldown_modifier = 50
bigRocketSetup.item.ammo_type.target_type = "position"
bigRocketSetup.item.ammo_type.action.action_delivery.starting_speed = 0.01

nuke_warheads.createNukesUtil(bigRocketSetup);

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

artillerySetup.lightTable["-atomic-20t"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-1-light.png"
artillerySetup.lightTable["-atomic-500t"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-2-light.png"
artillerySetup.lightTable["-atomic-1kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-3-light.png"
artillerySetup.lightTable["-atomic-15kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4-light.png"
artillerySetup.lightTable["-atomic-2-stage-15kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4-light.png"
artillerySetup.lightTable["-atomic-2-stage-100kt"] = "__True-Nukes__/graphics/artillery/atomic-artillery-shell-4-light.png"

artillerySetup.recipe.enabled = true;
artillerySetup.recipe.energy = 8;
artillerySetup.item.ammo_type.cooldown_modifier = 10

nuke_warheads.createNukesUtil(artillerySetup);






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





if(settings.startup["enable-very-small-atomic-artillery"].value or settings.startup["enable-small-atomic-artillery"].value
  or settings.startup["enable-atomic-artillery"].value or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
  require("data-nukes-artillery")
end






local big_atomic_bomb_recipe = {
  type = "recipe",
  name = "big-atomic-bomb",
  enabled = false,
  energy_required = 180,
  ingredients =
  {
    {"atomic-bomb", 1},
    {"processing-unit", 10},
    {nuke_materials.boomMaterial, 75},
    {"explosives", 10},
    {"rocket-fuel", 20}
  },
  result = "big-atomic-bomb"
}

local  big_atomic_bomb_item = table.deepcopy(data.raw["ammo"]["atomic-bomb"])
big_atomic_bomb_item.name = "big-atomic-bomb"
big_atomic_bomb_item.order = "d[rocket-launcher]-c[big-atomic-bomb]"
big_atomic_bomb_item.ammo_type.range_modifier = 10
big_atomic_bomb_item.ammo_type.cooldown_modifier = 10
big_atomic_bomb_item.ammo_type.action.action_delivery.starting_speed = 0.025
big_atomic_bomb_item.ammo_type.action.action_delivery.projectile = "big-atomic-bomb-projectile"
big_atomic_bomb_item.icon = "__True-Nukes__/graphics/big-atomic-bomb.png"
big_atomic_bomb_item.stack_size = 5
if mods["SchallTankPlatoon"] then
  big_atomic_bomb_item.order = "d[rocket-launcher]-n[very-big-atomic-bomb]"
end
big_atomic_bomb_item.pictures.layers[1].filename="__True-Nukes__/graphics/big-atomic-bomb.png"
big_atomic_bomb_item.pictures.layers[1].mipmap_count = 4
big_atomic_bomb_item.pictures.layers[2].filename="__True-Nukes__/graphics/rocket-light-2.png"
big_atomic_bomb_item.pictures.layers[2].mipmap_count = 4

local big_atomic_bomb_projectile = table.deepcopy(data.raw["projectile"]["atomic-rocket"])
big_atomic_bomb_projectile.name = "big-atomic-bomb-projectile"
big_atomic_bomb_projectile.action.action_delivery.target_effects = nuke_explosions.N500t_detonation
big_atomic_bomb_projectile.created_effect = {
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

if(settings.startup["enable-big-atomic-bomb"].value) then
  data:extend{big_atomic_bomb_recipe, big_atomic_bomb_item, big_atomic_bomb_projectile}
end









local very_big_atomic_bomb_recipe = {
  type = "recipe",
  name = "very-big-atomic-bomb",
  enabled = false,
  energy_required = 300,
  ingredients =
  {
    {"atomic-bomb", 1},
    {"processing-unit", 20},
    {nuke_materials.boomMaterial, 100},
    {"explosives", 10},
    {"rocket-fuel", 50}
  },
  result = "very-big-atomic-bomb"
}

local  very_big_atomic_bomb_item = table.deepcopy(data.raw["ammo"]["atomic-bomb"])
very_big_atomic_bomb_item.name = "very-big-atomic-bomb"
very_big_atomic_bomb_item.order = "d[rocket-launcher]-c[very-big-atomic-bomb]"
very_big_atomic_bomb_item.ammo_type.range_modifier = 30
very_big_atomic_bomb_item.ammo_type.cooldown_modifier = 30
very_big_atomic_bomb_item.ammo_type.action.action_delivery.projectile = "very-big-atomic-bomb-projectile"
very_big_atomic_bomb_item.ammo_type.action.action_delivery.starting_speed = 0.01
very_big_atomic_bomb_item.icon = "__True-Nukes__/graphics/very-big-atomic-bomb.png"
very_big_atomic_bomb_item.stack_size = 1
very_big_atomic_bomb_item.pictures.layers[1].filename="__True-Nukes__/graphics/very-big-atomic-bomb.png"
very_big_atomic_bomb_item.pictures.layers[1].mipmap_count = 4
very_big_atomic_bomb_item.pictures.layers[2].filename="__True-Nukes__/graphics/rocket-light-3.png"
very_big_atomic_bomb_item.pictures.layers[2].mipmap_count = 4

if mods["SchallTankPlatoon"] then
  very_big_atomic_bomb_item.order = "d[rocket-launcher]-n[very-big-atomic-bomb]"
end
local very_big_atomic_bomb_projectile = table.deepcopy(data.raw["projectile"]["atomic-rocket"])
very_big_atomic_bomb_projectile.name = "very-big-atomic-bomb-projectile"
very_big_atomic_bomb_projectile.action.action_delivery.target_effects = nuke_explosions.N1kt_detonation
very_big_atomic_bomb_projectile.created_effect = {
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


if(settings.startup["enable-very-big-atomic-bomb"].value) then
  data:extend{very_big_atomic_bomb_recipe, very_big_atomic_bomb_item, very_big_atomic_bomb_projectile}
end







if(settings.startup["enable-big-atomic-ammo"].value or settings.startup["enable-big-atomic-cannons"].value
  or settings.startup["enable-big-atomic-bomb"].value or settings.startup["enable-very-big-atomic-bomb"].value
  or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
  local scary_nuke_tech = table.deepcopy(data.raw["technology"]["atomic-bomb"])
  scary_nuke_tech.name = "scary-atomic-weapons"
  scary_nuke_tech.effects = {}

  if (settings.startup["enable-big-atomic-bomb"].value) then
    table.insert(scary_nuke_tech.effects,
      {
        type = "unlock-recipe",
        recipe = "big-atomic-bomb"
      })
  end
  if (settings.startup["enable-very-big-atomic-bomb"].value) then
    table.insert(scary_nuke_tech.effects,
      {
        type = "unlock-recipe",
        recipe = "very-big-atomic-bomb"
      })
  end
  if (settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
    table.insert(scary_nuke_tech.effects,
      {
        type = "unlock-recipe",
        recipe = "TN-big-atomic-artillery-shell"
      })
  end
  scary_nuke_tech.unit.count=1000
  scary_nuke_tech.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"military-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1}
  }
  scary_nuke_tech.order = "e-b-a"
  scary_nuke_tech.prerequisites = {} -- "atomic-artillery-shells", "californium-processing"
  if(settings.startup["enable-atomic-ammo"].value or settings.startup["enable-big-atomic-ammo"].value
    or settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) then
    table.insert(scary_nuke_tech.prerequisites, "californium-processing")
    if(settings.startup["enable-small-atomic-artillery"].value or settings.startup["enable-atomic-artillery"].value
      or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
      table.insert(scary_nuke_tech.prerequisites, "atomic-artillery-shells")
    end
  elseif(settings.startup["enable-small-atomic-artillery"].value or settings.startup["enable-atomic-artillery"].value
    or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
    table.insert(scary_nuke_tech.prerequisites, "atomic-artillery-shells")
  else
    table.insert(scary_nuke_tech.prerequisites, "atomic-bomb")
  end
  scary_nuke_tech.icon = "__True-Nukes__/graphics/scary-atomic-tech.png"
  scary_nuke_tech.icon_mipmaps = 1
  data:extend{scary_nuke_tech}
end

if(settings.startup["enable-atomic-ammo"].value or settings.startup["enable-big-atomic-ammo"].value
  or settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) then
  require("data-nukes-californium")
end

if(settings.startup["enable-very-big-atomic-artillery"].value or settings.startup["enable-fusion-building"].value or settings.startup["enable-mega-fusion-building"].value) then
  require("data-nukes-huge")
end






if ((settings.startup["enable-atomic-cannons"].value or settings.startup["enable-big-atomic-cannons"].value) and mods["SchallTankPlatoon"] )then
  require("data-nukes-schall")
end
if(settings.startup["enable-fire-shield"].value) then
  table.insert(data.raw.technology["atomic-bomb"].effects, {
    type = "unlock-recipe",
    recipe = "fire-shield-equipment"
  })
end
      
