local nuke_materials = require("data-nukes-material")

if(nuke_materials.smallBoomMaterial == "californium") then
  data:extend({
    {
      type = "item",
      name = "californium",
      icon = "__True-Nukes__/graphics/californium.png",
      icon_size = 64, icon_mipmaps = 4,
      pictures =
      {
        layers =
        {
          {
            size = 64,
            filename = "__True-Nukes__/graphics/californium.png",
            scale = 0.25,
            mipmap_count = 4
          },
          {
            draw_as_light = true,
            blend_mode = "additive",
            size = 64,
            filename = "__base__/graphics/icons/uranium-235.png",
            scale = 0.25,
            tint = {r = 0.8, g = 0.8, b = 0.1, a = 0.8},
            mipmap_count = 4
          }
        }
      },
      subgroup = "intermediate-product",
      order = "r[z-californium]",
      stack_size = 100
    },
    {
      type = "recipe",
      name = "californium-processing",
      energy_required = 120,
      enabled = false,
      category = "centrifuging",
      ingredients = {{nuke_materials.boomMaterial, 10}, {nuke_materials.deadMaterial, 1}},
      icon = "__True-Nukes__/graphics/californium-processing.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "intermediate-product",
      order = "r[uranium-processing]-d[californium-processing]",
      main_product = "californium",
      results = {{nuke_materials.boomMaterial, 9}, {"californium", 1}},
      allow_decomposition = false
    },

  });
end

data:extend{
  {
    type = "item",
    name = "FOGBANK",
    icon = "__True-Nukes__/graphics/FOGBANK.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[fogbank]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "FOGBANK",
    category = "chemistry",
    energy_required = 20,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="petroleum-gas", amount=20},
      {type="fluid", name="sulfuric-acid", amount=20},
      {type="item", name="low-density-structure", amount=10},
      {type="item", name="plastic-bar", amount=10}
    },
    results=
    {
      {type="item", name="FOGBANK", amount=1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.965, g = 0.482, b = 0.338, a = 1.000}, -- #f67a56ff
      secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000}, -- #d38e38ff
      tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000}, -- #b9d070ff
      quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}, -- #efc230ff
    }
  }
};

data:extend{
  {
    type = "item",
    name = "neutron-reflector",
    icon = "__True-Nukes__/graphics/neutron-reflector.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "r[neutron-reflector]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "neutron-reflector",
    category = "chemistry",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
      {type="item", name="low-density-structure", amount=1},
      {type="fluid", name="petroleum-gas", amount=10},
      {type="item", name="plastic-bar", amount=10},
      {type="item", name="iron-plate", amount=5},
      {type="item", name="sulfur", amount=10}
    },
    results=
    {
      {type="item", name="neutron-reflector", amount=1}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.965, g = 0.482, b = 0.338, a = 1.000}, -- #f67a56ff
      secondary = {r = 0.831, g = 0.560, b = 0.222, a = 1.000}, -- #d38e38ff
      tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000}, -- #b9d070ff
      quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}, -- #efc230ff
    }
  }
};

if(nuke_materials.fusionMaterial == "tritium-canister") then
  data:extend({
    {
      type = "item",
      name = "tritium-breeder-fuel-cell",
      icon = "__True-Nukes__/graphics/tritium-breeder-fuel-cell.png",
      icon_size = 64, icon_mipmaps = 4,
      pictures =
      {
        layers =
        {
          {
            size = 64,
            filename = "__True-Nukes__/graphics/tritium-breeder-fuel-cell.png",
            scale = 0.25,
            mipmap_count = 4
          },
          {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = "__True-Nukes__/graphics/tritium-breeder-fuel-cell-light.png",
            scale = 0.25,
            mipmap_count = 4
          }
        }
      },
      subgroup = "intermediate-product",
      order = "r[uranium-processing]-c[tritium-breeder-fuel-cell]",
      fuel_category = "nuclear",
      burnt_result = "used-up-tritium-breeder-fuel-cell",
      fuel_value = "4GJ",
      stack_size = 50
    },
    {
      type = "item",
      name = "used-up-tritium-breeder-fuel-cell",
      icon = "__True-Nukes__/graphics/used-up-tritium-breeder-fuel-cell.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "intermediate-product",
      order = "s[used-up-tritium-breeder-fuel-cell]",
      stack_size = 50
    },

    {
      type = "recipe",
      name = "tritium-extraction",
      energy_required = 60,
      enabled = false,
      category = "centrifuging",
      ingredients = {{"used-up-tritium-breeder-fuel-cell", 5}},
      icon = "__True-Nukes__/graphics/tritium-extraction.png",
      icon_size = 64, icon_mipmaps = 1,
      subgroup = "intermediate-product",
      order = "r[uranium-processing]-c[tritium-extraction]",
      main_product = "",
      results = {{"tritium-canister", 1}, {"uranium-238", 3}},
      allow_decomposition = false
    },
    {
      type = "recipe",
      name = "tritium-breeder-fuel-cell",
      energy_required = 10,
      enabled = false,
      category = "crafting-with-fluid",
      ingredients =
      {
        {"iron-plate", 10},
        {"uranium-235", 1},
        {"uranium-238", 19},
        {type="fluid", name="water", amount=100}
      },
      result = "tritium-breeder-fuel-cell",
      result_count = 10
    },
    {
      type = "item",
      name = "tritium-canister",
      icon = "__True-Nukes__/graphics/tritium-canister.png",
      icon_size = 64, icon_mipmaps = 1,
      pictures =
      {
        layers =
        {
          {
            size = 64,
            filename = "__True-Nukes__/graphics/tritium-canister.png",
            scale = 0.25,
            mipmap_count = 1
          },
          {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = "__True-Nukes__/graphics/tritium-canister-light.png",
            scale = 0.25,
            mipmap_count = 1
          }
        }
      },
      subgroup = "intermediate-product",
      order = "q[tritium-canister]",
      stack_size = 50
    }
  })
end
