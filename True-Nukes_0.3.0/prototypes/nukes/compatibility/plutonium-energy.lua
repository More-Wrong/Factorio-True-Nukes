require("add-basic-uranium-nukes")


data.raw.technology["tritium-processing"].prerequisites[1] = "nuclear-breeding"
data.raw.technology["plutonium-atomic-bomb"] = nil

table.insert(data.raw.technology["expanded-atomics"].prerequisites, "plutonium-enrichment-process")
table.insert(data.raw.technology["californium-processing"].prerequisites, "plutonium-enrichment-process")

data.raw.item["tritium-breeder-fuel-cell"].fuel_category = "nuclear-breeder"
data.raw.item["advanced-tritium-breeder-fuel-cell"].fuel_category = "nuclear-breeder"
