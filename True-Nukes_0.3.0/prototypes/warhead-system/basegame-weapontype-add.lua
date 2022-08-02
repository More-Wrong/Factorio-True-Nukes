shotgunSetup = {
  size = "tiny",
  hasProjectile = false,
  item = table.deepcopy(data.raw.ammo["uranium-rounds-magazine"]),
  recipe = table.deepcopy(data.raw.recipe["uranium-rounds-magazine"]),
  ingredient = "uranium-rounds-magazine",
  baseName = "rounds-magazine",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}

ammoSetup = {
  size = "tiny",
  hasProjectile = false,
  item = table.deepcopy(data.raw.ammo["uranium-rounds-magazine"]),
  recipe = table.deepcopy(data.raw.recipe["uranium-rounds-magazine"]),
  ingredient = "uranium-rounds-magazine",
  baseName = "rounds-magazine",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}

cannonSetup = {
  size = "small",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["uranium-cannon-shell"]),
  projectile = table.deepcopy(data.raw["projectile"]["uranium-cannon-projectile"]),
  recipe = table.deepcopy(data.raw.recipe["uranium-cannon-shell"]),
  ingredient = "uranium-cannon-shell",
  baseName = "cannon-shell",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}
cannonSetup.recipe.energy_required = 4;
cannonSetup.item.order = "d[explosive-cannon-shell]-c[x-shell]"
smallRocketSetup = {
  size = "small",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["rocket"]),
  projectile = table.deepcopy(data.raw.projectile["atomic-rocket"]),
  recipe = table.deepcopy(data.raw.recipe["atomic-bomb"]),
  ingredient = "rocket",
  baseName = "small-rocket",
  iconTable = {},
  iconShift = {-4, 0},
  lightTable = {},
}
smallRocketSetup.recipe.energy_required = 4;
smallRocketSetup.item.order = "d[rocket-launcher]-d[small]"
smallRocketSetup.item.ammo_type.range_modifier = 1
smallRocketSetup.item.ammo_type.cooldown_modifier = 1

bigRocketSetup = {
  size = "medium",
  minSize = "small",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["rocket"]),
  projectile = table.deepcopy(data.raw.projectile["atomic-rocket"]),
  recipe = table.deepcopy(data.raw.recipe["atomic-bomb"]),
  ingredients = {{"rocket", 1}, {"rocket-control-unit", 5}, {"rocket-fuel", 10}},
  baseName = "big-rocket",
  iconTable = {},
  iconShift = {-4, 0},
  lightTable = {},
}
bigRocketSetup.recipe.energy_required = 6;
bigRocketSetup.item.order = "d[rocket-launcher]-e[big]"
bigRocketSetup.item.ammo_type.range_modifier = 2
bigRocketSetup.item.ammo_type.cooldown_modifier = 20
bigRocketSetup.item.ammo_type.action.action_delivery.starting_speed = 0.01

artillerySetup = {
  size = "large",
  minSize = "medium",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["artillery-shell"]),
  projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"]),
  recipe = table.deepcopy(data.raw.recipe["artillery-shell"]),
  ingredient = "artillery-shell",
  baseName = "artillery-shell",
  iconTable = {},
  iconShift = {4, 2},
  coreShift = {-8, -8},
  lightTable = {},
}
capsuleSetup = {
  size = "large",
  minSize = "medium",
  hasProjectile = true,
  item = table.deepcopy(data.raw.ammo["grenade"]),
  projectile = table.deepcopy(data.raw["projectile"]["grenade"]),
  recipe = table.deepcopy(data.raw.recipe["grenade"]),
  ingredient = "grenade",
  baseName = "grenade",
  iconTable = {},
  lightTable = {},
}
landmineSetup = {
  size = "huge",
  hasProjectile = false,
  item = table.deepcopy(data.raw.ammo["landmine"]),
  recipe = table.deepcopy(data.raw.recipe["landmine"]),
  ingredient = "landmine",
  baseName = "landmine",
  iconTable = {},
  lightTable = {},
}