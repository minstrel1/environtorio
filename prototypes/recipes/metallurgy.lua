data:extend{
    {
        type = "recipe",
        name = "basic-iron-melting",
        energy_required = 24,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "iron-ore", amount = 40},
            {type="fluid", name = "oxygen", amount = 300}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "ma[basic-iron-melting]",
        results = {
            {type="fluid", name = "molten-iron", amount = 750 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-copper-melting",
        energy_required = 24,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "copper-ore", amount = 40},
            {type="fluid", name = "oxygen", amount = 300}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "copper-processing",
        order = "ma[basic-copper-melting]",
        results = {
            {type="fluid", name = "molten-copper", amount = 750 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-rare-metals-melting",
        energy_required = 24,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "raw-rare-metals", amount = 40},
            {type="fluid", name = "oxygen", amount = 300}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "rare-metals-processing",
        order = "ma[basic-rare-metals-melting]",
        results = {
            {type="fluid", name = "molten-rare-metals", amount = 750 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-iron-melting",
        energy_required = 24,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "iron-ore", amount = 40},
            {type="fluid", name = "oxygen", amount = 300},
            {type="fluid", name = "magmacyte", amount = 40},
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "iron-processing",
        order = "mb[advanced-iron-melting]",
        results = {
            {type="fluid", name = "molten-iron", amount = 1000 },
        },
        main_product = ""
    },
    {
        type = "recipe",
        name = "advanced-copper-melting",
        energy_required = 24,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "copper-ore", amount = 40},
            {type="fluid", name = "oxygen", amount = 300},
            {type="fluid", name = "magmacyte", amount = 40},
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "copper-processing",
        order = "mb[advanced-copper-melting]",
        results = {
            {type="fluid", name = "molten-copper", amount = 1000 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-rare-metals-melting",
        energy_required = 24,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "raw-rare-metals", amount = 40},
            {type="fluid", name = "oxygen", amount = 300},
            {type="fluid", name = "magmacyte", amount = 40},
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "rare-metals-processing",
        order = "mb[advanced-rare-metals-melting]",
        results = {
            {type="fluid", name = "molten-rare-metals", amount = 1000 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-steel-infusing",
        energy_required = 12,
        enabled = false,
        category = "metallurgic-infusing",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "coke", amount = 4},
            {type="fluid", name = "molten-iron", amount = 250}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "steel-processing",
        order = "oa[basic-steel-infusing]",
        results = {
            {type="fluid", name = "molten-steel", amount = 125 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "basic-imersium-infusing",
        energy_required = 12,
        enabled = false,
        category = "metallurgic-infusing",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "imersite-powder", amount = 10},
            {type="fluid", name = "molten-rare-metals", amount = 250}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "imersium-processing",
        order = "oa[basic-imersium-infusing]",
        results = {
            {type="fluid", name = "molten-imersium", amount = 250 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-silicon-purification",
        energy_required = 12,
        enabled = false,
        category = "fluid-filtration",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "molten-glass", amount = 250}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "sand-processing",
        order = "ob[advanced-silicon-purification]",
        results = {
            {type="fluid", name = "molten-silicon", amount = 250 },
        },
        main_product = "",
    },
    {
        type = "recipe",
        name = "advanced-glass-melting",
        energy_required = 10,
        enabled = false,
        category = "metallurgy",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "sand", amount = 20},
            {type="fluid", name = "oxygen", amount = 125}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "sand-processing",
        order = "oa[advanced-glass-melting]",
        results = {
            {type="fluid", name = "molten-glass", amount = 200 },
        },
        main_product = "",
    },
}
