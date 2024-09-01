local thorium_ore = table.deepcopy(data.raw["resource"]["iron-ore"])

--data.raw["resource"]["uranium-ore"]["stages_effect"]["sheet"]["blend_mode"] = "multiplicative"
--data.raw["resource"]["uranium-ore"]["min_effect_alpha"] = -0.3

thorium_ore.name = "thorium-ore"

thorium_ore.stage_counts = {2000, 1000, 300, 200, 100, 70, 40, 10}
thorium_ore.stages = {
    sheet = {
        filename = "__environtorio__/graphics/entity/thorium/thorium-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 2,
        variation_count = 8,
        scale = 0.5, 
    }
}

thorium_ore.map_color =  {59.0 / 255.0, 178.0 / 255.0, 166.0 / 255.0}
thorium_ore.autoplace = nil

thorium_ore.minable = {
    mining_particle = "stone-particle",
    mining_time = 2.5,
    result = "thorium-ore",

}

local thorium_autoplace_control = {
    type = "autoplace-control",
    name = "thorium-ore",
    richness = true,
    order = "x1",
    category = "resource"
}

local thorium_ore_item = table.deepcopy(data.raw["item"]["uranium-ore"])

thorium_ore_item.name = "thorium-ore"
thorium_ore_item.icon = "__environtorio__/graphics/icons/thorium-ore.png"

thorium_ore_item.pictures = {
    {
        layers =
        {
          {
            filename = "__environtorio__/graphics/icons/thorium-ore.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__environtorio__/graphics/icons/thorium-ore.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = {r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__environtorio__/graphics/icons/thorium-ore-2.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__environtorio__/graphics/icons/thorium-ore-2.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__environtorio__/graphics/icons/thorium-ore-3.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__environtorio__/graphics/icons/thorium-ore-3.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      },
      {
        layers =
        {
          {
            filename = "__environtorio__/graphics/icons/thorium-ore-4.png",
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
          {
            filename = "__environtorio__/graphics/icons/thorium-ore-4.png",
            blend_mode = "additive",
            draw_as_light = true,
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3},
            size = 64,
            scale = 0.25,
            mipmap_count = 4
          },
        }
      }
}

thorium_ore_item.order = "g[thorium-ore]"

local thorium_powder = {
    type = "item",
    name = "thorium-powder",
    icon = "__environtorio__/graphics/icons/thorium-powder.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "b[thorium-powder]",
    stack_size = 200
}

local thorium_pellets = {
    type = "item",
    name = "thorium-pellets",
    icon = "__environtorio__/graphics/icons/thorium-pellets.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "b[thorium-pellets]",
    stack_size = 100
}

local thorium_fuel_rod = {
    type = "item",
    name = "thorium-fuel-rod",
    icon = "__environtorio__/graphics/icons/thorium-pellets.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "b[thorium-fuel-rod]",
    fuel_category = "nuclear",
    burnt_result = "spent-thorium-fuel-rod",
    fuel_value = "800MJ",
    stack_size = 200
}

local spent_thorium_fuel_rod = {
    type = "item",
    name = "spent-thorium-fuel-rod",
    icon = "__environtorio__/graphics/icons/thorium-pellets.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "b[spent-thorium-fuel-rod]",
    stack_size = 200
}



data:extend{thorium_powder, thorium_pellets, thorium_fuel_rod, spent_thorium_fuel_rod}

data:extend{thorium_ore_item, thorium_ore, thorium_autoplace_control}