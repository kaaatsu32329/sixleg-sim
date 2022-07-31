% file name: manipulator_drawer.m
% author: UCHIYAMA Katsu
% date: 2022-07-31

% ToDo: Modify the color to change for each arm of the robot.

function manipulator_drawer(stem_pose, arm_edge)

    cols = lines(7);

    plot3(arm_edge(1, :), arm_edge(2, :), arm_edge(3, :), 'Color', cols(3, :), 'linewidth', 1);
    scatter3(arm_edge(1, :), arm_edge(2, :), arm_edge(3, :), 10, 'filled', 'Color', cols(3, :));

end
