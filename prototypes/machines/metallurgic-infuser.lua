
-- copy the assembling machine 3 prototype

local metallurgic_infuser_item = table.deepcopy(data.raw["item"]["assembling-machine-3"])

metallurgic_infuser_item.name = "metallurgic-infuser"
metallurgic_infuser_item.place_result = "metallurgic-infuser"
metallurgic_infuser_item.order = "c[metallurgic_infuser]"

data:extend{metallurgic_infuser_item}

local metallurgic_infuser = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])

metallurgic_infuser.name = "metallurgic-infuser"
metallurgic_infuser.crafting_speed = 1
metallurgic_infuser.module_specification = {
    module_slots = 1
}
metallurgic_infuser.allowed_effects = {"consumption", "speed", "productivity", "pollution"}

metallurgic_infuser.minable = {mining_time = 0.1, result = "metallurgic-infuser"}

metallurgic_infuser.energy_usage = "150kW"
metallurgic_infuser.energy_source.emissions_per_minute = 2

metallurgic_infuser.animation = {
    north = {
        filename = "__environtorio__/graphics/entity/metallurgic-infuser/metallurgic-infuser-ns.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(0, -40),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
    east = {
        filename = "__environtorio__/graphics/entity/metallurgic-infuser/metallurgic-infuser-ew.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(0, -36),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
    south = {
        filename = "__environtorio__/graphics/entity/metallurgic-infuser/metallurgic-infuser-ns.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(0, -40),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
    west = {
        filename = "__environtorio__/graphics/entity/metallurgic-infuser/metallurgic-infuser-ew.png",
        width = 160,
        height = 200,
        shift = util.by_pixel(0, -40),
        frame_count = 1,
        line_length = 1,
        priority = "high",
    },
}

local pipe_covers = metallurgic_infuser.fluid_boxes[1].pipe_covers

metallurgic_infuser.fluid_boxes = {
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input",
                position = {0, 1.5}
            },
        },
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
                position = {0, -1.5}
            },
        },
    },
}

-- metallurgic_infuser.fluid_boxes[1].pipe_connections[1].position = {2.5, 1.5}
-- table.insert(metallurgic_infuser.fluid_boxes[1].pipe_connections, {type="input", position = {2.5, -0.5}})
-- metallurgic_infuser.fluid_boxes[2].pipe_connections[1].position = {-2.5, -1.5}
-- table.insert(metallurgic_infuser.fluid_boxes[2].pipe_connections, {type="output", position = {-2.5, 0.5}})

metallurgic_infuser.collision_box = {{-1.4, -0.9}, {1.4, 0.9}}
metallurgic_infuser.selection_box = {{-1.5, -1}, {1.5, 1}}

metallurgic_infuser.crafting_categories = {
    "metallurgic-infusing", 
}

local recipe = {
    type = "recipe",
    name = "metallurgic-infuser",
    enabled = true,
    energy_required = 7.5,
    ingredients = {{"kr-steel-pipe", 5}, {"steel-beam", 10}, {"stone-brick", 20}, {"glass", 10}},
    result = "metallurgic-infuser",
    requester_paste_multiplier = 5
}

data:extend{metallurgic_infuser, recipe}
