for _,force in pairs(game.forces) do
  force.technologies["fusion-weapons"].researched = force.technologies["compact-fusion-weapons"].researched
    or force.technologies["fusion-weapons"].researched

  force.technologies["compact-full-fission-weapons"].researched = force.technologies["fusion-weapons"].researched
    or force.technologies["compact-full-fission-weapons"].researched

  force.technologies["full-fission-weapons"].researched = force.technologies["compact-full-fission-weapons"].researched
    or force.technologies["full-fission-weapons"].researched

  force.technologies["compact-californium-weapons"].researched = force.technologies["compact-full-fission-weapons"].researched
    or force.technologies["compact-californium-weapons"].researched

  force.technologies["atomic-artillery-shells"].researched = force.technologies["compact-full-fission-weapons"].researched
    or force.technologies["atomic-artillery-shells"].researched

  force.technologies["californium-weapons"].researched = force.technologies["compact-californium-weapons"].researched
    or force.technologies["californium-processing"].researched
    or force.technologies["californium-weapons"].researched


  force.technologies["expanded-atomics"].researched = force.technologies["atomic-artillery-shells"].researched
    or force.technologies["californium-weapons"].researched
    or force.technologies["full-fission-weapons"].researched
    or force.technologies["expanded-atomics"].researched

  force.technologies["atomic-bomb"].researched = force.technologies["expanded-atomics"].researched
    or force.technologies["atomic-bomb"].researched

  force.technologies["basic-atomic-bomb"].researched = force.technologies["atomic-bomb"].researched
    or force.technologies["basic-atomic-bomb"].researched
end
