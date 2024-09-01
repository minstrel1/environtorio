
local handler = require "__core__.lualib.event_handler"

thorium_ore_spawn = require("scripts/thorium-ore-spawn")
magmacyte = require("scripts/magmacyte")
magmatic_stabilizer = require("scripts/magmatic-stabilizer")

caster = require("scripts/caster")

require("scripts/informatron")

handler.add_libraries{
    caster,
    magmacyte,
    magmatic_stabilizer
}


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

script.on_event(
    {
        defines.events.on_player_created
    },
    function (event)
        
    end
)

function on_built_entity (event) 
    --game.print("boner")
    if not event["created_entity"] then
        return
    end

    if event["created_entity"].name == "caster" then
        --game.print("running caster on built")
        --caster.on_built_entity(event.created_entity)
    end
end

function on_destroyed_entity (event) 
    --game.print("boner2")
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
