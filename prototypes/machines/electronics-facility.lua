
-- copy the assembling machine 3 prototype

local electronics_facility_item = table.deepcopy(data.raw["item"]["assembling-machine-3"])

electronics_facility_item.name = "electronics-facility"
electronics_facility_item.place_result = "electronics-facility"
electronics_facility_item.order = "c[electronics-facility]"

data:extend{electronics_facility_item}

local electronics_facility = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])

electronics_facility.name = "electronics-facility"
electronics_facility.crafting_speed = 2.5
electronics_facility.base_productivity = 0.5
electronics_facility.module_specification = {
    module_slots = 5
}

electronics_facility.energy_usage = "500kW"
electronics_facility.energy_source.emissions_per_minute = 10

electronics_facility.animation.layers[1].scale = (4.0 / 3.0)
electronics_facility.animation.layers[1].hr_version.scale = (4.0 / 3.0) * 0.5
electronics_facility.animation.layers[2].scale = (4.0 / 3.0)
electronics_facility.animation.layers[2].hr_version.scale = (4.0 / 3.0) * 0.5

electronics_facility.fluid_boxes[1].pipe_connections[1].position = {0.5, -2.5}
table.insert(electronics_facility.fluid_boxes[1].pipe_connections, {type="input", position = {-0.5, 2.5}})
electronics_facility.fluid_boxes[2].pipe_connections[1].position = {2.5, 0.5}
table.insert(electronics_facility.fluid_boxes[2].pipe_connections, {type="output", position = {-2.5, -0.5}})

electronics_facility.collision_box = {{-1.7, -1.7}, {1.7, 1.7}}
electronics_facility.selection_box = {{-2, -2}, {2, 2}}

electronics_facility.crafting_categories = {"electronics-processing"}

electronics_facility.minable = {mining_time = 0.1, result = "electronics-facility"}

local recipe = {
    type = "recipe",
    name = "electronics-facility",
    enabled = true,
    energy_required = 15,
    ingredients = {{"processing-unit", 25}, {"steel-gear-wheel", 20}, {"assembling-machine-3", 2}},
    result = "electronics-facility",
    requester_paste_multiplier = 5
}

data:extend{electronics_facility, recipe}