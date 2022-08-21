
local tints = {
  californium = {a=1, b = 0.1, g = 1, r = 0.95, l=true},
  uraniumLive = {a=1, b = 0.1, g = 1, r = 0.3, l=true},
  uraniumDead = {a=1, b = 0.15, g = 0.4, r = 0.15},
  tritium = {a=1, b = 0.95, g = 0.95, r = 0.15, l=true},
  nothing = {a=1, b = 0.5, g = 0.5, r = 0.5},
  lightNothing = {a=1, b = 0.95, g = 0.95, r = 0.95},
  explosive = {a=1, b = 0.1, g = 0.1, r = 0.9},
  flamable = {a=1, b = 0.1, g = 0.7, r = 1},
}

local sprite_types = {
  artillery = {
    {
      base = "__base__/graphics/icons/artillery-shell.png"
    },
    {
      sections = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
      },
      lights = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
      },
      final = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-base.png"
    },
    {
      base = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-1-base-left.png",
      sections = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-1.png"
      },
      lights = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-1.png"
      },
      final = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-1-base-right.png"
    },
    {
      base = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-2-base-left.png",
      sections = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-1.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-2.png"
      },
      lights = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-1.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-2.png"
      },
      final = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-2-base-right.png"
    },
    {
      base = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-fat-base-left.png",
      sections = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-fat.png"
      },
      lights = {
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-tip.png",
        "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-fat.png"
      },
      final = "__True-Nukes__/graphics/artillery/artillery-generic/artillery-shell-ring-fat-base-right.png",
    },
  },
  cannon = {
    {
      base = "__True-Nukes__/graphics/cannon/cannon-shell-base.png"
    },
    {
      base = "__True-Nukes__/graphics/cannon/cannon-shell-base.png",
      sections = {
        "__True-Nukes__/graphics/cannon/cannon-shell-tip.png",
      },
      lights = {
        "__True-Nukes__/graphics/cannon/cannon-shell-tip.png",
      },
      final = "__True-Nukes__/graphics/cannon/cannon-shell-base-top.png"
    },
    {
      base = "__True-Nukes__/graphics/cannon/cannon-shell-base.png",
      sections = {
        "__True-Nukes__/graphics/cannon/cannon-shell-edge.png",
      },
      lights = {
        "__True-Nukes__/graphics/cannon/cannon-shell-edge.png",
      },
      final = "__True-Nukes__/graphics/cannon/cannon-shell-base-top.png"
    },
    {
      base = "__True-Nukes__/graphics/cannon/cannon-shell-base.png",
      sections = {
        "__True-Nukes__/graphics/cannon/cannon-shell-tip.png",
        "__True-Nukes__/graphics/cannon/cannon-shell-edge.png",
      },
      lights = {
        "__True-Nukes__/graphics/cannon/cannon-shell-tip.png",
        "__True-Nukes__/graphics/cannon/cannon-shell-edge.png",
      },
      final = "__True-Nukes__/graphics/cannon/cannon-shell-base-top.png"
    },
  },
  rocket = {
    {
      base = "__True-Nukes__/graphics/rockets/rockets-generic/rocket.png"
    },
    {
      base = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-fins.png",
      },
      sections = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip.png",
      },
      lights = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip-light.png",
      },
      final = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-3.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      },
    },
    {
      base = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-fins.png",
      },
      sections = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1.png",
      },
      lights = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1-light.png",
      },
      final = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-3.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      },
    },
    {
      base = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-fins.png",
      },
      sections = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2.png",
      },
      lights = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2-light.png",
      },
      final = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-3.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      },
    },
    {
      base = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-fins.png",
      },
      sections = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      },
      lights = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      },
      final = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-3.png",
      },
    },
    {
      base = "__True-Nukes__/graphics/rockets/rockets-generic/rocket-fins.png",
      sections = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-3.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      },
      lights = {
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-tip-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-1-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-2-light.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-ring-3.png",
        "__True-Nukes__/graphics/rockets/rockets-generic/rocket-engine.png",
      }
    },
  },
  rounds = {
    {
      base = "__True-Nukes__/graphics/rounds/generic-rounds/rounds-blank.png",
      sections = {
        "__True-Nukes__/graphics/rounds/generic-rounds/rounds-end.png",
      },
      lights = {
        "__True-Nukes__/graphics/rounds/generic-rounds/rounds-end.png",
      }
    },
    {
      base = "__True-Nukes__/graphics/rounds/generic-rounds/rounds-blank.png",
      sections = {
        "__True-Nukes__/graphics/rounds/generic-rounds/rounds-end.png",
        "__True-Nukes__/graphics/rounds/generic-rounds/rounds-middle.png",
      },
      lights = {
        "__True-Nukes__/graphics/rounds/generic-rounds/rounds-end.png",
        "__True-Nukes__/graphics/rounds/generic-rounds/rounds-middle.png",
      }
    }
  },
  nuclear_core = {
    {
      base = "__True-Nukes__/graphics/warheads/generic-warheads/base.png",
      sections = {
        "__True-Nukes__/graphics/warheads/generic-warheads/top.png",
        "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-1.png",
        "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-2.png",
      },
      lights = {
        "__True-Nukes__/graphics/warheads/generic-warheads/top-light.png",
        "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-1-light.png",
        "__True-Nukes__/graphics/warheads/generic-warheads/ring-part-2-light.png",
      }
    }
  }
}

local function createAppearance(setup)
  local result = {}
  result.icons = {}
  result.lights = {}
  local sprites = setup.sprite_types or sprite_types
  local sprite_type = sprites[setup.type]
  local style = sprite_type[setup.style or 1]

  local text_location = setup.text_location or "__True-Nukes__/graphics/warheads/"

  if(style.base) then
    if(type(style.base) == "table" and not style.base.icon) then
      for _,s in pairs(style.base) do
        table.insert(result.icons, s)
      end
    else
      table.insert(result.icons, style.base)
    end
  end
  if(style.sections) then
    for i,s in ipairs(style.sections) do
      if(setup.tints[i].l or setup.tints[i].light) then
        if(type(style.lights[i]) == "table") then
          local section = table.deepcopy(style.lights[i])
          table.insert(result.lights, section)
        else
          table.insert(result.lights, style.lights[i])
        end
      end
      if(type(s) == "table") then
        local section = table.deepcopy(s)
        section.tint = setup.tints[i]
        table.insert(result.icons, section)
      else
        table.insert(result.icons, {
          icon = s,
          icon_size = 64,
          tint = setup.tints[i]
        })
      end
    end
  end
  if(style.final) then
    if(type(style.final) == "table" and not style.final.icon) then
      for _,s in pairs(style.final) do
        table.insert(result.icons, s)
      end
    else
      table.insert(result.icons, style.final)
    end
  end
  if(setup.text) then
    table.insert(result.icons, {
      icon_size = 128,
      icon = text_location .. "text_" .. setup.text .. ".png",
      scale = 0.25,
      shift = {0, -16},
      special = true
    })
    -- not a light, but kind of treated like one
    table.insert(result.lights, {
      size = 128,
      filename = text_location .. "text_" .. setup.text .. ".png",
      scale = 0.125,
      shift = {0, -0.5},
      special = true
    })
  end
  return result
end

local function setupWarheadsForWeapon(setup)
  local sprites = setup.sprite_types or sprite_types
  local sprite_type = sprites[setup.type]
  local weapontype = setup.weapon
  local text_location = setup.text_location or "__True-Nukes__/graphics/warheads/"

  for w,v in pairs(setup.warheads) do
    local style = sprite_type[v.style or 1]
    local icons = {}
    local lights = {}

    if(style.base) then
      if(type(style.base) == "table" and not style.base.icon) then
        for _,s in pairs(style.base) do
          table.insert(icons, s)
        end
      else
        table.insert(icons, style.base)
      end
    end
    if(style.sections) then
      for i,s in ipairs(style.sections) do
        if(v.tints[i].l or v.tints[i].light) then
          if(type(s) == "table") then
            local section = table.deepcopy(s)
            table.insert(lights, section)
          else
            table.insert(lights, style.lights[i])
          end
        end
        if(type(s) == "table") then
          local section = table.deepcopy(s)
          section.tint = v.tints[i]
          table.insert(icons, section)
        else
          table.insert(icons, {
            icon = s,
            icon_size = 64,
            tint = v.tints[i]
          })
        end
      end
    end

    if(style.final) then
      if(type(style.final) == "table" and not style.final.icon) then
        for _,s in pairs(style.final) do
          table.insert(icons, s)
        end
      else
        table.insert(icons, style.final)
      end
    end
    if(v.text) then
      table.insert(icons, {
        icon_size = 128,
        icon = text_location .. "text_" .. v.text .. ".png",
        scale = 0.25,
        shift = {0, -16},
        special = true
      })
      -- not a light, but kind of treated like one
      table.insert(lights, {
        size = 128,
        filename = text_location .. "text_" .. v.text .. ".png",
        scale = 0.125,
        shift = {0, -0.5},
        special = true
      })
    end
    weaponTypes[weapontype].icons[w] = icons
    weaponTypes[weapontype].lights[w] = lights
  end
end
--{type = "artillery", weapon = "artillery-shell", warheads = {}}
--warheads[a] = {style = 1, tints = {}}











return {tints = tints, createAppearance = createAppearance, setupWarheadsForWeapon = setupWarheadsForWeapon}





