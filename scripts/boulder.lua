local boulder = {}

boulder.name = "boulder"

boulder.info = {
    frostnode_boulder = {
        boulder_name = "frostnode-boulder",
        patch_name = "frostnode-boulder-patch",
        effect_id = "frostnode-boulder-created",
    }
}

boulder.on_init = function ()
    global.boulders = global.boulders or {
        boulders = {},
        patches = {}, 
        boulder_connections = {},
        patch_connections = {},
    }
end

boulder.on_script_trigger_effect = function (event)
    
    game.print("we got some sort of event " .. tostring(event.effect_id) .. " at " .. tostring(event.tick))
    local info = nil
    for _, table in pairs(boulder.info) do
        if event.effect_id == table.effect_id then
            info = table
        end
    end
    if info == nil then return end

    game.print("we made a fuckin " .. info.boulder_name)
end

boulder.events = {
    [defines.events.on_script_trigger_effect] = boulder.on_script_trigger_effect,
    on_init = boulder.on_init,
}

return boulder