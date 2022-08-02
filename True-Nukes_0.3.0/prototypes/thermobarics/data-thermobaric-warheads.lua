require("__True-Nukes__.prototypes.warhead-system.warheads")

local create_utils = require("__True-Nukes__.prototypes.warhead-system.warhead-creation-utils")

local circuit_type;
if not mods["bobelectronics"] then
  circuit_type = "advanced-circuit"
else
  circuit_type = "circuit-board"
end
local fuel_type;
if not mods["bobplates"] then
  fuel_type = "rocket-fuel"
else
  fuel_type = "enriched-fuel"
end
local function createAppearance(setup)
  return {
    icons = {
      {
        icon_size = 64,
        icon = setup.location .. setup.icon_name .. ".png",
      }
    }
  }
end


local createBasicWarhead = create_utils.createBasicWarhead

local warheads = {
  {
    name = "TN-thermobaric-1",
    order = "wa[TN-thermobaric-1]",
    size = "small",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "thermobaric-1"}),
    stack_size = 100,
    time = 20,
    ingredients = {
      {"explosives", 10},
      {circuit_type, 5},
      {fuel_type, 15},
      {"flamethrower-ammo", 5},
      {"empty-barrel", 2}
    }
  },
  {
    name = "TN-thermobaric-2",
    order = "wa[TN-thermobaric-2]",
    size = "medium",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "thermobaric-2"}),
    stack_size = 20,
    time = 30,
    ingredients = {
      {"explosives", 20},
      {circuit_type, 10},
      {fuel_type, 25},
      {"flamethrower-ammo", 12},
      {"empty-barrel", 5}
    }
  },

  {
    name = "TN-thermobaric-3",
    order = "wa[TN-thermobaric-3]",
    size = "large",
    appearance = createAppearance({location = "__True-Nukes__/graphics/warheads/", icon_name = "thermobaric-3"}),
    stack_size = 5,
    time = 40,
    ingredients = {
      {"explosives", 30},
      {circuit_type, 15},
      {fuel_type, 40},
      {"flamethrower-ammo", 20},
      {"empty-barrel", 10}
    }
  }
}

table.insert(warheadResults, {
  name = "TN-thermobaric-1",
  appendName = "-thermobaric-1",
  orderResult = "d-t-1",
  icon = "__True-Nukes__/graphics/warheads/thermobaric-1.png",
  chart_picture = "__True-Nukes__/graphics/artillery/thermobaric-artillery-map-visualization.png",
  size = "small",
  preciseSize = 16,
  explosion = {
    {
      type = "script",
      effect_id = "Thermobaric Weapon hit small"
    },
    {
      type = "create-entity",
      entity_name = "nuke-explosion"
    },
    {
      type = "create-entity",
      entity_name = "medium-scorchmark-tintable",
      check_buildability = true
    },
    {
      type = "destroy-decoratives",
      from_render_layer = "decals",
      to_render_layer = "object",
      include_soft_decoratives = true,
      include_decals = true,
      invoke_decorative_trigger = false,
      decoratives_with_trigger_only = false,
      radius = 3
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = 30,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 0.1, type = "fire"}
          }
        }
      }
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = 3,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = 600, type = "explosion"}
            }
          }
        }
      }
    }
  }
})

table.insert(warheadResults, {
  name = "TN-thermobaric-2",
  appendName = "-thermobaric-2",
  orderResult = "d-t-2",
  icon = "__True-Nukes__/graphics/warheads/thermobaric-2.png",
  chart_picture = "__True-Nukes__/graphics/artillery/thermobaric-artillery-map-visualization.png",
  size = "medium",
  preciseSize = 24,
  explosion = {
    {
      type = "script",
      effect_id = "Thermobaric Weapon hit medium"
    },
    {
      type = "create-entity",
      entity_name = "medium-scorchmark-tintable",
      check_buildability = true
    },
    {
      type = "destroy-decoratives",
      from_render_layer = "decals",
      to_render_layer = "object",
      include_soft_decoratives = true,
      include_decals = true,
      invoke_decorative_trigger = false,
      decoratives_with_trigger_only = false,
      radius = 6
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = 80,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 0.1, type = "fire"}
          }
        }
      }
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = 6,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = 600, type = "explosion"}
            }
          }
        }
      }
    }
  }
})

table.insert(warheadResults, {
  name = "TN-thermobaric-3",
  appendName = "-thermobaric-3",
  orderResult = "d-t-1",
  icon = "__True-Nukes__/graphics/warheads/thermobaric-3.png",
  chart_picture = "__True-Nukes__/graphics/artillery/thermobaric-artillery-map-visualization.png",
  size = "large",
  preciseSize = 32,
  explosion = {
    {
      type = "script",
      effect_id = "Thermobaric Weapon hit large"
    },
    {
      type = "create-entity",
      entity_name = "medium-scorchmark-tintable",
      check_buildability = true
    },
    {
      type = "destroy-decoratives",
      from_render_layer = "decals",
      to_render_layer = "object",
      include_soft_decoratives = true,
      include_decals = true,
      invoke_decorative_trigger = false,
      decoratives_with_trigger_only = false,
      radius = 9
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = 120,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 0.1, type = "fire"}
          }
        }
      }
    },
    {
      type = "nested-result",
      action =
      {
        type = "area",
        radius = 9,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "damage",
              damage = {amount = 600, type = "explosion"}
            }
          }
        }
      }
    }
  }
})

for _,setup in pairs(warheads) do
  createBasicWarhead(setup);
end

