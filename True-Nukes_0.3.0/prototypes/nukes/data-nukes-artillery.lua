


local artillery_nuke_tech = table.deepcopy(data.raw["technology"]["atomic-bomb"])
artillery_nuke_tech.name = "atomic-artillery-shells"
artillery_nuke_tech.effects = {}
if(settings.startup["enable-very-small-atomic-artillery"].value) then
  table.insert(artillery_nuke_tech.effects,
    {
      type = "unlock-recipe",
      recipe = "TN-very-small-atomic-artillery-shell"
    })
end
if(settings.startup["enable-small-atomic-artillery"].value) then
  table.insert(artillery_nuke_tech.effects,
    {
      type = "unlock-recipe",
      recipe = "TN-small-atomic-artillery-shell"
    })
end
if(settings.startup["enable-atomic-artillery"].value or settings.startup["enable-big-atomic-artillery"].value or settings.startup["enable-very-big-atomic-artillery"].value) then
  table.insert(artillery_nuke_tech.effects,
    {
      type = "unlock-recipe",
      recipe = "TN-atomic-artillery-shell"
    })
end
artillery_nuke_tech.unit.count=2000
artillery_nuke_tech.prerequisites = {"atomic-bomb", "artillery"}
artillery_nuke_tech.order = "e-a-c"
artillery_nuke_tech.icon = "__True-Nukes__/graphics/atomic-artillery-tech.png"
artillery_nuke_tech.icon_mipmaps = 1
data:extend{artillery_nuke_tech}

      
