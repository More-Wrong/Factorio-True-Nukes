local function unlockAll(tech, weaponTypes, warheads)
  for _,weapon in pairs(weaponTypes) do
    for _,warhead in pairs(warheads) do
      table.insert(tech.effects, {type = "unlock-recipe", recipe = weapon .. warhead})
    end
  end
end
return unlockAll