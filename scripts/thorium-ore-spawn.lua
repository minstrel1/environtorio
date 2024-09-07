thorium_ore_spawn = {}

thorium_ore_spawn.name = "thorium_ore_spawn"

thorium_ore_spawn.on_built_entity = function (entity) 

end

thorium_ore_spawn.on_destroyed_entity = function (event) 
    local entity = event.entity

    if event.entity.name ~= "thorium-rock" then return end

    local name   = 'thorium-ore'
    local amount = 15000
    local tiles  = 150

    local w_max = 12 + math.random(-3, 3)
    local h_max = 16 + math.random(-3, 3)
    local abs = math.abs

    local biases = {[0] = {[0] = 1}}
    local t = 1

    local function grow(grid,t)
    local old = {}
    local new_count = 0
    for x,_  in pairs(grid) do for y,__ in pairs(_) do
        table.insert(old,{x,y})
        end end
    for _,pos in pairs(old) do
        local x,y = pos[1],pos[2]
        local bias = grid[x][y]
        for dx=-1,1,1 do for dy=-1,1,1 do
        local a,b = x+dx, y+dy
        if (math.random() > 0.9) and (abs(a) < w_max) and (abs(b) < h_max) then
            grid[a] = grid[a] or {}
            if not grid[a][b] then
            grid[a][b] = 1 - (t/tiles)
            new_count = new_count + 1
            if (new_count+t) == tiles then return new_count end
            end
            end
        end end
        end
    return new_count
    end

    repeat 
    t = t + grow(biases,t)
    until t >= tiles

    local pos = entity.position
    local total_bias = 0
    for x,_  in pairs(biases) do for y,bias in pairs(_) do
    total_bias = total_bias + bias
    end end

    for x,_  in pairs(biases) do for y,bias in pairs(_) do
    entity.surface.create_entity{
        name = name,
        amount = amount * (bias/total_bias),
        force = 'neutral',
        position = {pos.x+x,pos.y+y},
        }
    end end
end

thorium_ore_spawn.on_init = function (event)

end

thorium_ore_spawn.events = {
    [defines.events.on_entity_died] = thorium_ore_spawn.on_destroyed_entity,
    [defines.events.on_pre_player_mined_item] = thorium_ore_spawn.on_destroyed_entity,
    [defines.events.on_robot_pre_mined] = thorium_ore_spawn.on_destroyed_entity,
    [defines.events.script_raised_destroy] = thorium_ore_spawn.on_destroyed_entity,
    on_init = thorium_ore_spawn.on_init,
    on_boner = thorium_ore_spawn.on_init,
}


return thorium_ore_spawn