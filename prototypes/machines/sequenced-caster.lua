
-- copy the assembling machine 3 prototype

local sequenced_caster_item = table.deepcopy(data.raw["item"]["assembling-machine-3"])

sequenced_caster_item.name = "sequenced_caster"
sequenced_caster_item.place_result = "sequenced_caster"
sequenced_caster_item.order = "c[sequenced_caster]"

data:extend{sequenced_caster_item}

local sequenced_caster = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])

sequenced_caster.name = "sequenced_caster"
sequenced_caster.crafting_speed = 1
sequenced_caster.module_specification = {
    module_slots = 1
}
sequenced_caster.base_productivity = 0.5
sequenced_caster.allowed_effects = {"consumption", "speed", "productivity", "pollution"}

sequenced_caster.minable = {mining_time = 0.1, result = "sequenced_caster"}

sequenced_caster.energy_usage = "300kW"
sequenced_caster.energy_source.emissions_per_minute = 6

sequenced_caster.animation = {
    north = {
        filename = "__environtorio__/graphics/entity/caster/caster-n.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(-1, -32),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
    east = {
        filename = "__environtorio__/graphics/entity/caster/caster-e.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(0, -36),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
    south = {
        filename = "__environtorio__/graphics/entity/caster/caster-s.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(-1, -32),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
    west = {
        filename = "__environtorio__/graphics/entity/caster/caster-w.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(1, -40),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
}

local pipe_covers = sequenced_caster.fluid_boxes[1].pipe_covers

sequenced_caster.fluid_boxes = {
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input-output",
                position = {2.0, 1.0}
            },
            {
                type="input-output",
                position = {-2.0, 1.0}
            },
        },
        filter = "water",
    },
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input",
                position = {2.0, -1.0}
            },
        },
    },
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input",
                position = {0.0, -3.0}
            },
        },
    },
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input",
                position = {-2.0, -1.0}
            },
        },
    },
}

-- caster.fluid_boxes[1].pipe_connections[1].position = {2.5, 1.5}
-- table.insert(caster.fluid_boxes[1].pipe_connections, {type="input", position = {2.5, -0.5}})
-- caster.fluid_boxes[2].pipe_connections[1].position = {-2.5, -1.5}
-- table.insert(caster.fluid_boxes[2].pipe_connections, {type="output", position = {-2.5, 0.5}})

sequenced_caster.collision_box = {{-1.4, -2.4}, {1.4, 2.4}}
sequenced_caster.selection_box = {{-1.5, -2.5}, {1.5, 2.5}}

sequenced_caster.crafting_categories = {
    "advanced-casting", 
}

-- caster.created_effect = {
--     type = "direct",
--     action_delivery = {
--       type = "instant",
--       source_effects = {
--         {
--           type = "script",
--           effect_id = "caster-created",
--         },
--       }
--     }
--   }

local recipe = {
    type = "recipe",
    name = "sequenced_caster",
    enabled = true,
    energy_required = 7.5,
    ingredients = {{"kr-steel-pipe", 5}, {"iron-gear-wheel", 20}, {"stone-brick", 50}, {"electronic-circuit", 10}},
    result = "sequenced_caster",
    requester_paste_multiplier = 5
}

data:extend{sequenced_caster, recipe}

-- local caster_loader = table.deepcopy(data.raw["loader-1x1"]["loader-1x1"])

-- caster_loader.name = "caster-loader"

-- caster_loader.structure = {
--     direction_in =
--     {
--       sheet =
--       {
--         filename = "__environtorio__/graphics/empty.png",
--         --filename = "__base__/graphics/entity/loader/loader-structure.png",
--         priority = "extra-high",
--         width = 16,
--         height = 16,
--       }
--     },
--     direction_out =
--     {
--       sheet =
--       {
--         filename = "__environtorio__/graphics/empty.png",
--         --filename = "__base__/graphics/entity/loader/loader-structure.png",
--         priority = "extra-high",
--         width = 16,
--         height = 16,
--         y=16
--       }
--     }
-- }

-- caster_loader.structure_render_layer = "higher-object-above"

-- caster_loader.selectable_in_game = false

-- data:extend{caster_loader}