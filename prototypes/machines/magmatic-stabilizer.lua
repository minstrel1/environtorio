local magmatic_stabilizer_dummy = table.deepcopy(data.raw["mining-drill"]["pumpjack"])

magmatic_stabilizer_dummy.name = "magmatic-stabilizer-dummy"
magmatic_stabilizer_dummy.resource_categories = {"magmacyte-main-hole"}

magmatic_stabilizer_dummy.collision_box = {{-4.1, -4.1}, {4.1, 4.1}}
magmatic_stabilizer_dummy.collision_mask = {"item-layer", "object-layer", "water-tile"}

magmatic_stabilizer_dummy.selection_box = {{-4.5, -4.5}, {4.5, 4.5}}

magmatic_stabilizer_dummy.output_fluid_box = nil

magmatic_stabilizer_dummy.minable = {mining_time = 0.5, result = "magmatic-stabilizer-dummy"}

magmatic_stabilizer_dummy.created_effect = {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        {
          type = "script",
          effect_id = "magmatic-stabilizer-created",
        },
      }
    }
  }

data:extend{magmatic_stabilizer_dummy, 
    {
        type = "item",
        name = "magmatic-stabilizer-dummy",
        icon = "__base__/graphics/icons/pumpjack.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "extraction-machine",
        order = "b[fluids]-b[magmatic-stabilizer-dummy]",
        place_result = "magmatic-stabilizer-dummy",
        stack_size = 20
    },
    {
        type = "recipe",
        name = "magmatic-stabilizer-dummy",
        energy_required = 5,
        ingredients =
        {
            {"steel-plate", 5},
            {"iron-gear-wheel", 10},
            {"electronic-circuit", 5},
            {"pipe", 10}
        },
        result = "magmatic-stabilizer-dummy",
        enabled = true
    },
}

local magmatic_stabilizer = table.deepcopy(data.raw["accumulator"]["accumulator"])

magmatic_stabilizer.name = "magmatic-stabilizer"

magmatic_stabilizer.collision_box = {{-4.1, -4.1}, {4.1, 4.1}}
magmatic_stabilizer.collision_mask = {"item-layer", "object-layer", "player-layer", "water-tile"}

magmatic_stabilizer.selection_box = {{-4.5, -4.5}, {4.5, 4.5}}

magmatic_stabilizer.energy_source = {
    type = "electric",
    buffer_capacity = "5GJ",
    usage_priority = "primary-input",
    input_flow_limit = "150MW",
    output_flow_limit = "0W"
}

magmatic_stabilizer.minable = {mining_time = 0.5, result = "magmatic-stabilizer-dummy"}

local magmatic_stabilizer_tank = table.deepcopy(data.raw["storage-tank"]["storage-tank"])

magmatic_stabilizer_tank.name = "magmatic-stabilizer-tank"

magmatic_stabilizer_tank.collision_box = {{-4.5, -4.5}, {4.5, 4.5}}
magmatic_stabilizer_tank.selection_box = {{-4.0, -4.0}, {4.0, 4.0}}

magmatic_stabilizer_tank.flags = {"placeable-player", "player-creation", "not-deconstructable", "not-blueprintable", "hide-alt-info", "not-rotatable", "not-selectable-in-game"}
magmatic_stabilizer_tank.selectable_in_game = false

magmatic_stabilizer_tank.fluid_box.pipe_connections = {
    { position = {-1, -5} },
    { position = {1, -5} },
    { position = {5, -1} },
    { position = {5, 1} },
    { position = {-5, 1} },
    { position = {-5, -1} },
    { position = {-1, 5} },
    { position = {1, 5} },
}
magmatic_stabilizer_tank.fluid_box.base_level = 0
magmatic_stabilizer_tank.fluid_box.base_area = 100
magmatic_stabilizer_tank.filter = "steam"

magmatic_stabilizer_tank.window_bounding_box = {{-0.0, 0.0}, {1.0, 0.0}}

local empty = {
    filename = "__environtorio__/graphics/empty.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = {0, 0}
}
magmatic_stabilizer_tank.pictures = {
    picture = empty,
    window_background = empty,
    fluid_background = empty,
    flow_sprite = empty,
    gas_flow = empty
}

data:extend{magmatic_stabilizer, 
    {
        type = "item",
        name = "magmatic-stabilizer",
        icon = "__base__/graphics/icons/pumpjack.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "extraction-machine",
        order = "b[fluids]-b[magmatic-stabilizer-dummy]",
        place_result = "magmatic-stabilizer-dummy",
        stack_size = 1
    },
    magmatic_stabilizer_tank
}

local magmacyte_pump = table.deepcopy(data.raw["mining-drill"]["pumpjack"])

magmacyte_pump.name = "magmacyte-pump"
magmacyte_pump.resource_categories = {"magmacyte-geyser"}

magmacyte_pump.collision_box = {{-2.1, -2.1}, {2.1, 2.1}}
magmacyte_pump.collision_mask = {"item-layer", "object-layer", "water-tile"}

magmacyte_pump.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}

magmacyte_pump.output_fluid_box.pipe_connections[1].position = {0, -3}
magmacyte_pump.output_fluid_box.pipe_connections[1].positions = nil 

magmacyte_pump.minable = {mining_time = 0.5, result = "magmacyte-pump"}

magmacyte_pump.created_effect = {
    type = "direct",
    action_delivery = {
      type = "instant",
      source_effects = {
        {
          type = "script",
          effect_id = "magmacyte-pump-created",
        },
      }
    }
  }

data:extend{magmacyte_pump, 
    {
        type = "item",
        name = "magmacyte-pump",
        icon = "__base__/graphics/icons/pumpjack.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "extraction-machine",
        order = "b[fluids]-b[magmatic-stabilizer-dummy]",
        place_result = "magmacyte-pump",
        stack_size = 20
    },
    {
        type = "recipe",
        name = "magmacyte-pump",
        energy_required = 5,
        ingredients =
        {
            {"steel-plate", 5},
            {"iron-gear-wheel", 10},
            {"electronic-circuit", 5},
            {"pipe", 10}
        },
        result = "magmacyte-pump",
        enabled = true
    },
}