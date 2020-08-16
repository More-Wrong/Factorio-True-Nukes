for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["atomic-cannon-shell"].enabled = technologies["atomic-bomb"].researched
  recipes["small-atomic-artillery-shell"].enabled = technologies["atomic-bomb"].researched
end
