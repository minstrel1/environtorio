data:extend{
    {
        type = "recipe",
        name = "magmacyte-filtration",
        energy_required = 20,
        enabled = false,
        category = "fluid-filtration",
        always_show_made_in = true,
        ingredients = {
            {type="fluid", name = "unrefined-magmacyte", amount = 300}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "magmacyte-processing",
        order = "oa[magmacyte-filtration]",
        results = {
            {type="fluid", name = "magmatic-precursor", amount = 200 },
            { type = "item", name = "volcanic-slag", amount_min = 8, amount_max = 20 },
        },
        crafting_machine_tint = {
            primary = { r = 0.722, g = 0.341, b = 0.2, a = 0.8 }, 
            secondary = { r = 0.98, g = 0.294, b = 0.043, a = 1.0 }, 
          },
        main_product = "",
    },
    {
        type = "recipe",
        name = "magmatic-precursor-infusing",
        energy_required = 20,
        enabled = false,
        category = "metallurgic-infusing",
        always_show_made_in = true,
        ingredients = {
            {type="item", name = "coke", amount = 2},
            {type="fluid", name = "magmatic-precursor", amount = 200}
        },
        icon = "__environtorio__/graphics/icons/molten-metal.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "magmacyte-processing",
        order = "ob[magmacyte-processing]",
        results = {
            {type="fluid", name = "magmacyte", amount = 200 },
        },
        main_product = "",
    },
}