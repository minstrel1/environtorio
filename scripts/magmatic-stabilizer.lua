local gui_utils = require("scripts/gui-utils")

function round (number)
    return math.floor(number + 0.5)
end

magmatic_stabilizer = {}

magmatic_stabilizer.stabilization_levels = {
    {
        eruption_chance = 0.5,
        target_energy_usage = 10,
        target_steam_usage = 80
    },
    {
        eruption_chance = 1.0 / 3.0 ,
        target_energy_usage = 25,
        target_steam_usage = 120
    },
    {
        eruption_chance = 0.25,
        target_energy_usage = 50,
        target_steam_usage = 160
    },
    {
        eruption_chance = 0.10,
        target_energy_usage = 75,
        target_steam_usage = 240
    },
    {
        eruption_chance = 0.05,
        target_energy_usage = 100,
        target_steam_usage = 320
    },
    {
        eruption_chance = 0.00,
        target_energy_usage = 150,
        target_steam_usage = 480
    },
}

magmatic_stabilizer.get_available_stabilization_levels = function (player_index)
    local player_force = game.get_player(player_index).force
    if player_force.technologies["perfected-magmacyte-extraction"].researched then
        return 6
    elseif player_force.technologies["advanced-magmacyte-extraction"].researched then
        return 5
    else
        return 3
    end
end

magmatic_stabilizer.verify_stabilizers = function () 
    global.magmatic_stabilizers = global.magmatic_stabilizers or {
        stabilizers = {},
        pumps = {},
        open_guis = {},
    }
end

magmatic_stabilizer.on_init = function()
    magmatic_stabilizer.verify_stabilizers()
end

magmatic_stabilizer.get_stabilizer_from_main = function (main)
    magmatic_stabilizer.verify_stabilizers()

    for k, v in pairs(global.magmatic_stabilizers.stabilizers) do
        if v.patch == main then
            return v
        end
    end
    return nil
end

magmatic_stabilizer.get_pumps_from_main = function (main)
    magmatic_stabilizer.verify_stabilizers()

    local results = {}

    for k, v in pairs(global.magmacyte.main_hole_connections) do
        if k == main then
            for k2, connection in pairs(v) do
                for k3, v3 in pairs(global.magmatic_stabilizers.pumps) do 
                    if k3 == connection then
                        table.insert(results, v3.main_entity.unit_number, v3)
                    end
                end
            end
            return results
        end
    end
    return results
end

magmatic_stabilizer.on_entity_created = function (event)
    if event.effect_id == "magmatic-stabilizer-created" then
        magmatic_stabilizer.on_magmatic_stabilizer_created(event)
    elseif event.effect_id == "magmacyte-pump-created" then 
        magmatic_stabilizer.on_magmactye_pump_created(event)
    end
end

magmatic_stabilizer.on_magmactye_pump_created = function (event)

    magmatic_stabilizer.verify_stabilizers()

    game.print("we made a magmacyte pump!")

    local entity = event.source_entity

    local targeted_patch = entity.surface.find_entity("magmacyte-geyser", entity.position)

    local linked_stabilizer = magmatic_stabilizer.get_stabilizer_from_main(magmacyte.get_main_from_geyser(targeted_patch))

    if linked_stabilizer then
        game.print("we found the stabilizer for it!")

        global.magmatic_stabilizers.pumps[targeted_patch] = {
            main_entity = entity,
            patch = targeted_patch,
            stabilizer = linked_stabilizer,
        }

        table.insert(linked_stabilizer.connected_pumps, entity.unit_number, global.magmatic_stabilizers.pumps[targeted_patch])

        entity.active = linked_stabilizer.activated
    else 
        game.print("we did not find a stabilizer...")

        global.magmatic_stabilizers.pumps[targeted_patch] = {
            main_entity = entity,
            patch = targeted_patch,
            stabilizer = nil,
        }

        entity.active = false
    end
end

magmatic_stabilizer.on_magmatic_stabilizer_created = function (event)

    magmatic_stabilizer.verify_stabilizers()

    game.print("we made a magmatic stabilizer!")

    local entity = event.source_entity

    local spawned_position = entity.position
    local spawned_force = entity.force
    local spawned_surface = entity.surface

    local targeted_patch = spawned_surface.find_entities_filtered{area = entity.bounding_box, name = "magmacyte-main-hole"}[1]

    local spawned_stabilizer = spawned_surface.create_entity{
        name = "magmatic-stabilizer",
        position = spawned_position,
        force = spawned_force,
        create_build_effect_smoke = false,
        raise_built = true
    }

    local spawned_tank = spawned_surface.create_entity{
        name = "magmatic-stabilizer-tank",
        position = spawned_position, 
        force = spawned_force,
        create_build_effect_smoke = false,
        raise_built = true
    }

    local pumps = magmatic_stabilizer.get_pumps_from_main(targeted_patch)

    global.magmatic_stabilizers.stabilizers[spawned_stabilizer.unit_number] = {
        main_entity = spawned_stabilizer,
        tank = spawned_tank,
        patch = targeted_patch,
        last_energy = spawned_stabilizer.energy,
        last_steam = spawned_tank.get_fluid_count("steam"),
        last_energy_draw = 0,
        last_steam_draw = 0,
        stabilization_level = 1,
        stability = 1.0,
        activated = false,
        auto_activate = false,
        duration_left = 0,
        connected_pumps = pumps,
    }

    local count = 0
    for _, pump_data in pairs(pumps) do
        pump_data.stabilizer = global.magmatic_stabilizers.stabilizers[spawned_stabilizer.unit_number]
        count = count + 1
    end
    game.print("we found " .. tostring(count) .. " connected pumps!")

    entity.destroy()

end

magmatic_stabilizer.on_destroyed_stabilizer = function (entity)
    if global.magmatic_stabilizers.stabilizers[entity.unit_number] then
        local data = global.magmatic_stabilizers.stabilizers[entity.unit_number]
        if data.tank and data.tank.valid then
            data.tank.destroy()
        end
        for _, pump in pairs(data.connected_pumps) do
            pump.stabilizer = nil
            pump.main_entity.active = false
        end
    end
    global.magmatic_stabilizers.stabilizers[entity.unit_number] = nil
    entity.destroy()
end

magmatic_stabilizer.on_destroyed_pump = function (entity)

    game.print("removing pump " .. tostring(entity.unit_number))

    local targeted_patch = entity.surface.find_entity("magmacyte-geyser", entity.position)

    for k, v in pairs(global.magmatic_stabilizers.pumps) do
        if k == targeted_patch then
            local stabilizer_data = v.stabilizer
            if stabilizer_data then
                if stabilizer_data.connected_pumps[entity.unit_number] then
                    stabilizer_data.connected_pumps[entity.unit_number] = nil
                end
            end
            global.magmatic_stabilizers.pumps[k] = nil
        end
    end
    entity.destroy()
end

magmatic_stabilizer.on_tick = function (event) 
    if global.magmatic_stabilizers then
        for _, data in pairs(global.magmatic_stabilizers.open_guis) do
            magmatic_stabilizer.update_gui(data)
        end
        for _, data in pairs(global.magmatic_stabilizers.stabilizers) do 
            magmatic_stabilizer.update_stabilizer(data)
        end
    end
end

magmatic_stabilizer.update_stabilizer = function (data) 
    local stabilization_level_data = magmatic_stabilizer.stabilization_levels[data.stabilization_level]

    data.last_energy = data.main_entity.energy

    if data.tank.fluidbox[1] then data.last_steam = data.tank.fluidbox[1].amount else data.last_steam = 0 end

    if data.activated and data.duration_left > 0 then

        data.duration_left = data.duration_left - 1

        local power_draw = (stabilization_level_data.target_energy_usage * math.pow(10, 6) / 60) + ((math.random() * 0.2) - 0.1)

        data.main_entity.energy = math.max(0, data.main_entity.energy - power_draw)

        local power_difference = data.last_energy - data.main_entity.energy

        data.last_energy_draw = power_difference

        local energy_satisfaction = power_difference / power_draw

        local steam_draw = (stabilization_level_data.target_steam_usage / 60)

        if data.tank.fluidbox[1] then
            local fluid = data.tank.fluidbox[1]
            fluid.amount = math.max(0.0001, fluid.amount - steam_draw)
            data.tank.fluidbox[1] = fluid

            local steam_difference = data.last_steam - fluid.amount

            data.last_steam_draw = steam_difference
        else
            data.last_steam_draw = 0
        end

        local steam_satisfaction = data.last_steam_draw / steam_draw

        if energy_satisfaction <= 0.9999 then
            --game.print("energy not fully satisfied")
            local missing = 1 - energy_satisfaction
            local stability_to_remove = missing / 60 / 30
            data.stability = data.stability - stability_to_remove
        end

        if steam_satisfaction <= 0.9999 then
            --game.print("steam not fully satisfied")
            local missing = 1 - steam_satisfaction
            local stability_to_remove = missing / 60 / 30
            data.stability = data.stability - stability_to_remove
        end
        data.stability = math.min(math.max(data.stability, 0), 1)

        if data.stability == 0 then
            data.activated = false
            magmatic_stabilizer.erupt(data)
        end

    elseif data.activated and data.duration_left <= 0 then

        data.activated = false
        data.main_entity.minable = true

        if math.random() < stabilization_level_data.eruption_chance then
            magmatic_stabilizer.erupt(data)
        end

        for k, v in pairs(data.connected_pumps) do
            v.main_entity.active = false
        end

    elseif data.activated == false then

        data.main_entity.energy = data.main_entity.energy - (((math.random() / 2.5) + 9.6) * math.pow(10, 6) / 60)

        local difference = data.last_energy - data.main_entity.energy

        data.last_energy_draw = difference

        data.last_steam_draw = 0

        if data.auto_activate then
            local charge = data.main_entity.energy / data.main_entity.electric_buffer_size
            
            local fluid_amount = data.tank.fluidbox[1] or {amount = 0}
            local fluid_total = data.tank.fluidbox.get_capacity(1)
            local fluid_percentage = fluid_amount.amount / fluid_total
            if fluid_percentage > 0.2 and charge > 0.2 then
                magmatic_stabilizer.activate_stabilizer(data)
            end
        end

    end
end

magmatic_stabilizer.erupt = function (data)
    data.main_entity.minable = false
    game.print("WE ARE SUPPOSED TO ERUPT!!!")
end

magmatic_stabilizer.activate_stabilizer = function (data)
    data.stability = 1
    data.activated = true
    data.duration_left = 72000
    for k, v in pairs(data.connected_pumps) do
        v.main_entity.active = true
    end
    data.main_entity.minable = false
end

magmatic_stabilizer.update_gui = function (data)
    local entity = data.entity
    if entity and entity.valid then
        --game.print("we have an entity")
        local stabilizer_data = global.magmatic_stabilizers.stabilizers[entity.unit_number]
        local stabilization_level_data = magmatic_stabilizer.stabilization_levels[stabilizer_data.stabilization_level]
        if stabilizer_data then
            --game.print("we have entity data")
            local refs = data.gui

            refs.stability_bar.value = stabilizer_data.stability
            refs.stability_bar.caption = round(stabilizer_data.stability * 100) .. "%"

            local charge = entity.energy / entity.electric_buffer_size
            refs.energy_bar.value = charge
            --refs.energy_bar.caption = round(charge * 100) .. "%"
            refs.energy_current_label_number.caption = string.format("%3d MW", round(stabilizer_data.last_energy_draw * 60 / math.pow(10, 6)))
            
            local fluid_amount = stabilizer_data.tank.fluidbox[1] or {amount = 0}
            local fluid_total = stabilizer_data.tank.fluidbox.get_capacity(1)
            local fluid_percentage = fluid_amount.amount / fluid_total
            refs.steam_bar.value = fluid_percentage
            refs.steam_bar_label_number.caption = tostring(round(fluid_amount.amount)) .. " / " .. tostring(round(fluid_total))
            refs.steam_current_label_number.caption = string.format("%3d Steam / s", round(stabilizer_data.last_steam_draw * 60))

            local minutes = math.floor(stabilizer_data.duration_left / 3600)
            local seconds = math.floor((stabilizer_data.duration_left % 3600) / 60)
            refs.time_remaining_label_number.caption = string.format("%02d:%02d", minutes, seconds)

            if stabilizer_data.activated then
                refs.activate_button.enabled = false
                refs.activate_button.caption = "In Progress..."
                refs.activate_button.tooltip = "The stabilizer cycle is currently running. Wait to change settings."

                refs.status_sprite.sprite = "utility/status_working"
                refs.status_label.caption = "Cycle In Progress..."

                refs.stabilization_level_slider.enabled = false
            else
                refs.stabilization_level_slider.enabled = true
                if fluid_percentage > 0.2 and charge > 0.2 then
                    refs.activate_button.enabled = true
                    refs.activate_button.caption = "Activate"
                    refs.activate_button.tooltip = "The stabilizer is ready to activate."

                    refs.status_sprite.sprite = "utility/status_yellow"
                    refs.status_label.caption = "Awaiting Activation"
                else
                    refs.activate_button.enabled = false
                    refs.activate_button.caption = "Insufficient"
                    refs.activate_button.tooltip = "The stabilizer needs to be at least 20% full of energy and steam in order to start."

                    refs.status_sprite.sprite = "utility/status_not_working"
                    refs.status_label.caption = "Insufficient Steam / Energy"
                end
            end

            local count = 0
            for _, _ in pairs(stabilizer_data.connected_pumps) do
                count = count + 1
            end

            refs.eruption_chance_label_number.caption = string.format("%3d",round(stabilization_level_data.eruption_chance * 100)) .. "%"

            refs.energy_target_label_number.caption = tostring(stabilization_level_data.target_energy_usage) .. " MW"

            refs.steam_target_label_number.caption = tostring(stabilization_level_data.target_steam_usage) .. " Steam / s"

            --refs.status_pump_count.caption = tostring(count) .. " Connected Pumps"
        end
    end
end

magmatic_stabilizer.create_gui = function (player, entity)

    local stabilizer_data = global.magmatic_stabilizers.stabilizers[entity.unit_number]

    local refs = {}

    local screen = player.gui.screen
    refs.main_frame = screen.add{type = "frame", name = "magmatic-stabilizer-gui", direction = "vertical"}
    refs.main_frame.auto_center = true

    gui_utils.add_titlebar(refs.main_frame, "Magmatic Stabilizer", "magmatic-stabilizer-close")

    refs.entity_frame = refs.main_frame.add{type = "frame", style = "entity_frame", direction = "vertical"}

    refs.status_flow = refs.entity_frame.add{type = "flow", style = "status_flow"}
    refs.status_flow.style.vertical_align = "center"

    refs.status_sprite = refs.status_flow.add{type = "sprite", style = "status_image", name = "magmatic-stabilizer-status-sprite", sprite = "utility/status_not_working" }
    refs.status_label = refs.status_flow.add{type = "label", name = "magmatic-stabilizer-status-label", caption = "Waiting for charge"}
    refs.status_pump_count = refs.status_flow.add{type = "label", name = "magmatic-stabilizer-pump-label", caption = ""}

    refs.entity_preview_frame = refs.entity_frame.add{type = "frame", style = "deep_frame_in_shallow_frame"}
    refs.entity_preview = refs.entity_preview_frame.add{type = "entity-preview", style = "wide_entity_button", style_mods = { vertical_align = "center" }}
    refs.entity_preview.entity = entity
    refs.entity_preview.visible = true

    refs.entity_frame.add{type="line"}

    refs.stability_frame = refs.entity_frame.add{type = "flow", direction = "horizontal", style = "player_input_horizontal_flow"}

    refs.stability_frame.add{type = "label", caption = "Stability"}

    refs.stability_bar = refs.stability_frame.add{type = "progressbar", style = "production_progressbar"}
    refs.stability_bar.style.horizontally_stretchable = true
    refs.stability_bar.value = 0
    refs.stability_bar.caption = "0%"

    refs.activate_button = refs.stability_frame.add{type = "button", name = "magmatic-stabilizer-activate-button", caption = "Activate"}

    refs.slider_frame = refs.entity_frame.add{type = "flow", direction = "vertical", style = "vertical_flow"}
    refs.slider_frame.style.horizontal_align = "center"
    refs.slider_frame.style.horizontally_stretchable = true

    refs.slider_flow = refs.slider_frame.add{type = "flow", direction = "horizontal", style = "player_input_horizontal_flow"}
    refs.slider_flow.style.horizontal_spacing = 4

    refs.stabilization_level_slider = refs.slider_flow.add{type="slider", name = "magmatic-stabilizer-level-selector", value = stabilizer_data.stabilization_level, minimum_value=1, maximum_value = magmatic_stabilizer.get_available_stabilization_levels(player.index), style="notched_slider"}
    refs.stabilization_level_label = refs.slider_flow.add{type = "label", name = "magmatib-stabilizer-level-label", caption = "Stabilization Level:", style = "description_property_name_label"}
    refs.stabilization_level_label_number = refs.slider_flow.add{type = "label", name = "magmatib-stabilizer-level-label-number", caption = tostring(stabilizer_data.stabilization_level)}
    refs.auto_activate_checkbox = refs.slider_flow.add{type = "checkbox", name = "magmatic-stabilizer-autoactivate", caption = "Auto-activate", state = stabilizer_data.auto_activate, tooltip = "When enabled, activates the stabilizer as soon as there is at least 20% energy and steam."}

    refs.slider_frame_lower = refs.slider_frame.add{type = "flow", direction = "horizontal", style = "player_input_horizontal_flow"}

    refs.eruption_chance_label = refs.slider_frame_lower.add{type = "label", name = "magmatic-stabilizer-eruption-label", caption = "Eruption Chance:", tooltip = "The chance for the magmacyte well to erupt at the end of the cycle. Higher tiers of stabilization reduce this chance.", style = "description_property_name_label"}
    refs.eruption_chance_label_number = refs.slider_frame_lower.add{type = "label", name = "magmatic-stabilizer-eruption-label-number", caption = "50%", tooltip = "The chance for the magmacyte well to erupt at the end of the cycle. Higher tiers of stabilization reduce this chance."}

    refs.time_remaining_label = refs.slider_frame_lower.add{type = "label", name = "magmatic-stabilizer-time-remaining", caption = "Time Remaining:", tooltip = "The amount of time left in the stabilization cycle. When the cycle ends, there is a chance for the magmacyte well to erupt.", style = "description_property_name_label"}
    refs.time_remaining_label_number = refs.slider_frame_lower.add{type = "label", name = "magmatic-stabilizer-time-remaining-number", caption = "00:00", tooltip = "The amount of time left in the stabilization cycle. When the cycle ends, there is a chance for the magmacyte well to erupt."}

    refs.entity_frame.add{type="line"}

    refs.lower_frame = refs.entity_frame.add{type = "flow", style = "player_input_horizontal_flow", direction = "horizontal"}

    refs.energy_usage_frame = refs.lower_frame.add{type = "flow", direction = "vertical", style = "vertical_flow"}

    refs.energy_bar_flow = refs.energy_usage_frame.add{type = "flow", style = "vertical_flow", direction = "vertical"}
    
    refs.energy_bar_label_flow = refs.energy_bar_flow.add{type = "flow", style = "horizontal_flow", direction = "horizontal"}
    refs.energy_bar_label = refs.energy_bar_label_flow.add{type = "label", caption = "Electricity:", style = "description_property_name_label"}
    refs.energy_bar_label_number = refs.energy_bar_label_flow.add{type = "label", caption = "0.0 GJ of 5.0 GJ"}

    refs.energy_bar = refs.energy_bar_flow.add{type = "progressbar", name = "magmatic-stabilizer-energy-usage-bar"}
    refs.energy_bar.style.horizontally_stretchable = true

    refs.energy_current_flow = refs.energy_usage_frame.add{type = "flow", direciton = "horizontal", style = "player_input_horizontal_flow"}
    refs.energy_current_label = refs.energy_current_flow.add{type = "label", name = "magmatic-stabilizer-energy-current-label", caption = "Current Usage:", style = "description_property_name_label"}
    refs.energy_current_empty = refs.energy_current_flow.add{type = "empty-widget"}
    refs.energy_current_empty.style.horizontally_stretchable = true
    refs.energy_current_label_number = refs.energy_current_flow.add{type = "label", name = "magmatic-stabilizer-energy-current-label-number", caption = "0 MW"}

    refs.energy_target_flow = refs.energy_usage_frame.add{type = "flow", direciton = "horizontal", style = "player_input_horizontal_flow"}
    refs.energy_target_label = refs.energy_target_flow.add{type = "label", name = "magmatic-stabilizer-energy-target-label", caption = "Target Usage:", style = "description_property_name_label"}
    refs.energy_target_empty = refs.energy_target_flow.add{type = "empty-widget"}
    refs.energy_target_empty.style.horizontally_stretchable = true
    refs.energy_target_label_number = refs.energy_target_flow.add{type = "label", name = "magmatic-stabilizer-energy-target-label-number", caption = "10 MW"}

    refs.lower_frame.add{type="line", direction = "vertical"}

    refs.steam_usage_frame = refs.lower_frame.add{type = "flow", direction = "vertical", style = "vertical_flow"}
    --refs.steam_usage_frame.horizontally_stretchable = true

    refs.steam_bar_flow = refs.steam_usage_frame.add{type = "flow", style = "vertical_flow", direction = "vertical"}
    
    refs.steam_bar_label_flow = refs.steam_bar_flow.add{type = "flow", style = "horizontal_flow", direction = "horizontal"}
    refs.steam_bar_label = refs.steam_bar_label_flow.add{type = "label", caption = "Steam:", style = "description_property_name_label"}
    refs.steam_bar_label_number = refs.steam_bar_label_flow.add{type = "label", caption = "0 / 10000"}

    refs.steam_bar = refs.steam_bar_flow.add{type = "progressbar", name = "magmatic-stabilizer-steam-usage-bar"}
    refs.steam_bar.style.horizontally_stretchable = true
    refs.steam_bar.style.color = {0.5, 0.5, 0.5}

    refs.steam_current_flow = refs.steam_usage_frame.add{type = "flow", direciton = "horizontal", style = "player_input_horizontal_flow"}
    refs.steam_current_label = refs.steam_current_flow.add{type = "label", name = "magmatic-stabilizer-steam-current-label", caption = "Current Usage:", style = "description_property_name_label"}
    refs.steam_current_empty = refs.steam_current_flow.add{type = "empty-widget"}
    refs.steam_current_empty.style.horizontally_stretchable = true
    refs.steam_current_label_number = refs.steam_current_flow.add{type = "label", name = "magmatic-stabilizer-steam-current-label-number", caption = "0 Steam / second"}

    refs.steam_target_flow = refs.steam_usage_frame.add{type = "flow", direciton = "horizontal", style = "player_input_horizontal_flow"}
    refs.steam_target_label = refs.steam_target_flow.add{type = "label", name = "magmatic-stabilizer-steam-target-label", caption = "Target Usage:", style = "description_property_name_label"}
    refs.steam_target_empty = refs.steam_target_flow.add{type = "empty-widget"}
    refs.steam_target_empty.style.horizontally_stretchable = true
    refs.steam_target_label_number = refs.steam_target_flow.add{type = "label", name = "magmatic-stabilizer-steam-target-label-number", caption = "80 Steam / second"}

    refs.main_frame.force_auto_center()
    player.opened = refs.main_frame

    global.magmatic_stabilizers.open_guis[player.index] = {
        gui = refs,
        entity = entity
    }
end

magmatic_stabilizer.destroy_gui = function (player_index) 
    if global.magmatic_stabilizers.open_guis[player_index] then
        global.magmatic_stabilizers.open_guis[player_index].gui.main_frame.destroy()
        global.magmatic_stabilizers.open_guis[player_index] = nil
    end
end

magmatic_stabilizer.on_gui_opened = function (event) 
    local entity = event.entity

    if entity and entity.valid then

        local player = game.get_player(event.player_index)
        if entity.name == "magmatic-stabilizer" then
            magmatic_stabilizer.create_gui(player, entity)
        end
    end
end

magmatic_stabilizer.on_gui_closed = function (event) 
    if event.element and event.element.valid and event.element.name == "magmatic-stabilizer-gui" then
        magmatic_stabilizer.destroy_gui(event.player_index)
    end
end

magmatic_stabilizer.on_gui_click = function (event)
    if event.element.name == "magmatic-stabilizer-close" then
        magmatic_stabilizer.destroy_gui(event.player_index)
    elseif event.element.name == "magmatic-stabilizer-activate-button" then
        local gui_data = global.magmatic_stabilizers.open_guis[event.player_index]
        local stabilizer_data = global.magmatic_stabilizers.stabilizers[gui_data.entity.unit_number]
        magmatic_stabilizer.activate_stabilizer(stabilizer_data)
    elseif event.element.name == "magmatic-stabilizer-autoactivate" then
        local gui_data = global.magmatic_stabilizers.open_guis[event.player_index]
        local stabilizer_data = global.magmatic_stabilizers.stabilizers[gui_data.entity.unit_number]
        stabilizer_data.auto_activate = event.element.state 
    end
end

magmatic_stabilizer.on_gui_value_changed = function (event)
    if event.element.name == "magmatic-stabilizer-level-selector" then
        local refs = global.magmatic_stabilizers.open_guis[event.player_index].gui
        local stabilization_data = magmatic_stabilizer.stabilization_levels[event.element.slider_value]

        global.magmatic_stabilizers.stabilizers[global.magmatic_stabilizers.open_guis[event.player_index].entity.unit_number].stabilization_level = event.element.slider_value

        refs.stabilization_level_label_number.caption = tostring(event.element.slider_value)
    end
end

magmatic_stabilizer.events = {
    [defines.events.on_script_trigger_effect] = magmatic_stabilizer.on_entity_created,
    [defines.events.on_tick] = magmatic_stabilizer.on_tick,
    [defines.events.on_gui_opened] = magmatic_stabilizer.on_gui_opened,
    [defines.events.on_gui_click] = magmatic_stabilizer.on_gui_click,
    [defines.events.on_gui_closed] = magmatic_stabilizer.on_gui_closed,
    [defines.events.on_gui_value_changed] = magmatic_stabilizer.on_gui_value_changed,
}

return magmatic_stabilizer
