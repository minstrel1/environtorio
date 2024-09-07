caster = {}

caster.name = "caster"

caster.on_init = function ()
    global.casters = global.casters or {}
end

caster.on_built_entity = function (event)

    if event.effect_id ~= "caster-created" then
        return
    end

    local entity = event.source_entity

    -- get direction of the caster
    if entity.direction == defines.direction.north then
        local loader_position = entity.position
        loader_position.x = loader_position.x + 0.5
        loader_position.y = loader_position.y - 1.5

        local caster_loader = entity.surface.create_entity{
            name = "caster-loader",
            position = loader_position,
            direction = defines.direction.south,
            raise_built = true,
        }

        caster_loader.loader_type = "output"
        caster_loader.force = entity.force

        global.casters[entity.unit_number] = {main = entity, loader = caster_loader}
    elseif entity.direction == defines.direction.east then
        local loader_position = entity.position
        loader_position.x = loader_position.x + 1.5
        loader_position.y = loader_position.y + 0.5

        local caster_loader = entity.surface.create_entity{
            name = "caster-loader",
            position = loader_position,
            direction = defines.direction.west,
            raise_built = true,
        }

        caster_loader.loader_type = "output"
        caster_loader.force = entity.force

        global.casters[entity.unit_number] = {main = entity, loader = caster_loader}
    elseif entity.direction == defines.direction.south then
        local loader_position = entity.position
        loader_position.x = loader_position.x - 0.5
        loader_position.y = loader_position.y + 1.5

        local caster_loader = entity.surface.create_entity{
            name = "caster-loader",
            position = loader_position,
            direction = defines.direction.north,
            raise_built = true,
        }

        caster_loader.loader_type = "output"
        caster_loader.force = entity.force

        global.casters[entity.unit_number] = {main = entity, loader = caster_loader}
    elseif entity.direction == defines.direction.west then
        local loader_position = entity.position
        loader_position.x = loader_position.x - 1.5
        loader_position.y = loader_position.y - 0.5

        local caster_loader = entity.surface.create_entity{
            name = "caster-loader",
            position = loader_position,
            direction = defines.direction.east,
            raise_built = true,
        }

        caster_loader.loader_type = "output"
        caster_loader.force = entity.force

        global.casters[entity.unit_number] = {main = entity, loader = caster_loader}
    end
end



caster.on_destroyed_entity = function (event)

    local entity = event.entity

    if not event.entity.valid or entity.name ~= "caster" then
        return
    end

    if global.casters[entity.unit_number] then
        if global.casters[entity.unit_number].loader then
            global.casters[entity.unit_number].loader.destroy()
        end
    end
   entity.destroy()

end

caster.events = {
    [defines.events.on_script_trigger_effect] = caster.on_built_entity,
    [defines.events.on_entity_died] = caster.on_destroyed_entity,
    [defines.events.on_pre_player_mined_item] = caster.on_destroyed_entity,
    [defines.events.on_robot_pre_mined] = caster.on_destroyed_entity,
    on_init = caster.on_init,
}

return caster