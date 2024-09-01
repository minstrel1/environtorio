
-- copy the assembling machine 3 prototype

local foundry_item = table.deepcopy(data.raw["item"]["assembling-machine-3"])

foundry_item.name = "foundry"
foundry_item.place_result = "foundry"
foundry_item.order = "c[foundry]"

data:extend{foundry_item}

local foundry = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])

foundry.name = "foundry"
foundry.crafting_speed = 1
foundry.module_specification = {
    module_slots = 3
}
foundry.allowed_effects = {"consumption", "speed", "productivity", "pollution"}

foundry.minable = {mining_time = 0.1, result = "foundry"}

foundry.energy_usage = "300kW"
foundry.energy_source.emissions_per_minute = 10

foundry.animation = {
    north = {
        filename = "__environtorio__/graphics/entity/foundry/untitled.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(-1, -32),
        frame_count = 1,
        line_length = 1,
        priority = "extra-high",
    }
}

foundry.energy_source = {
    type = "heat",
    max_temperature = 1000,
    specific_heat = "1MJ",
    max_transfer = "1GW",
    min_working_temperature = 800,
    minimum_glow_temperature = 350,
    connections = {
        {
            position = {0.5, 1.5},
            direction = defines.direction.south
        },
        {
            position = {-0.5, 1.5},
            direction = defines.direction.south
        },
        -- {
        --     position = {1.5, 1.5},
        --     direction = defines.direction.east
        -- },
        -- {
        --     position = {1.5, -1.5},
        --     direction = defines.direction.east
        -- },
        {
            position = {0.5, -1.5},
            direction = defines.direction.north
        },
        {
            position = {-0.5, -1.5},
            direction = defines.direction.north
        },
        -- {
        --     position = {-1.5, 1.5},
        --     direction = defines.direction.west
        -- },
        -- {
        --     position = {-1.5, -1.5},
        --     direction = defines.direction.west
        -- },
    },
}
-- foundry.animation.layers[1].scale = (4.0 / 3.0)
-- foundry.animation.layers[1].hr_version.scale = (4.0 / 3.0) * 0.5
-- foundry.animation.layers[2].scale = (4.0 / 3.0)
-- foundry.animation.layers[2].hr_version.scale = (4.0 / 3.0) * 0.5

local pipe_covers = foundry.fluid_boxes[1].pipe_covers

foundry.fluid_boxes = {
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input",
                position = {2.5, 1.5}
            }
        }
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
                position = {2.5, -0.5}
            }
        }
    },
    {
        production_type = "output",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = 1,
        pipe_connections =
        {
            {
                type="output",
                position = {-2.5, -1.5}
            }
        }
    },
    {
        production_type = "output",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = 1,
        pipe_connections =
        {
            {
                type="output",
                position = {-2.5, 0.5}
            }
        }
    },
}

-- foundry.fluid_boxes[1].pipe_connections[1].position = {2.5, 1.5}
-- table.insert(foundry.fluid_boxes[1].pipe_connections, {type="input", position = {2.5, -0.5}})
-- foundry.fluid_boxes[2].pipe_connections[1].position = {-2.5, -1.5}
-- table.insert(foundry.fluid_boxes[2].pipe_connections, {type="output", position = {-2.5, 0.5}})

foundry.collision_box = {{-1.9, -1.9}, {1.9, 1.9}}
foundry.selection_box = {{-2, -2}, {2, 2}}

foundry.crafting_categories = {
    "metallurgy", 
}

local recipe = {
    type = "recipe",
    name = "foundry",
    enabled = true,
    energy_required = 7.5,
    ingredients = {{"steel-furnace", 2}, {"steel-beam", 20}, {"concrete", 50}, {"kr-steel-pipe", 10}},
    result = "foundry",
    requester_paste_multiplier = 5
}

data:extend{foundry, recipe}