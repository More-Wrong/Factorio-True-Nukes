local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
data.raw["tile"]["sand-1"].layer = 11
data.raw["tile"]["sand-2"].layer = 12
data.raw["tile"]["sand-3"].layer = 13

base_tiles_util = base_tiles_util or {}
water_transition_group_id = water_transition_group_id or 1
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local nuclear_shallow_transitions =
{
  {
    to_tiles = { "nuclear-deep", "nuclear-crater", "nuclear-deep-fill", "nuclear-deep-shallow-fill", "nuclear-crater-shallow-fill" },
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/nuclear-ground.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,

    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  base_tiles_util.ground_to_out_of_map_transition
}
local nuclear_crater_transitions =
{
  {
    to_tiles = { "nuclear-deep", "nuclear-deep-shallow-fill" },
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/nuclear-ground.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,

    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  base_tiles_util.ground_to_out_of_map_transition
}
local tileNames = { "nuclear-deep", "nuclear-crater", "nuclear-deep-fill", "nuclear-deep-shallow-fill",
  "nuclear-crater-shallow-fill", "nuclear-shallow" }
for _, tile in pairs(data.raw["tile"]) do
  table.insert(tileNames, tile.name)
end
local nuclear_high_transitions =
{
  {
    to_tiles = tileNames,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/nuclear-ground.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,

    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  base_tiles_util.ground_to_out_of_map_transition
}


local nuclear_shallow = table.deepcopy(data.raw["tile"]["nuclear-ground"])
nuclear_shallow.name = "nuclear-shallow"
nuclear_shallow.collision_mask =
{
  layers = {
    -- Player collides only with player-layer and train-layer,
    -- this can have any tile collision masks it doesn't matter for being walkable by player but not buildable.
    -- Having water-tile prevents placing paths, ground-tile prevents placing landfill.
    -- Not sure what other side effects could different combinations of tile masks cause.
    water_tile = true,
    resource = true,
    item = true,
    player = true,
    doodad = true
  }
}
nuclear_shallow.transition_merges_with_tile = "water"
nuclear_shallow.walking_speed_modifier = 0.7
nuclear_shallow.layer = 10
nuclear_shallow.map_color = { r = 46, g = 38, b = 33 }
nuclear_shallow.transitions = nuclear_shallow_transitions;

data:extend { nuclear_shallow }

local nuclear_crater = table.deepcopy(data.raw["tile"]["nuclear-ground"])
nuclear_crater.name = "nuclear-crater"
nuclear_crater.collision_mask = {
  layers =
  {
    water_tile = true,
    resource = true,
    item = true,
    player = true,
    doodad = true
  }
}
nuclear_crater.transition_merges_with_tile = "water"
nuclear_crater.layer = 9
nuclear_crater.map_color = { r = 43, g = 35, b = 31 }
nuclear_crater.transitions = nuclear_crater_transitions;

data:extend { nuclear_crater }

local nuclear_shallow_water_in_crater = table.deepcopy(data.raw["tile"]["water-mud"])
nuclear_shallow_water_in_crater.name = "nuclear-crater-shallow-fill"
nuclear_shallow_water_in_crater.walking_speed_modifier = 1
nuclear_shallow_water_in_crater.autoplace = nil
nuclear_shallow_water_in_crater.collision_mask =
{
  layers = {
    water_tile = true,
    resource = true,
    item = true,
    player = true,
    doodad = true
  }
}

data:extend { nuclear_shallow_water_in_crater }



local nuclear_deep = table.deepcopy(data.raw["tile"]["nuclear-ground"])
nuclear_deep.name = "nuclear-deep"
nuclear_deep.collision_mask =
{
  layers = {
    water_tile = true,
    resource = true,
    item = true,
    player = true,
    doodad = true
  }
}
nuclear_deep.transition_merges_with_tile = "water"
nuclear_deep.layer = 8
nuclear_deep.map_color = { r = 39, g = 31, b = 28 }
nuclear_deep.transitions = nil;

data:extend { nuclear_deep }


local nuclear_shallow_water_in_deep = table.deepcopy(data.raw["tile"]["water-mud"])
nuclear_shallow_water_in_deep.name = "nuclear-deep-shallow-fill"
nuclear_shallow_water_in_deep.autoplace = nil
nuclear_shallow_water_in_deep.walking_speed_modifier = 1
nuclear_shallow_water_in_deep.collision_mask =
{
  layers = {
    water_tile = true,
    resource = true,
    item = true,
    player = true,
    doodad = true
  }
}
data:extend { nuclear_shallow_water_in_deep }

local nuclear_water_in_deep = table.deepcopy(data.raw["tile"]["water"])
nuclear_water_in_deep.name = "nuclear-deep-fill"
nuclear_water_in_deep.autoplace = nil
nuclear_water_in_deep.collision_mask = {
  layers = {
    water_tile = true,
    resource = true,
    item = true,
    player = true,
    doodad = true
  }
}
data:extend { nuclear_water_in_deep }

local nuclear_high = table.deepcopy(data.raw["tile"]["nuclear-ground"])
nuclear_high.name = "nuclear-high"
nuclear_high.minable = { mining_time = 0.1, result = "stone" }
nuclear_high.can_be_part_of_blueprint = true
nuclear_high.collision_mask =
{
  layers = {
    -- Player collides only with player-layer and train-layer,
    -- this can have any tile collision masks it doesn't matter for being walkable by player but not buildable.
    -- Having water-tile prevents placing paths, ground-tile prevents placing landfill.
    -- Not sure what other side effects could different combinations of tile masks cause.
    ground_tile = true,
    item = true,
    player = true,
    object = true,
    doodad = true
  }
}
nuclear_high.transition_merges_with_tile = "water"
nuclear_high.layer = 128
nuclear_high.map_color = { r = 53, g = 43, b = 39 }
nuclear_high.transitions = nuclear_high_transitions;

data:extend { nuclear_high }


data:extend { {
  type = "item",
  name = "nuclear-crater-mound",
  icon = "__base__/graphics/icons/stone.png",
  icon_size = 64, icon_mipmaps = 4,
  subgroup = "terrain",
  order = "c[nuclear-crater-mound]",
  stack_size = 100,
  place_as_tile =
  {
    result = "nuclear-high",
    condition_size = 6,
    condition = {
      layers = {
        water_tile = true,
        ground_tile = true,
        item = true,
        player = true,
        object = true,
        doodad = true,
      }
    }
  }
} }
data.raw["tile"]["nuclear-deep"].allowed_neighbors = {};
data.raw["tile"]["nuclear-deep-shallow-fill"].allowed_neighbors = {};
data.raw["tile"]["nuclear-deep-fill"].allowed_neighbors = {};
data.raw["tile"]["nuclear-crater"].allowed_neighbors = {};
data.raw["tile"]["nuclear-crater-shallow-fill"].allowed_neighbors = {};
data.raw["tile"]["nuclear-shallow"].allowed_neighbors = {};
