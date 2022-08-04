
local tints = {
  californium = {a=1, b = 0.35, g = 1, r = 0.95, l=true},
  uraniumLive = {a=1, b = 0.1, g = 1, r = 0.4, l=true},
  uraniumDead = {a=1, b = 0.1, g = 0.6, r = 0.3},
  tritium = {a=1, b = 0.95, g = 0.95, r = 0.15, l=true},
  nothing = {a=1, b = 0.5, g = 0.5, r = 0.5},
}



local function createAppearance(setup)
  local light_name = setup.light_name or setup.icon_name
  local result = {
    icons = {
      {
        icon_size = 64,
        icon = "__True-Nukes__/graphics/warheads/generic-warheads/base.png",
      },
      {
        icon_size = 64,
        icon = "__True-Nukes__/graphics/warheads/generic-warheads/top.png",
        tint = setup.topTint
      },
      {
        icon_size = 64,
        icon = "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-1.png",
        tint = setup.r1Tint
      },
      {
        icon_size = 64,
        icon = "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-2.png",
        tint = setup.r2Tint
      },
    },
    pictures = {
      {
        size = 64,
        filename = "__True-Nukes__/graphics/warheads/generic-warheads/base.png",
        scale = 0.25,
        mipmap_count = 1
      },
      {
        size = 64,
        filename = "__True-Nukes__/graphics/warheads/generic-warheads/top.png",
        tint = setup.topTint,
        scale = 0.25,
        mipmap_count = 1
      },
      {
        size = 64,
        filename = "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-1.png",
        tint = setup.r1Tint,
        scale = 0.25,
        mipmap_count = 1
      },
      {
        size = 64,
        filename = "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-2.png",
        tint = setup.r2Tint,
        scale = 0.25,
        mipmap_count = 1
      }
    }
  }
  if(setup.yield) then
    local textLocation = setup.textLoc or "__True-Nukes__/graphics/warheads/"
    table.insert(result.pictures,{
      size = 128,
      filename = textLocation .. "text_" .. setup.yield .. ".png",
      scale = 0.125,
      shift = {0, -0.5},
      no_shift = true
    })
    table.insert(result.icons,{
      icon_size = 128,
      icon = textLocation .. "text_" .. setup.yield .. ".png",
      scale = 0.25,
      shift = {0, -16},
      no_shift = true
    })
  end
  if(setup.topTint.l)then
    table.insert(result.pictures,{
      draw_as_light = true,
      flags = {"light"},
      size = 64,
      filename = "__True-Nukes__/graphics/warheads/generic-warheads/top-light.png",
      scale = 0.25,
      mipmap_count = 1
    })
  end
  if(setup.r1Tint.l)then
    table.insert(result.pictures,{
      draw_as_light = true,
      flags = {"light"},
      size = 64,
      filename = "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-1-light.png",
      scale = 0.25,
      mipmap_count = 1
    })
  end
  if(setup.r2Tint.l)then
    table.insert(result.pictures,{
      draw_as_light = true,
      flags = {"light"},
      size = 64,
      filename = "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-2-light.png",
      scale = 0.25,
      mipmap_count = 1
    })
  end

  return result
end



local function createBasicWarhead(setup)
  local item = {
    type = "item",
    name = setup.name,
    icons = setup.appearance.icons,
    pictures = setup.appearance.pictures,
    subgroup = setup.size .. "-warheads",
    order = setup.order,
    stack_size = setup.stack_size
  }
  local recipe = {
    type = "recipe",
    name = setup.name,
    enabled = true,
    energy_required = setup.time,
    ingredients = setup.ingredients,
    results=
    {
      {type="item", name=setup.name, amount = setup.amount or 1}
    }
  }
  data:extend({item, recipe});
end



return {
  createAppearance = createAppearance,
  createBasicWarhead = createBasicWarhead,
  tints = tints
}


