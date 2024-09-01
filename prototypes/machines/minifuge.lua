
data:extend{{name="thorium-processing", type="recipe-category"}}

local minifuge_item = table.deepcopy(data.raw["item"]["centrifuge"])

minifuge_item.name = "minifuge"
minifuge_item.icon = "__environtorio__/graphics/icons/minifuge.png"
minifuge_item.order = "g[minifuge]"
minifuge_item.place_result = "minifuge"
minifuge_item.stack_size = 50

data:extend{minifuge_item}

local minifuge = table.deepcopy(data.raw["assembling-machine"]["centrifuge"])

minifuge.name = "minifuge"

minifuge.minable = {mining_time = 0.1, result = "minifuge"}

minifuge.collision_box = {{-0.8, -0.8}, {0.8, 0.8}}
minifuge.selection_box = {{-1, -1}, {1, 1}}
minifuge.drawing_box = {{-1, -2.2}, {1, 1}}

minifuge.idle_animation = {
    layers = {
        {
            filename = "__environtorio__/graphics/entity/minifuge/minifuge-sheet.png",
            priority = "high",
            line_length = 8,
            width = 78,
            height = 117,
            frame_count = 64,
            shift = util.by_pixel(0.0, -15),
        },
        {
            filename = "__environtorio__/graphics/entity/minifuge/minifuge-shadow-sheet.png",
            draw_as_shadow = true,
            priority = "high",
            line_length = 8,
            width = 124,
            height = 74,
            frame_count = 64,
            shift = util.by_pixel(40, -4),
        },
    }
}

minifuge.working_visualisations = {
    {
        effect = "uranium-glow",
        fadeout = true,
        light = {intensity = 0.2, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 0.0, b = 1.0}}
    },
    {
        effect = "uranium-glow",
        fadeout = true,
        draw_as_light = true,
        animation = {
            layers = {
                {
                    filename = "__environtorio__/graphics/entity/minifuge/minifuge-light.png",
                    priority = "high",
                    blend_mode = "additive", -- centrifuge
                    line_length = 8,
                    width = 65,
                    height = 103,
                    frame_count = 64,
                    shift = util.by_pixel(-7, -20),
                },
            }
        }
    }
}

minifuge.crafting_speed = 1
minifuge.crafting_categories = {"thorium-processing"}
minifuge.energy_usage = "150kW"
minifuge.module_specification = {
    module_slots = 1
}

local minifuge_recipe = {
    type = "recipe",
    name = "minifuge",
    energy_required = 4,
    enabled = false,
    ingredients = {
        {"stone-brick", 50},
        {"steel-plate", 25},
        {"electronic-circuit", 25},
        {"iron-gear-wheel", 25}
    },
    result = "minifuge",
    requester_paste_multiplier = 10
}

data:extend{minifuge, minifuge_recipe}