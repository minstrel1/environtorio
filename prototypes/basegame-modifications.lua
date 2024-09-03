
data.raw["item-subgroup"]["barrel"].order = "v"
data.raw["item-subgroup"]["fill-barrel"].order = "w"
data.raw["item-subgroup"]["empty-barrel"].order = "x"
data.raw["item-subgroup"]["intermediate-product"].order = "y"
data.raw["item-subgroup"]["science-pack"].order = "z"

data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "electronics-processing"}
data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics-processing"}
data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics-processing"}

data.raw["assembling-machine"]["centrifuge"].crafting_categories = {"centrifuging", "thorium-processing"}

data.raw.recipe["electronic-circuit"].category = "electronics-processing"
data.raw.recipe["advanced-circuit"].category = "electronics-processing"
data.raw.recipe["processing-unit"].category = "electronics-processing"
data.raw.recipe["electric-engine-unit"].category = "electronics-processing"
data.raw.recipe["flying-robot-frame"].category = "electronics-processing"
data.raw.recipe["rocket-control-unit"].category = "electronics-processing"
data.raw.recipe["copper-cable"].category = "electronics-processing"
--data.raw.recipe["battery"].category = "electronics-processing"

data.raw.recipe["speed-module"].category = "electronics-processing"
data.raw.recipe["speed-module-2"].category = "electronics-processing"
data.raw.recipe["speed-module-3"].category = "electronics-processing"

data.raw.recipe["productivity-module"].category = "electronics-processing"
data.raw.recipe["productivity-module-2"].category = "electronics-processing"
data.raw.recipe["productivity-module-3"].category = "electronics-processing"

data.raw.recipe["effectivity-module"].category = "electronics-processing"
data.raw.recipe["effectivity-module-2"].category = "electronics-processing"
data.raw.recipe["effectivity-module-3"].category = "electronics-processing"

table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "electronics-processing")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "electronics-processing")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "electronics-processing")

data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].rocket_render_layer_switch_distance = 15
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].full_render_layer_switch_distance = 15
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].effects_fade_in_start_distance = 15
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].effects_fade_in_end_distance = 15
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].rocket_launch_offset = {0, 15}
data.raw["rocket-silo-rocket"]["rocket-silo-rocket"].rocket_launch_offset = {0, 5}
