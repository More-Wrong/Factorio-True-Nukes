require("add-basic-uranium-nukes")


data.raw.technology["tritium-processing"].prerequisites[1] = "nuclear-fuel-reprocessing-2"
data.raw.technology["thermonuclear-bomb"] = nil

table.insert(data.raw.technology["expanded-atomics"].prerequisites, "nuclear-fuel-reprocessing-2")
table.insert(data.raw.technology["californium-processing"].prerequisites, "nuclear-fuel-reprocessing")


data.raw.technology["dense-neutron-flux"].effects[1] = nil