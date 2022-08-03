
data:extend({
  {
    name = "tiny-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y1[tiny-warheads]"
  },
  {
    name = "small-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y2[small-warheads]"
  },
  {
    name = "medium-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y3[medium-warheads]"
  },
  {
    name = "large-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y4[large-warheads]"
  },
  {
    name = "huge-warheads",
    type = "item-subgroup",
    group = "intermediate-products",
    order = "y5[huge-warheads]"
  }
})

--The minimal thing in the array looks like this:
--table.insert(nuclearCoreYields, {
--  name = "TN-warhead-0-1--1",
--  appendName = "-atomic-0_1t",
--  order = "n-m-000001-1",
--  chart_picture = "__True-Nukes__/graphics/artillery/atomic-artillery-californium-map-visualization.png",
--  size = "tiny",
--  preciseSize = 6,
--  explosion = nuke_explosions.N0_1t_detonation
--})

--all these work in generated names...
warheads = {}
weaponTypes = {}
warheadOverrides = {} -- functions taking the combined result, and changing things - very free form
warheadWeaponIgnore = {} -- names of things to ignore, mapped to true
warheadWeaponDoAnyway = {} -- names of things to do anyway, mapped to true - override to sizes
warheadWeaponNameMap= {} -- map of generated name to use name


local sizes = {
  tiny = 10,
  small = 20,
  medium = 30,
  large = 40,
  huge = 50,
  all = 100
}

local function addOverride(name, override)
  if not warheadOverrides[name] then
    warheadOverrides[name] = {}
  end
  table.insert(warheadOverrides[name], override)
end

return {sizes = sizes, addOverride = addOverride}

