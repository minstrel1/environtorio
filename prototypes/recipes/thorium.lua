data:extend{
    {
        type = "recipe",
        name = "thorium-powder-crushing",
        category = "crushing",
        hide_from_player_crafting = false,
        always_show_made_in = true,
        allow_as_intermediate = false,
        allow_intermediates = false,
        always_show_products = true,
        energy_required = 5,
        enabled = false,
        allow_productivity = true,
        ingredients = {
          { "thorium-ore", 3 },
        },
        results = {
          { type = "item", name = "thorium-powder", amount_min = 6, amount_max = 12 },
        },
    },
    {
        type = "recipe",
        name = "thorium-pellet-processing",
        energy_required = 20,
        enabled = false,
        category = "thorium-processing",
        always_show_made_in = true,
        ingredients = {
            { "thorium-powder", 20 },
            { "sulfur", 10}
        },
        icon = "__base__/graphics/icons/uranium-processing.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "intermediate-product",
        order = "k[thorium-pellet-processing]",
        results = {
            {name = "thorium-pellets", amount = 10 },
            {name = "sand", amount = 5 }
        },
    },
    {
        type = "recipe",
        name = "thorium-fuel-rod",
        energy_required = 5,
        enabled = false,
        ingredients = {
            { "thorium-pellets", 10 },
            { "steel-plate", 20}
        },
        result = "thorium-fuel-rod",
        result_amount = 4
    },
}