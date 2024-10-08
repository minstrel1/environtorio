data:extend{
    {
        type = "recipe",
        name = "basic-iron-plate-casting",
        energy_required = 16,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-iron", amount = 250},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-iron-plate-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "o-e[basic-iron-plate-casting]",
        results = {
            {type="item", name = "iron-plate", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-iron-stick-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-iron", amount = 375},
            {type="fluid", name = "water", amount = 1500},
        },
        icon = "__environtorio__/graphics/icons/basic-iron-stick-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "o-f[basic-iron-stick-casting]",
        results = {
            {type="item", name = "iron-stick", amount = 30 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-iron-gear-wheel-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-iron", amount = 375},
            {type="fluid", name = "water", amount = 1500},
        },
        icon = "__environtorio__/graphics/icons/basic-iron-gear-wheel-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "o-g[basic-iron-gear-wheel-casting]",
        results = {
            {type="item", name = "iron-gear-wheel", amount = 15 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-iron-beam-casting",
        energy_required = 20,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-iron", amount = 750},
            {type="fluid", name = "water", amount = 3000},
        },
        icon = "__environtorio__/graphics/icons/basic-iron-beam-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "o-h[basic-iron-plate-casting]",
        results = {
            {type="item", name = "iron-beam", amount = 15 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-pipe-casting",
        energy_required = 1,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-iron", amount = 100},
            {type="fluid", name = "water", amount = 200},
        },
        icon = "__environtorio__/graphics/icons/basic-pipe-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "o-i[basic-pipe-casting]",
        results = {
            {type="item", name = "pipe", amount = 4 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-pipe-to-ground-casting",
        energy_required = 5,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-iron", amount = 250},
            {type="fluid", name = "water", amount = 500},
        },
        icon = "__environtorio__/graphics/icons/basic-pipe-to-ground-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "o-j[basic-pipe-to-ground-casting]",
        results = {
            {type="item", name = "pipe-to-ground", amount = 2 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-copper-plate-casting",
        energy_required = 16,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-copper", amount = 250},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-copper-plate-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "copper-processing",
        order = "ob[basic-copper-plate-casting]",
        results = {
            {type="item", name = "copper-plate", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-copper-cable-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-copper", amount = 375},
            {type="fluid", name = "water", amount = 1500},
        },
        icon = "__environtorio__/graphics/icons/basic-copper-cable-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "copper-processing",
        order = "ob[basic-copper-cable-casting]",
        results = {
            {type="item", name = "copper-cable", amount = 30 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-glass-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-glass", amount = 100},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-glass-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "sand-processing",
        order = "of[basic-glass-casting]",
        results = {
            {type="item", name = "glass", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-silicon-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-silicon", amount = 100},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-silicon-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "sand-processing",
        order = "og[basic-glass-casting]",
        results = {
            {type="item", name = "silicon", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-steel-plate-casting",
        energy_required = 16,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-steel", amount = 250},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-steel-plate-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "steel-processing",
        order = "oc[basic-steel-plate-casting]",
        results = {
            {type="item", name = "steel-plate", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-steel-gear-wheel-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-steel", amount = 375},
            {type="fluid", name = "water", amount = 1500},
        },
        icon = "__environtorio__/graphics/icons/basic-steel-gear-wheel-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "steel-processing",
        order = "oc[basic-steel-gear-wheel-casting]",
        results = {
            {type="item", name = "steel-gear-wheel", amount = 15 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-steel-beam-casting",
        energy_required = 20,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-steel", amount = 750},
            {type="fluid", name = "water", amount = 3000},
        },
        icon = "__environtorio__/graphics/icons/basic-steel-beam-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "steel-processing",
        order = "oc[basic-steel-beam-casting]",
        results = {
            {type="item", name = "steel-beam", amount = 15 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-steel-pipe-casting",
        energy_required = 1,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-steel", amount = 100},
            {type="fluid", name = "water", amount = 200},
        },
        icon = "__environtorio__/graphics/icons/basic-steel-pipe-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "steel-processing",
        order = "oc[basic-steel-pipe-casting]",
        results = {
            {type="item", name = "kr-steel-pipe", amount = 4 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-steel-pipe-to-ground-casting",
        energy_required = 5,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-steel", amount = 375},
            {type="fluid", name = "water", amount = 500},
        },
        icon = "__environtorio__/graphics/icons/basic-steel-pipe-to-ground-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "steel-processing",
        order = "oc[basic-steel-pipe-to-ground-casting]",
        results = {
            {type="item", name = "kr-steel-pipe-to-ground", amount = 2 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-rare-metals-casting",
        energy_required = 16,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-rare-metals", amount = 250},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-rare-metals-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "rare-metals-processing",
        order = "oc[basic-rare-metals-casting]",
        results = {
            {type="item", name = "rare-metals", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-imersium-plate-casting",
        energy_required = 16,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-imersium", amount = 250},
            {type="fluid", name = "water", amount = 1000},
        },
        icon = "__environtorio__/graphics/icons/basic-imersium-plate-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "imersium-processing",
        order = "og[basic-imersium-plate-casting]",
        results = {
            {type="item", name = "imersium-plate", amount = 10 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-imersium-gear-wheel-casting",
        energy_required = 10,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-imersium", amount = 375},
            {type="fluid", name = "water", amount = 1500},
        },
        icon = "__environtorio__/graphics/icons/basic-imersium-gear-wheel-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "imersium-processing",
        order = "og[basic-imersium-gear-wheel-casting]",
        results = {
            {type="item", name = "imersium-gear-wheel", amount = 15 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-imersium-beam-casting",
        energy_required = 20,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-imersium", amount = 750},
            {type="fluid", name = "water", amount = 3000},
        },
        icon = "__environtorio__/graphics/icons/basic-imersium-beam-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "imersium-processing",
        order = "og[basic-imersium-beam-casting]",
        results = {
            {type="item", name = "imersium-beam", amount = 15 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-plastic-casting",
        energy_required = 2,
        enabled = false,
        category = "casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "liquid-plastic", amount = 20},
            {type="fluid", name = "water", amount = 200},
        },
        icon = "__environtorio__/graphics/icons/basic-imersium-beam-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "og[basic-plastic-casting]",
        results = {
            {type="item", name = "plastic-bar", amount = 4 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-inserter-parts-casting",
        energy_required = 2,
        enabled = true,
        category = "advanced-casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "water", amount = 200, fluidbox_index = 1},
            {type="fluid", name = "molten-iron", amount = 300, fluidbox_index = 3},
        },
        icon = "__environtorio__/graphics/icons/advanced-inserter-parts-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "advanced-casting",
        order = "og[advanced-inserter-parts-casting]",
        results = {
            {type="item", name = "inserter-parts", amount = 4 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-automation-core-casting",
        energy_required = 2,
        enabled = true,
        category = "advanced-casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "water", amount = 400, fluidbox_index = 1},
            {type="fluid", name = "molten-iron", amount = 300, fluidbox_index = 2},
            {type="fluid", name = "molten-copper", amount = 150, fluidbox_index = 4},
        },
        icon = "__environtorio__/graphics/icons/advanced-automation-core-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "advanced-casting",
        order = "og[advanced-automation-core-casting]",
        results = {
            {type="item", name = "automation-core", amount = 4 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-engine-unit-casting",
        energy_required = 10,
        enabled = true,
        category = "advanced-casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "water", amount = 500, fluidbox_index = 1},
            {type="fluid", name = "molten-iron", amount = 150, fluidbox_index = 3},
        },
        icon = "__environtorio__/graphics/icons/advanced-engine-unit-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "advanced-casting",
        order = "og[advanced-engine-unit-casting]",
        results = {
            {type="item", name = "engine-unit", amount = 2 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-electronic-components-casting",
        energy_required = 2,
        enabled = true,
        category = "advanced-casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "water", amount = 400, fluidbox_index = 1},
            {type="fluid", name = "molten-glass", amount = 50, fluidbox_index = 2},
            {type="fluid", name = "liquid-plastic", amount = 10, fluidbox_index = 3},
            {type="fluid", name = "molten-silicon", amount = 50, fluidbox_index = 4},
        },
        icon = "__environtorio__/graphics/icons/advanced-electronic-components-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "advanced-casting",
        order = "og[advanced-electronic-components-casting]",
        results = {
            {type="item", name = "electronic-components", amount = 6 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-low-density-structure-casting",
        energy_required = 20,
        enabled = true,
        category = "advanced-casting",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "water", amount = 400, fluidbox_index = 1},
            {type="fluid", name = "molten-steel", amount = 50, fluidbox_index = 2},
            {type="fluid", name = "liquid-plastic", amount = 25, fluidbox_index = 3},
            {type="fluid", name = "molten-copper", amount = 250, fluidbox_index = 4},
        },
        icon = "__environtorio__/graphics/icons/advanced-low-density-structure-casting.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "advanced-casting",
        order = "og[advanced-low-density-structure-casting]",
        results = {
            {type="item", name = "low-density-structure", amount = 2 },
        },
        main_product = "",
    },
}