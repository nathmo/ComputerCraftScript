local treeSpecie = "minecraft:oak_sapling"
local lenght = 16
local row = 4

function harvestTrees()
    turtle.dig()
    turtle.forward() -- get in the tree
    turtle.digDown() -- remove the log under the turtle (opperate one bloc over the floor)
    function harvest() -- climb trough the tree while arvesting
        turtle.digUp()
        turtle.up()
    end
    local altitude = 0
    while(turtle.detectUp()) -- while not at the top
    do
        harvest()
        altitude = altitude + 1
    end
    while(altitude~=0) -- while not back down
    do
        turtle.down()
        altitude = altitude - 1
    end
    function plantTree()
        for i=1,16 do
            local item = turtle.getItemDetail(i)
            if item then
                if(item.name == treeSpecie) then
                    turtle.select(i)
                end    
            end
        end
        turtle.placeDown()
    end
    plantTree()
    turtle.back() -- step back to face the tree
end

function harvestRow()
    for l=1,lenght do
        turtle.dig()
        turtle.forward()
        turtle.suckDown()
        turtle.turnLeft()
        if(turtle.detect()) do
            harvestTrees()
            turtle.suckDown()
        end    
        turtle.turnRight()
        turtle.turnRight()
        if(turtle.detect()) do
            harvestTrees()
            turtle.suckDown()
        end   
        turtle.turnLeft()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    for l=1,lenght do
      turtle.dig()
      turtle.forward() -- get in the tree
    end
    turtle.turnRight()
    turtle.turnRight()
end

while(True)
do
    harvestRow()
end
