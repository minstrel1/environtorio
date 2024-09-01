data:extend{
    {
        type = "technology",
        name = "thorium-processing",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/uranium-processing.png",
        effects =
        {
			{
				type = "unlock-recipe",
				recipe = "minifuge"
			},
			{
				type = "unlock-recipe",
				recipe = "thorium-powder-crushing"
			},
			{
				type = "unlock-recipe",
				recipe = "thorium-pellet-processing"
			},
			{
				type = "unlock-recipe",
				recipe = "thorium-fuel-rod"
			}
        },
        prerequisites = {"logistic-science-pack", "steel-processing", "sulfur-processing"},
        unit =
        {
          ingredients =
          {
            {"basic-tech-card", 1},
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 30,
          count = 200
        },
        order = "e-p-b-c"
    },
	{
        type = "technology",
        name = "basic-metallurgy",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/uranium-processing.png",
        effects =
        {
			{
				type = "unlock-recipe",
				recipe = "foundry"
			},
			{
				type = "unlock-recipe",
				recipe = "caster"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-iron-melting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-copper-melting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-rare-metals-melting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-iron-plate-casting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-iron-stick-casting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-iron-gear-casting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-iron-beam-casting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-copper-plate-casting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-copper-cable-casting"
			},
			{
				type = "unlock-recipe",
				recipe = "basic-rare-metals-casting"
			},
        },
        prerequisites = {"logistic-science-pack", "kr-steel-fluid-handling", "automation-2", "advanced-material-processing"},
        unit =
        {
          ingredients =
          {
            {"basic-tech-card", 1},
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 30,
          count = 200
        },
        order = "e-p-b-c"
    },
	{
        type = "technology",
        name = "advanced-melting",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/uranium-processing.png",
        effects =
        {
			{
				type = "unlock-recipe",
				recipe = "advanced-iron-melting"
			},
			{
				type = "unlock-recipe",
				recipe = "advanced-copper-melting"
			},
			{
				type = "unlock-recipe",
				recipe = "advanced-rare-metals-melting"
			},
        },
        prerequisites = {"logistic-science-pack", "kr-steel-fluid-handling", "automation-2", "advanced-material-processing"},
        unit =
        {
          ingredients =
          {
            {"basic-tech-card", 1},
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 30,
          count = 200
        },
        order = "e-p-b-c"
    },
	{
        type = "technology",
        name = "advanced-magmacyte-extraction",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/uranium-processing.png",
        effects =
        {

        },
        prerequisites = {"logistic-science-pack", "steel-processing", "sulfur-processing"},
        unit =
        {
          ingredients =
          {
            {"basic-tech-card", 1},
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 30,
          count = 200
        },
        order = "e-p-b-c"
    },
	{
        type = "technology",
        name = "perfected-magmacyte-extraction",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/uranium-processing.png",
        effects =
        {
			
        },
        prerequisites = {"logistic-science-pack", "steel-processing", "sulfur-processing"},
        unit =
        {
          ingredients =
          {
            {"basic-tech-card", 1},
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 30,
          count = 200
        },
        order = "e-p-b-c"
    },
	
}