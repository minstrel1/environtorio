
-- copy the assembling machine 3 prototype

local caster_item = table.deepcopy(data.raw["item"]["assembling-machine-3"])

caster_item.name = "caster"
caster_item.place_result = "caster"
caster_item.order = "c[caster]"

data:extend{caster_item}

local caster = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])

caster.name = "caster"
caster.crafting_speed = 1
caster.module_specification = {
    module_slots = 1
}
caster.allowed_effects = {"consumption", "speed", "productivity", "pollution"}

caster.minable = {mining_time = 0.1, result = "caster"}

caster.energy_usage = "150kW"
caster.energy_source.emissions_per_minute = 2

caster.animation = {
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

local pipe_covers = caster.fluid_boxes[1].pipe_covers

caster.fluid_boxes = {
    {
        production_type = "input",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections =
        {
            {
                type="input-output",
                position = {1.5, 1.5}
            },
            {
                type="input-output",
                position = {-1.5, 1.5}
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
                type="input-output",
                position = {1.5, -0.5}
            },
            {
                type="input-output",
                position = {-1.5, -0.5}
            },
        },
        filter = "water",
    },
}

-- caster.fluid_boxes[1].pipe_connections[1].position = {2.5, 1.5}
-- table.insert(caster.fluid_boxes[1].pipe_connections, {type="input", position = {2.5, -0.5}})
-- caster.fluid_boxes[2].pipe_connections[1].position = {-2.5, -1.5}
-- table.insert(caster.fluid_boxes[2].pipe_connections, {type="output", position = {-2.5, 0.5}})

caster.collision_box = {{-0.9, -1.9}, {0.9, 1.9}}
caster.selection_box = {{-1, -2}, {1, 2}}

caster.crafting_categories = {
    "casting", 
}

caster.created_effect = {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        {
          type = "script",
          effect_id = "caster-created",
        },
      }
    }
  }

local recipe = {
    type = "recipe",
    name = "caster",
    enabled = true,
    energy_required = 7.5,
    ingredients = {{"kr-steel-pipe", 5}, {"iron-gear-wheel", 20}, {"stone-brick", 50}, {"electronic-circuit", 10}},
    result = "caster",
    requester_paste_multiplier = 5
}

data:extend{caster, recipe}

local caster_loader = table.deepcopy(data.raw["loader-1x1"]["loader-1x1"])

caster_loader.name = "caster-loader"

caster_loader.structure = {
    direction_in =
    {
      sheet =
      {
        filename = "__environtorio__/graphics/empty.png",
        --filename = "__base__/graphics/entity/loader/loader-structure.png",
        priority = "extra-high",
        width = 16,
        height = 16,
      }
    },
    direction_out =
    {
      sheet =
      {
        filename = "__environtorio__/graphics/empty.png",
        --filename = "__base__/graphics/entity/loader/loader-structure.png",
        priority = "extra-high",
        width = 16,
        height = 16,
        y=16
      }
    }
}

caster_loader.structure_render_layer = "higher-object-above"

caster_loader.selectable_in_game = false

data:extend{caster_loader}