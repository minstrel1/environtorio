local noise = require "noise"
local resource_autoplace = require("__core__/lualib/resource-autoplace")

local frostnode_geode = table.deepcopy(data.raw["item"]["uranium-ore"])

frostnode_geode.name = "frostnode-geode"
frostnode_geode.icon = "__environtorio__/graphics/icons/thorium-ore.png"

data:extend{frostnode_geode}

local frostnode_sinkhole = table.deepcopy(data.raw["resource"]["imersite"])

frostnode_sinkhole.name = "frostnode-sinkhole"
frostnode_sinkhole.category = "frostnode-sinkhole"
frostnode_sinkhole.infinite = true
frostnode_sinkhole.map_color = { r = 0, g = 1, b = 1 }

frostnode_sinkhole.collision_box = {{-4.4, -4.4}, {4.4, 4.4}}
frostnode_sinkhole.selection_box = {{-4.5, -4.5}, {4.5, 4.5}}
frostnode_sinkhole.collision_mask = {"player-layer", "resource-layer"}

frostnode_sinkhole.stages.sheet.scale = 2
frostnode_sinkhole.stages.sheet.hr_version.scale = 1
frostnode_sinkhole.stages_effect.sheets[1].scale = 2
frostnode_sinkhole.stages_effect.sheets[1].hr_version.scale = 1

frostnode_sinkhole.minable = {
    mining_time = 2,
    results =
    {
    -- {
    --     type = "item",
    --     name = "frostnode-geode",
    --     amount_min = 10,
    --     amount_max = 10,
    --     probability = 1
    -- }
    }
}

frostnode_sinkhole.autoplace = {
    control = "frostnode-sinkhole",
    order = "a",
    probability_expression = noise.define_noise_function( function(x, y, tile, map)
        -- Frequency value from map gen settings
        local frequency_multiplier = 1 --noise.var("control-setting:ff-rocket-silo-hole:frequency:multiplier")
        local desired_frequency = 0.3 / (64 * 64^2)

        local elevation = noise.var("elevation")
        local distance = noise.var("distance")
        local aux = noise.var("resource-spread")

        local elevation_multiplier = noise.if_else_chain(
            noise.less_than(8, elevation),  -- only spawn at elevation 10 or higher
            noise.less_than(1000, distance),   -- spawn far from start
            0
        )
        return desired_frequency * frequency_multiplier * elevation_multiplier
      end),
    richness_expression = noise.define_noise_function( function(x, y, tile, map)
      return 10  -- Overwritten in control by script trigger
    end)
  }

frostnode_sinkhole.created_effect = {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        {
          type = "script",
          effect_id = "frostnode-sinkhole-created",
        },
      }
    }
  }


data:extend{frostnode_sinkhole,
    {
        type = "autoplace-control",
        name = "frostnode-sinkhole",
        localised_name = { "", "[entity=frostnode-sinkhole] ", { "autoplace-control-names.frostnode-sinkhole" } },
        richness = true,
        order = "b-k",
        category = "resource",
    },
    {
        type = "resource-category",
        name = "frostnode-sinkhole",
    },
}

local frostnode_boulder = table.deepcopy(data.raw["resource"]["imersite"])

frostnode_boulder.name = "frostnode-boulder"
frostnode_boulder.category = "boulder"
frostnode_boulder.infinite = true
frostnode_boulder.map_color = { r = 0, g = 1, b = 1 }

frostnode_boulder.collision_box = {{-2.4, -2.4}, {2.4, 2.4}}
frostnode_boulder.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
frostnode_boulder.collision_mask = {"player-layer", "resource-layer"}

frostnode_boulder.stages.sheet.scale = 0.5
frostnode_boulder.stages_effect.sheets[1].scale = 0.5

frostnode_boulder.autoplace = nil

frostnode_boulder.created_effect = {
  type = "direct",
  action_delivery = {
    type = "instant",
    source_effects = {
      {
        type = "script",
        effect_id = "frostnode-boulder-created",
      },
    }
  }
}

-- frostnode_boulder.minable = {
--     mining_time = 1,
--     results =
--     {
--     -- {
--     --     type = "fluid",
--     --     name = "unrefined-magmacyte",
--     --     amount_min = 10,
--     --     amount_max = 10,
--     --     probability = 1
--     -- }
--     }
-- }

-- magmacyte_geyser.minimum = 60000
-- magmacyte_geyser.normal = 300000

local frostnode_boulder_patch = table.deepcopy(data.raw["resource"]["imersite"])

frostnode_boulder_patch.name = "frostnode-boulder-patch"
frostnode_boulder_patch.category = "boulder-patch"
frostnode_boulder_patch.infinite = true
frostnode_boulder_patch.map_color = { r = 0, g = 1, b = 1 }

frostnode_boulder_patch.collision_box = {{-1.4, -1.4}, {1.4, 1.4}}
frostnode_boulder_patch.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
frostnode_boulder_patch.collision_mask = {"player-layer", "resource-layer"}

frostnode_boulder_patch.stages.sheet.scale = 0.25
frostnode_boulder_patch.stages.sheet.hr_version.scale = 0.125
frostnode_boulder_patch.stages_effect.sheets[1].scale = 0.25
frostnode_boulder_patch.stages_effect.sheets[1].hr_version.scale = 0.125

frostnode_boulder_patch.autoplace = nil

frostnode_boulder_patch.minable = {
  mining_time = 2,
  results =
  {
    {
        type = "item",
        name = "frostnode-geode",
        amount_min = 10,
        amount_max = 10,
        probability = 1
    }
  }
}

-- magmacyte_geyser.minimum = 60000
-- magmacyte_geyser.normal = 300000

data:extend{frostnode_boulder, frostnode_boulder_patch}