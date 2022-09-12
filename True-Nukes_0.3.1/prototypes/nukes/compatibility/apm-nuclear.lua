require("add-basic-uranium-nukes")

data.raw.technology["tritium-processing"].prerequisites[1] = "apm_nuclear_breeder"
data.raw.technology["thermonuclear-bomb"] = nil

table.insert(data.raw.technology["expanded-atomics"].prerequisites, "nuclear-fuel-reprocessing")
table.insert(data.raw.technology["californium-processing"].prerequisites, "apm_nuclear_breeder")


data.raw.technology["dense-neutron-flux"].effects[1] = nil

data.raw.item["tritium-breeder-fuel-cell"].fuel_category = "apm_nuclear_breeder"
data.raw.item["advanced-tritium-breeder-fuel-cell"].fuel_category = "apm_nuclear_breeder"