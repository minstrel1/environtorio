local thorium_rock = table.deepcopy(data.raw["simple-entity"]["rock-huge-tan"])

thorium_rock.name = "thorium-rock"

thorium_rock.collision_box = {{-5.7, -3.7}, {5.7, 3.7}}
thorium_rock.selection_box = {{-6, -4}, {6, 4}}
thorium_rock.count_as_rock_for_filtered_deconstruction = false

thorium_rock.picture = {
    north = {
        layers = {
            {
                filename = "__environtorio__/graphics/entity/thorium/hugethoriumrock.png",
                priority = "extra-high",
                width = 567,
                height = 355,
                frame_count = 1,
                animation_speed = 1,
                --shift = {0.25, 0.0625},
            },
            {
                filename = "__environtorio__/graphics/entity/thorium/hugethoriumrock-light.png",
                priority = "extra-high",
                draw_as_glow = true,
                width = 567,
                height = 355,
                frame_count = 1,
                animation_speed = 1,
                --shift = {0.25, 0.0625},
            },
        }
    }
}

thorium_rock.picture.east = thorium_rock.picture.north
thorium_rock.picture.south = thorium_rock.picture.north
thorium_rock.picture.west = thorium_rock.picture.north
thorium_rock.pictures = nil
thorium_rock.animation = nil
thorium_rock.random_variation_on_create = false

thorium_rock.autoplace.coverage = 0.0001
thorium_rock.autoplace.max_probability = 0.09
thorium_rock.autoplace.tile_restriction = {}

thorium_rock.minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results = {{name = "stone", amount_min = 24, amount_max = 50}, {name = "thorium-ore", amount_min = 24, amount_max = 50}},
      --count = 200
    },

data:extend{thorium_rock}