local math2d = require("__core__/lualib/math2d")

local magmacyte = {}

function return_as_userdata (entity)
    return entity.surface.find_entity(entity.name, entity.position)
end

-- kill me nowcaster = {}

magmacyte.verify_magmacyte = function ()
    global.magmacyte = global.magmacyte or {
        main_holes = {},
        geysers = {},
        main_hole_connections = {},
        geyser_connections = {}
    }
end

magmacyte.on_init = function()
    magmacyte.verify_magmacyte()
end

magmacyte.get_main_from_geyser = function (geyser)
    magmacyte.verify_magmacyte()

    for k, v in pairs(global.magmacyte.geyser_connections) do
        if geyser == k then
            return v
        end
    end

    return nil
end

magmacyte.get_geysers_from_main = function (main)
    magmacyte.verify_magmacyte()

    for k, v in pairs(global.magmacyte.main_hole_connections) do
        if main == k then
            return v
        end
    end

    return nil
end

magmacyte.on_main_hole_generated = function (event)

    if event.effect_id ~= "magmacyte-main-hole-created" then
        return
    end

    magmacyte.verify_magmacyte()

    game.print("we made a magmacyte main hole!")

    local entity = event.source_entity

    local sub_entities = {}

    local geysers_to_spawn = 9

    local resource_scale = 1

    if entity.surface.map_gen_settings.autoplace_controls["magmacyte-geyser"] ~= nil then
        local size = entity.surface.map_gen_settings.autoplace_controls["magmacyte-geyser"].size
        if size <= 0.5 then 
            geysers_to_spawn = 2
        elseif size < 1 then
            geysers_to_spawn = 3
        elseif size == 1 then
            geysers_to_spawn = 4
        elseif size <= 2 then
            geysers_to_spawn = 5
        elseif size <= 3 then
            geysers_to_spawn = 6
        elseif size <= 4 then
            geysers_to_spawn = 7
        elseif size <= 5 then
            geysers_to_spawn = 8
        elseif size <= 6 then
            geysers_to_spawn = 9
        end
    end

    --log(tostring(entity.surface.map_gen_settings.autoplace_controls))
    -- for k,v in pairs(entity.surface.map_gen_settings.autoplace_controls["copper-ore"]) do
    --     log(k)
    --     log(v)
    -- end

    local angles = {}
    local distances = {}

    for n = 0, geysers_to_spawn - 1, 1 do
        local num = n * (360 / geysers_to_spawn)
        num = num + math.random(-25, 25)
        table.insert(angles, num)
    end

    local starting_angle = math.random(-40, 40)

    for k, v in pairs(angles) do
        angles[k] = v + starting_angle
    end

    for k, v in pairs(angles) do
        log(v)
    end

    for n = 1, geysers_to_spawn, 1 do

        local distance = math.random(12, 40)

        local rotated_position = math2d.position.rotate_vector({0, distance}, angles[n])
        --log(rotated_position)
        local position_to_spawn = math2d.position.add(entity.position, rotated_position)

        local geyser = entity.surface.create_entity{
            name = "magmacyte-geyser",
            position = position_to_spawn,
            raise_built = true,
            amount = resource_scale * (450000 + math.random(0, 300000))
        }
        geyser.initial_amount = geyser.amount

        table.insert(sub_entities, return_as_userdata(geyser))

    end

    local count = 0
    for k, v in pairs(sub_entities) do
        count = count + 1
    end
    game.print("summoned " .. tostring(count) .. " geysers")

    local stupid_entity = return_as_userdata(entity)
    table.insert(global.magmacyte.main_holes, stupid_entity)
    global.magmacyte.main_hole_connections[stupid_entity] = sub_entities

    for k, v in pairs(sub_entities) do
        table.insert(global.magmacyte.geysers, v)
        global.magmacyte.geyser_connections[v] = stupid_entity
    end

end



magmacyte.on_destroyed_entity = function (entity)

end

magmacyte.events = {
    [defines.events.on_script_trigger_effect] = magmacyte.on_main_hole_generated,
}

return magmacyte