local math2d = require("__core__/lualib/math2d")

local boulder = {}

boulder.name = "boulder"

local function return_as_userdata (entity)
    return entity.surface.find_entity(entity.name, entity.position)
end

boulder.info = {
    frostnode_boulder = {
        boulder_name = "frostnode-boulder",
        patch_name = "frostnode-boulder-patch",
        effect_id = "frostnode-boulder-created",
    }
}

boulder.on_init = function ()
    boulder.verify_boulders()
end

boulder.verify_boulders = function ()
    global.boulders = global.boulders or {
        boulders = {},
        patches = {}, 
        patch_directions = {},
        boulder_connections = {},
        patch_connections = {},
    }
end

boulder.on_script_trigger_effect = function (event)
    
    --game.print("we got some sort of event " .. tostring(event.effect_id) .. " at " .. tostring(event.tick))
    local info = nil
    for _, table in pairs(boulder.info) do
        if event.effect_id == table.effect_id then
            info = table
        end
    end
    if info == nil then return end

    game.print("we made a fuckin " .. info.boulder_name)

    boulder.verify_boulders()

    local entity = event.source_entity

    local sub_entities = {}

    local positions = {{4, 0}, {0, 4}, {-4, 0}, {0, -4}}

    local directions = {defines.direction.east, defines.direction.south, defines.direction.west, defines.direction.north}

    for index, position in pairs(positions) do
        local new_position = math2d.position.add(entity.position, position)

        local boulder_spot = entity.surface.create_entity{
            name = info.patch_name,
            position = new_position, 
            raise_built = true,
            amount = 100000
        }
        --boulder_spot.initial_amouint = boulder_spot.amount

        local userdata = return_as_userdata(boulder_spot)

        table.insert(sub_entities, userdata)
        global.boulders.patch_directions[userdata] = directions[index]
    end

    local stupid_entity = return_as_userdata(entity)
    table.insert(global.boulders.boulders, stupid_entity)
    global.boulders.boulder_connections[stupid_entity] = sub_entities

    for k, v in pairs(sub_entities) do
        table.insert(global.boulders.patches, v)
        global.boulders.patch_connections[v] = stupid_entity
    end
end

boulder.events = {
    [defines.events.on_script_trigger_effect] = boulder.on_script_trigger_effect,
    on_init = boulder.on_init,
}

return boulder