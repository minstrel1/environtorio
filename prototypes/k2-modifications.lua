if not mods["Krastorio2"] then
    return
end

data.raw["assembling-machine"]["kr-advanced-assembling-machine"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics-processing"}

--data.raw.recipe["automation-core"].category = "electronics-processing"
data.raw.recipe["electronic-components"].category = "electronics-processing"
data.raw.recipe["energy-control-unit"].category = "electronics-processing"
data.raw.recipe["ai-core"].category = "electronics-processing"