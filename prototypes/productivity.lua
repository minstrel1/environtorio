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
    "basic-iron-gear-wheel-casting",
    "basic-iron-beam-casting",
    "basic-iron-stick-casting",
    "basic-pipe-casting",
    "basic-pipe-to-ground-casting",
    "basic-steel-plate-casting",
    "basic-steel-gear-wheel-casting",
    "basic-steel-beam-casting",
    "basic-steel-pipe-casting",
    "basic-steel-pipe-to-ground-casting",
    "basic-imersium-plate-casting",
    "basic-imersium-gear-wheel-casting",
    "basic-imersium-beam-casting",
    "basic-glass-casting",
    "basic-silicon-casting",
    "basic-plastic-casting",
    "advanced-low-density-structure-casting",
    "advanced-electronic-components-casting",
    "advanced-engine-unit-casting",
    "advanced-automation-core-casting",
    "advanced-inserter-parts-casting",
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