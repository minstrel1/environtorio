local recipes = {
    "thorium-pellet-processing",
    "basic-iron-melting",
    "basic-copper-melting",
    "basic-rare-metals-melting",
    "advanced-glass-melting",
    "basic-steel-infusing",
    "basic-imersium-infusing",
    "basic-copper-plate-casting",
    "basic-copper-cable-casting",
    "basic-iron-plate-casting",
    "basic-iron-gear-casting",
    "basic-iron-beam-casting",
    "basic-iron-stick-casting",
    "basic-steel-plate-casting",
    "basic-steel-gear-casting",
    "basic-steel-beam-casting",
    "basic-imersium-plate-casting",
    "basic-imersium-gear-casting",
    "basic-imersium-beam-casting",
    "advanced-glass-casting"
}

for _, v in pairs(recipes) do
    if data.raw["module"]["productivity-module"].limitation then
        table.insert(data.raw["module"]["productivity-module"].limitation, v)
    end
    if data.raw["module"]["productivity-module-2"].limitation then
        table.insert(data.raw["module"]["productivity-module-2"].limitation, v)
    end
    if data.raw["module"]["productivity-module-3"].limitation then
        table.insert(data.raw["module"]["productivity-module-3"].limitation, v)
    end
end