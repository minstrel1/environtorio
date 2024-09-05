if not mods["Krastorio2"] then
    return
end

data.raw["assembling-machine"]["kr-advanced-assembling-machine"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics-processing"}

--data.raw.recipe["automation-core"].category = "electronics-processing"
data.raw.recipe["electronic-components"].category = "electronics-processing"
data.raw.recipe["energy-control-unit"].category = "electronics-processing"
data.raw.recipe["ai-core"].category = "electronics-processing"

table.insert(data.raw.technology["plastics"].unit.ingredients, {"logistic-science-pack", 1})
table.insert(data.raw.technology["plastics"].prerequisites, "basic-metallurgy")
table.insert(data.raw.technology["plastics"].effects, {type = "unlock-recipe", recipe = "basic-plastic-casting"})

data.raw["recipe"]["plastic-bar"].results = {{type="fluid", name = "liquid-plastic", amount = 10},}