require("add-basic-uranium-nukes")

table.insert(data.raw.technology["expanded-atomics"].prerequisites, "plutonium-breeding")
table.insert(data.raw.technology["californium-processing"].prerequisites, "plutonium-breeding")

data.raw.technology["dense-neutron-flux"].effects[1] = nil





