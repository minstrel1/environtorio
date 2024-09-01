apply_heat_pipe_glow = function(layer)
    layer.tint = heated_pipes_tint
    if layer.hr_version then
      layer.hr_version.tint = heated_pipes_tint
    end
    local light_layer = util.copy(layer)
    light_layer.draw_as_light = true
    light_layer.tint = heat_glow_tint
    if light_layer.hr_version then
      light_layer.hr_version.draw_as_light = true
      light_layer.hr_version.tint = heat_glow_tint
    end
    return
    {
      layers =
      {
        layer,
        light_layer
      }
    }
  end
  

local solid_heater = table.deepcopy(data.raw["reactor"]["nuclear-reactor"])

solid_heater.name = "solid-heater"

solid_heater.collision_box = {{-0.9, -0.9}, {0.9, 0.9}}
solid_heater.selection_box = {{-1, -1}, {1, 1}}

solid_heater.neighbour_bonus = 0.2
solid_heater.consumption = "400kW"

solid_heater.minable = {mining_time = 0.1, result = "solid-heater"}

solid_heater.lower_layer_picture = {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
    width = 156,
    height = 156,
    shift = util.by_pixel(-2, -4),
    scale = 0.4
}
solid_heater.heat_lower_layer_picture = apply_heat_pipe_glow {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
    width = 156,
    height = 156,
    shift = util.by_pixel(-3, -4),
    scale = 0.4
}
solid_heater.picture ={
    layers = {
        {
            filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
            width = 154,
            height = 158,
            shift = util.by_pixel(-6, -6),
            scale = 0.4
        },
        {
            filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
            width = 263,
            height = 162,
            shift = { 1.625 , 0 },
            draw_as_shadow = true,
            scale = 0.4
        }
    }
}
solid_heater.working_light_picture = {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
    blend_mode = "additive",
    draw_as_glow = true,
    width = 160,
    height = 160,
    shift = { -0.03125, -0.1875 },
    scale = 0.4
}

solid_heater.connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        scale = 0.4
      }
    }

solid_heater.connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        scale = 0.4
      }
    }

solid_heater.heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        scale = 0.4
      }
    }

solid_heater.heat_connection_patches_disconnected = {
    sheet = apply_heat_pipe_glow
    {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
    width = 32,
    height = 32,
    variation_count = 12,
    y = 32,
    scale = 0.4
    }
}

local fluid_heater = table.deepcopy(solid_heater)
fluid_heater.name = "fluid-heater"
fluid_heater.minable = {mining_time = 0.1, result = "fluid-heater"}

solid_heater.energy_source = {
    type = "burner",
    fuel_category = "chemical",
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    effectivity = (2.0 / 3.0),
    scale_energy_usage = true,
    light_flicker =
    {
        color = {0,0,0},
        minimum_intensity = 0.7,
        maximum_intensity = 0.95
    }
}

solid_heater.heat_buffer = {
    max_temperature = 1000,
    specific_heat = "1MJ",
    max_transfer = "10GW",
    minimum_glow_temperature = 350,
    connections =
    {
      {
        position = {-0.5, -0.5},
        direction = defines.direction.north
      },
      {
        position = {0.5, -0.5},
        direction = defines.direction.north
      },
      {
        position = {0.5, -0.5},
        direction = defines.direction.east
      },
      {
        position = {0.5, 0.5},
        direction = defines.direction.east
      },
      {
        position = {0.5, 0.5},
        direction = defines.direction.south
      },
      {
        position = {-0.5, 0.5},
        direction = defines.direction.south
      },
      {
        position = {-0.5, 0.5},
        direction = defines.direction.west
      },
      {
        position = {-0.5, -0.5},
        direction = defines.direction.west
      },
    },
}

local pipe_covers = data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_covers

fluid_heater.picture ={
    layers = {
        {
            filename = "__environtorio__/graphics/entity/heaters/fluid-heater.png",
            width = 80,
            height = 100,
            shift = util.by_pixel(-1, -6),
            scale = 1
        },
    }
}

fluid_heater.lower_layer_picture = {
    filename = "__environtorio__/graphics/entity/heaters/fluid-heater-pipes.png",
    width = 80,
    height = 100,
    shift = util.by_pixel(-1, -11),
}

fluid_heater.connection_patches_connected = {
    sheet = {
        filename = "__environtorio__/graphics/entity/heaters/fluid-heater-connect.png",
        width = 32,
        height = 32,
        variation_count = 4,
    }
}

fluid_heater.connection_patches_disconnected = {
    sheet = {
        filename = "__environtorio__/graphics/entity/heaters/fluid-heater-connect.png",
        width = 32,
        height = 32,
        variation_count = 4,
        y = 32
    }
}


fluid_heater.energy_source = {
    type = "fluid",
    burns_fluid = true,
    scale_fluid_usage = true,
    effectivity = (2.0 / 3.0),
    light_flicker =
    {
        color = {0,0,0},
        minimum_intensity = 0.7,
        maximum_intensity = 0.95
    },
    fluid_box = {
        production_type = "input-output",
        pipe_covers = pipe_covers,
        base_area = 10,
        base_level = -1,
        pipe_connections = {
            { type="input-output", position = {0.5, -1.5} },
            { type="input-output", position = {1.5, -0.5} },
            { type="input-output", position = {0.5, 1.5} },
            { type="input-output", position = {-1.5, -0.5} }
        },
        secondary_draw_orders = { north = -1 }
    },
}

fluid_heater.heat_buffer = {
    max_temperature = 1000,
    specific_heat = "1MJ",
    max_transfer = "10GW",
    minimum_glow_temperature = 350,
    connections =
    {
      {
        position = {-0.5, -0.5},
        direction = defines.direction.north
      },
      {
        position = {0.5, 0.5},
        direction = defines.direction.east
      },
      {
        position = {-0.5, 0.5},
        direction = defines.direction.south
      },
      {
        position = {-0.5, 0.5},
        direction = defines.direction.west
      },
    },
}

local solid_heater_item = {
    type = "item",
    name = "solid-heater",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    place_result = "solid-heater",
    stack_size = 10
}

local fluid_heater_item = {
    type = "item",
    name = "fluid-heater",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    place_result = "fluid-heater",
    stack_size = 10
}

data:extend{solid_heater, solid_heater_item}
data:extend{fluid_heater, fluid_heater_item}
