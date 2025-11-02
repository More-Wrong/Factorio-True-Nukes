local nuke_materials = require("__True-Nukes__.prototypes.nukes.data-nukes-material")

local dead = nuke_materials.deadMaterial
local boom = nuke_materials.UBoomMaterial
local small = nuke_materials.smallBoomMaterial
local light = nuke_materials.lightMaterial
local reflector = nuke_materials.reflector
local computer = nuke_materials.computer
local fusionMaterial = nuke_materials.fusionMaterial


if(warheads["TN-warhead-20--1"]) then
  data:extend{
    {
      type = "recipe",
      name = "TN-warhead-20--1-uranium",
      order = "x-n-a-m-00020-1z",
      energy_required = 90,
      enabled = false,
      subgroup = "large-warheads",
      ingredients = {
        {type="item",name="steel-plate",amount=10},
        {type="item",name=computer,amount=8},
        {type="item",name="explosives",amount=30},
        {type="item",name=dead,amount=15},
        {type="item",name=boom,amount=30}
      },
      result = "TN-warhead-20--1"
    }
  }
if(data.raw.technology["basic-atomic-weapons"]) then

  table.insert(data.raw.technology["basic-atomic-weapons"].effects, 1, {type = "unlock-recipe", recipe = "TN-warhead-20--1-uranium"})
end
end
if(warheads["TN-warhead-20--2"]) then
  data:extend{
  {
    type = "recipe",
    name = "TN-warhead-20--2-uranium",
    order = "x-n-a-m-00020-2z",
    energy_required = 180,
    enabled = false,
    subgroup = "medium-warheads",
    ingredients = {
      {type="item",name=light,amount=20},
      {type="item",name=computer,amount=20},
      {type="item",name="explosives",amount=15},
      {type="item",name=dead,amount=5},
      {type="item",name=boom,amount=50}
    },
    result = "TN-warhead-20--2"
  }
  }
table.insert(data.raw.technology["atomic-bomb"].effects, 1, {type = "unlock-recipe", recipe = "TN-warhead-20--2-uranium"})
end



if(warheads["TN-warhead-8--1"]) then
  data:extend{
  {
    type = "recipe",
    name = "TN-warhead-8--1-uranium",
    order = "x-n-a-m-00008-1z",
    energy_required = 60,
    enabled = false,
    subgroup = "medium-warheads",
    ingredients = {
      {type="item",name="steel-plate",amount=6},
      {type="item",name=computer,amount=5},
      {type="item",name="explosives",amount=20},
      {type="item",name=dead,amount=10},
      {type="item",name=boom,amount=15}
    },
    result = "TN-warhead-8--1"
  }
  }
table.insert(data.raw.technology["atomic-bomb"].effects, 1, {type = "unlock-recipe", recipe = "TN-warhead-8--1-uranium"})
end
if(warheads["TN-warhead-4--1"]) then
  data:extend{
  {
    type = "recipe",
    name = "TN-warhead-4--1-uranium",
    order = "x-n-a-m-00004-1z",
    energy_required = 45,
    enabled = false,
    subgroup = "medium-warheads",
    ingredients = {
      {type="item",name="steel-plate",amount=5},
      {type="item",name=computer,amount=5},
      {type="item",name="explosives",amount=10},
      {type="item",name=dead,amount=5},
      {type="item",name=boom,amount=8}
    },
    result = "TN-warhead-4--1"
  }
  }
table.insert(data.raw.technology["atomic-bomb"].effects, 1, {type = "unlock-recipe", recipe = "TN-warhead-4--1-uranium"})
end
