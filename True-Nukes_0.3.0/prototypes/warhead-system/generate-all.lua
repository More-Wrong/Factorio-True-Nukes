local util = require("warheads")

local warhead_sanitise = require("__True-Nukes__.prototypes.warhead-system.warhead-sanitise")
local weapontype_sanitise = require("__True-Nukes__.prototypes.warhead-system.weapontype-sanitise")
local combine = require("__True-Nukes__.prototypes.warhead-system.warhead-weapontype-combination")



log("generating")
for _,warhead_dirty in pairs(warheads) do
  local warhead = warhead_sanitise(warhead_dirty)
  log("warhead")
  warhead.warhead.recipe.enabled = true
  data:extend({warhead.warhead.item, warhead.warhead.recipe})
  for _,weapon_dirty in pairs(weaponTypes) do
    log("weapon")
    local weapontype = weapontype_sanitise(weapon_dirty)
    for _,warheadWeapon in pairs(warhead.weapons) do
      if((warhead.preciseSize <= weapontype.size.max and warhead.preciseSize > weapontype.size.min) or warheadWeaponDoAnyway[weapontype.name .. warheadWeapon.appendName]) then
        local combination = combine(table.deepcopy(weapontype), table.deepcopy(warheadWeapon))
        log("combo")
        if(combination.valid) then
          combination.recipe.enabled = true
          if(not data.raw.recipe[combination.recipe.name]) then
            local results = {combination.item, combination.recipe}
            if(combination.projectile) then
              table.insert(results, combination.projectile)
            end
            if(combination.landmine) then
              table.insert(results, combination.landmine)
            end
            data:extend(results)
          end
        end
      end
    end
  end
end
