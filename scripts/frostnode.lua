local math2d = require("__core__/lualib/math2d")

local frostnode = {}

frostnode.name = "frostnode"

local function return_as_userdata (entity)
    return entity.surface.find_entity(entity.name, entity.position)
end

frostnode.on_init = function ()

end

frostnode.verify_frostnode = function ()
    global.frostnode = global.frostnode or {
        sinkholes = {},
        boulders = {},
        sinkhole_connections = {},
        boulder_connections = {},
    }
end

frostnode.on_sinkhole_generated = function (event)
    
    if event.effect_id ~= "frostnode-sinkhole-created" then
        return
    end
    
    frostnode.verify_frostnode()

    game.print("we got a frostnode sinkhole!")

    local entity = event.source_entity

    local sub_entities = {}

    local boulders_to_spawn = 9

    local resource_scale = 1

    if entity.surface.map_gen_settings.autoplace_controls["frostnode-sinkhole"] ~= nil then
        local size = entity.surface.map_gen_settings.autoplace_controls["magmacyte-sinkhole"].size
        if size <= 0.5 then 
            boulders_to_spawn = 2
        elseif size < 1 then
            boulders_to_spawn = 3
        elseif size == 1 then
            boulders_to_spawn = 4
        elseif size <= 2 then
            boulders_to_spawn = 5
        elseif size <= 3 then
            boulders_to_spawn = 6
        elseif size <= 4 then
            boulders_to_spawn = 7
        elseif size <= 5 then
            boulders_to_spawn = 8
        elseif size <= 6 then
            boulders_to_spawn = 9
        end
    end

    --log(tostring(entity.surface.map_gen_settings.autoplace_controls))
    -- for k,v in pairs(entity.surface.map_gen_settings.autoplace_controls["copper-ore"]) do
    --     log(k)
    --     log(v)
    -- end

    local angles = {}
    local distances = {}

    for n = 0, boulders_to_spawn - 1, 1 do
        local num = n * (360 / boulders_to_spawn)
        num = num + math.random(-10, 10)
        table.insert(angles, num)
    end

    local starting_angle = math.random(-40, 40)

    for k, v in pairs(angles) do
        angles[k] = v + starting_angle
    end

    for k, v in pairs(angles) do
        log(v)
    end

    for n = 1, boulders_to_spawn, 1 do

        local distance = math.random(12, 40)

        local rotated_position = math2d.position.rotate_vector({0, distance}, angles[n])
        --log(rotated_position)
        local position_to_spawn = math2d.position.add(entity.position, rotated_position)

        local geyser = entity.surface.create_entity{
            name = "frostnode-boulder",
            position = position_to_spawn,
            raise_built = true,
            fast_replace = true,
            --amount = resource_scale * (450000 + math.random(0, 300000))
        }
        --geyser.initial_amount = geyser.amount

        table.insert(sub_entities, return_as_userdata(geyser))

    end

    local count = 0
    for k, v in pairs(sub_entities) do
        count = count + 1
    end
    game.print("summoned " .. tostring(count) .. " boulders")

    local stupid_entity = return_as_userdata(entity)
    table.insert(global.frostnode.sinkholes, stupid_entity)
    global.frostnode.sinkhole_connections[stupid_entity] = sub_entities

    for k, v in pairs(sub_entities) do
        table.insert(global.frostnode.boulders, v)
        global.frostnode.boulder_connections[v] = stupid_entity
    end

end

frostnode.events = {
    [defines.events.on_script_trigger_effect] = frostnode.on_sinkhole_generated,
    on_init = frostnode.on_init,
}

return frostnode