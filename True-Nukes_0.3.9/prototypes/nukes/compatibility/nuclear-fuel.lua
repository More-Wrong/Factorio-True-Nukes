require("add-basic-uranium-nukes")

if (data.raw.technology["expanded-atomics"]) then
	table.insert(data.raw.technology["expanded-atomics"].prerequisites, "plutonium-breeding")
end
if (data.raw.technology["californium-processing"]) then
	table.insert(data.raw.technology["californium-processing"].prerequisites, "plutonium-breeding")
end

if (data.raw.technology["dense-neutron-flux"]) then
  data.raw.technology["dense-neutron-flux"].effects[1] = nil
end




