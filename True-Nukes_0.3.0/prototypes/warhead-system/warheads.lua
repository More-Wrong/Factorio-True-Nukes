
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
warheadResults = {}
weaponTypeResults = {}



