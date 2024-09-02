
thorium_ore_spawn = require("scripts/thorium-ore-spawn")
magmacyte = require("scripts/magmacyte")
magmatic_stabilizer = require("scripts/magmatic-stabilizer")

caster = require("scripts/caster")

require("scripts/informatron")

script.on_init(function()

    thorium_ore_spawn.on_init()
    magmacyte.on_init()
    magmatic_stabilizer.on_init()
    caster.on_init()

end)

script.on_event(
    {
        defines.events.on_built_entity,
        defines.events.on_robot_built_entity,
        defines.events.script_raised_built,
        defines.events.script_raised_revive,
    },
    function (event)
        on_built_entity(event)
    end
)

script.on_event(
    {
        defines.events.on_entity_died,
        defines.events.on_pre_player_mined_item,
        defines.events.on_robot_pre_mined,
        defines.events.script_raised_destroy
    },
    function (event)
        on_destroyed_entity(event)
    end
)

    -- [defines.events.on_gui_opened] = magmatic_stabilizer.on_gui_opened,
    -- [defines.events.on_gui_click] = magmatic_stabilizer.on_gui_click,
    -- [defines.events.on_gui_closed] = magmatic_stabilizer.on_gui_closed,
    -- [defines.events.on_gui_value_changed] = magmatic_stabilizer.on_gui_value_changed,

script.on_event(
    {
        defines.events.on_script_trigger_effect
    },
    function (event)
        if event.effect_id == "caster-created" then
            caster.on_built_entity(event)
        elseif event.effect_id == "magmacyte-main-hole-created" then
            magmacyte.on_main_hole_generated(event)
        elseif event.effect_id == "magmatic-stabilizer-created" then
            magmatic_stabilizer.on_magmatic_stabilizer_created(event)
        elseif event.effect_id == "magmacyte-pump-created" then 
            magmatic_stabilizer.on_magmactye_pump_created(event)
        end
    end
)

script.on_event(
    {
        defines.events.on_tick
    },
    function (event)
        magmatic_stabilizer.on_tick(event)
    end
)


script.on_event(
    {
        defines.events.on_gui_opened
    },
    function (event)
        magmatic_stabilizer.on_gui_opened(event)
    end
)


script.on_event(
    {
        defines.events.on_gui_click
    },
    function (event)
        magmatic_stabilizer.on_gui_click(event)
    end
)


script.on_event(
    {
        defines.events.on_gui_closed
    },
    function (event)
        magmatic_stabilizer.on_gui_closed(event)
    end
)

script.on_event(
    {
        defines.events.on_gui_value_changed
    },
    function (event)
        magmatic_stabilizer.on_gui_value_changed(event)
    end
)



function on_built_entity (event) 

    if not event["created_entity"] then
        return
    end

    if event["created_entity"].name == "caster" then

    end
end

function on_destroyed_entity (event) 

    if not event["entity"] then
        return
    end

    if event["entity"].name == "thorium-rock" then
        thorium_ore_spawn.on_destroyed_entity(event.entity)
    elseif event["entity"].name == "caster" then
        caster.on_destroyed_entity(event.entity)
    elseif event["entity"].name == "magmatic-stabilizer" then
        magmatic_stabilizer.on_destroyed_stabilizer(event.entity)
    elseif event["entity"].name == "magmacyte-pump" then
        magmatic_stabilizer.on_destroyed_pump(event.entity)
    end
    
end
