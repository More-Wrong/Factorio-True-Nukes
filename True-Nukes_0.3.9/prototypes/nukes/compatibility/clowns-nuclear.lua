require("add-basic-uranium-nukes")


if (data.raw.technology["tritium-processing"]) then
  if(mods["Clowns-AngelBob-Nuclear"]) then
    table.insert(data.raw.technology["tritium-processing"].prerequisites, "nuclear-fuel-reprocessing-2")
  end
end
data.raw.technology["thermonuclear-bomb"] = nil

if (data.raw.technology["expanded-atomics"]) then
  if(mods["Clowns-AngelBob-Nuclear"]) then
    table.insert(data.raw.technology["expanded-atomics"].prerequisites, "nuclear-fuel-reprocessing-2")
  else
    table.insert(data.raw.technology["expanded-atomics"].prerequisites, "nuclear-fuel-reprocessing")
  end
end
if (data.raw.technology["californium-processing"]) then
  table.insert(data.raw.technology["californium-processing"].prerequisites, "nuclear-fuel-reprocessing")
end

if (data.raw.technology["dense-neutron-flux"]) then
  data.raw.technology["dense-neutron-flux"].effects[1] = nil
end
