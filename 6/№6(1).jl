using HorizonSideRobots
robot=Robot(animate=true)
function draw!(robot)
    num_Nord1, num_Ost1 = to_corner(robot)
    draw_perimeter!(robot)
end
function to_corner(robot)
    num_West = 0
    num_Sud = 0
    while !isborder(robot, West) || !isborder(robot, Sud)
        if isborder(robot, Sud)
            move!(robot, West)
            num_West += 1
        else
            move!(robot, Sud)
            num_Sud += 1
        end
    end
    return num_Sud, num_West
end
function draw_perimeter!(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
end
inverse(side::HorizonSide) = HorizonSide((Int(side) +2) % 4)
next(side::HorizonSide) = HorizonSide((Int(side) +1) % 4)
previous(side::HorizonSide) = HorizonSide((Int(side) + 3) % 4)
draw!(robot)