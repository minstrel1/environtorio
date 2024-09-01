local noise = require "noise"
local resource_autoplace = require("__core__/lualib/resource-autoplace")

local magmacyte_main_hole = table.deepcopy(data.raw["resource"]["imersite"])

magmacyte_main_hole.name = "magmacyte-main-hole"
magmacyte_main_hole.category = "magmacyte-main-hole"
magmacyte_main_hole.infinite = true
magmacyte_main_hole.map_color = { r = 0, g = 1, b = 1 }

magmacyte_main_hole.collision_box = {{-4.4, -4.4}, {4.4, 4.4}}
magmacyte_main_hole.selection_box = {{-4.5, -4.5}, {4.5, 4.5}}
magmacyte_main_hole.collision_mask = {"player-layer", "resource-layer"}

magmacyte_main_hole.stages.sheet.scale = 1
magmacyte_main_hole.stages_effect.sheets[1].scale = 1

magmacyte_main_hole.minable = {
    mining_time = 1,
    results =
    {
    {
        type = "fluid",
        name = "magmacyte",
        amount_min = 10,
        amount_max = 10,
        probability = 1
    }
    }
}

magmacyte_main_hole.autoplace = {
    control = "magmacyte-main-hole",
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

magmacyte_main_hole.created_effect = {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        {
          type = "script",
          effect_id = "magmacyte-main-hole-created",
        },
      }
    }
  }


data:extend{magmacyte_main_hole,
    {
        type = "autoplace-control",
        name = "magmacyte-main-hole",
        localised_name = { "", "[entity=magmacyte-main-hole] ", { "autoplace-control-names.magmacyte-main-hole" } },
        richness = true,
        order = "b-k",
        category = "resource",
    },
    {
        type = "resource-category",
        name = "magmacyte-main-hole",
    },
    {
        type = "autoplace-control",
        name = "magmacyte-geyser",
        richness = true,
        order = "x1",
        category = "resource"
    },
}

local magmacyte_geyser = table.deepcopy(data.raw["resource"]["imersite"])

magmacyte_geyser.name = "magmacyte-geyser"
magmacyte_geyser.category = "magmacyte-geyser"
magmacyte_geyser.infinite = true
magmacyte_geyser.map_color = { r = 0, g = 1, b = 1 }

magmacyte_geyser.collision_box = {{-2.4, -2.4}, {2.4, 2.4}}
magmacyte_geyser.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
magmacyte_geyser.collision_mask = {"player-layer", "resource-layer"}

magmacyte_geyser.stages.sheet.scale = 0.5
magmacyte_geyser.stages_effect.sheets[1].scale = 0.5

magmacyte_geyser.autoplace = nil

magmacyte_geyser.minable = {
    mining_time = 1,
    results =
    {
    {
        type = "fluid",
        name = "magmacyte",
        amount_min = 10,
        amount_max = 10,
        probability = 1
    }
    }
}

magmacyte_geyser.minimum = 60000
magmacyte_geyser.normal = 300000

data:extend{magmacyte_geyser,
{
    type = "resource-category",
    name = "magmacyte-geyser",
},
}

data:extend{
    {
        type = "fluid",
        name = "magmacyte",
        default_temperature = 2000,
        max_temperature = 2000,
        heat_capacity = "1KJ",
        base_color = {r=1, g=0.47, b=0.01},
        flow_color = {r=0.7, g=0.7, b=0.7},
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        order = "a[fluid]-a[magmacyte]"
    },
}

-- data:extend({
--   {
--     type = "resource",
--     name = "imersite",
--     category = "kr-quarry",
--     icon = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite.png",
--     icon_size = 64,
--     icon_mipmaps = 4,
--     flags = { "placeable-neutral" },
--     order = "a-b-a",
--     subgroup = "raw-resource",
--     infinite = false,
--     highlight = true,
--     minimum = 50,
--     normal = 350,
--     infinite_depletion_amount = 10,
--     resource_patch_search_radius = 12,
--     tree_removal_probability = 1,
--     tree_removal_max_distance = 32 * 32,
--     minable = {
--       hardness = 1,
--       mining_time = 2,
--       result = "raw-imersite",
--     },
--     collision_box = { { -3.4, -3.4 }, { 3.4, 3.4 } },
--     selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
--     autoplace = resource_autoplace.resource_autoplace_settings({
--       name = "imersite",
--       order = "f",
--       base_density = 1,
--       richness_multiplier = 1,
--       richness_multiplier_distance_bonus = 1.5,
--       base_spots_per_km2 = 0.2,
--       has_starting_area_placement = false,
--       random_spot_size_minimum = 0.01,
--       random_spot_size_maximum = 0.1,
--       regular_blob_amplitude_multiplier = 1,
--       richness_post_multiplier = 1.0,
--       additional_richness = 350000,
--       regular_rq_factor_multiplier = 0.1,
--       candidate_spot_count = 22,
--     }),
--     stage_counts = { 0 },
--     stages = {
--       sheet = {
--         filename = kr_resources_sprites_path .. "imersite/imersite-rift.png",
--         priority = "extra-high",
--         width = 250,
--         height = 250,
--         frame_count = 6,
--         variation_count = 1,
--         scale = 0.8,
--         hr_version = {
--           filename = kr_resources_sprites_path .. "imersite/hr-imersite-rift.png",
--           priority = "extra-high",
--           width = 500,
--           height = 500,
--           frame_count = 6,
--           variation_count = 1,
--           scale = 0.4,
--         },
--       },
--     },
--     stages_effect = {
--       sheets = {
--         {
--           filename = kr_resources_sprites_path .. "imersite/imersite-rift-glow.png",
--           priority = "extra-high",
--           width = 250,
--           height = 250,
--           frame_count = 6,
--           variation_count = 1,
--           draw_as_glow = true,
--           scale = 0.8,
--           hr_version = {
--             filename = kr_resources_sprites_path .. "imersite/hr-imersite-rift-glow.png",
--             priority = "extra-high",
--             width = 500,
--             height = 500,
--             frame_count = 6,
--             variation_count = 1,
--             scale = 0.4,
--             draw_as_glow = true,
--           },
--         },
--       },
--     },
--     effect_animation_period = 5,
--     effect_animation_period_deviation = 1,
--     effect_darkness_multiplier = 3.5,
--     min_effect_alpha = 0.2,
--     max_effect_alpha = 0.3,
--     map_color = { r = 1, g = 0.5, b = 1 },
--     mining_visualisation_tint = { r = 0.792, g = 0.050, b = 0.858 },
--     map_grid = false,
--   },
--   {
--     type = "autoplace-control",
--     name = "imersite",
--     localised_name = { "", "[entity=imersite] ", { "autoplace-control-names.imersite" } },
--     richness = true,
--     order = "b-k",
--     category = "resource",
--   },
--   {
--     type = "noise-layer",
--     name = "imersite",
--   },
-- })
