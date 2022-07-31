% file name: main.m
% author: UCHIYAMA Katsu
% date: 2022-07-30

clear; close all;

% Set body.
body_corner = [1 0 0; 1/2 sqrt(3) / 2 0; -1/2 sqrt(3) / 2 0; -1 0 0; -1/2 -sqrt(3) / 2 0; 1/2 -sqrt(3) / 2 0];
body_center = [0; 0; 0; 0; 0; 0]; % [x y z phi rho theta]

% Initialize parametor. In this case, the param is motor angle.
leg_param1 = [0 pi / 3 2 * pi / 3]; leg_length1 = [1 2]; leg_origin1 = [1 0 0 0 0 0];
leg_param2 = [0 pi / 3 2 * pi / 3]; leg_length2 = [1 2]; leg_origin2 = [1/2 sqrt(3) / 2 0 0 0 pi / 3];
leg_param3 = [0 pi / 3 2 * pi / 3]; leg_length3 = [1 2]; leg_origin3 = [-1/2 sqrt(3) / 2 0 0 0 2 * pi / 3];
leg_param4 = [0 pi / 3 2 * pi / 3]; leg_length4 = [1 2]; leg_origin4 = [-1 0 0 0 0 pi];
leg_param5 = [0 pi / 3 2 * pi / 3]; leg_length5 = [1 2]; leg_origin5 = [-1/2 -sqrt(3) / 2 0 0 0 4 * pi / 3];
leg_param6 = [0 pi / 3 2 * pi / 3]; leg_length6 = [1 2]; leg_origin6 = [1/2 -sqrt(3) / 2 0 0 0 5 * pi / 3];

% Combine data.
leg_params = [leg_param1; leg_param2; leg_param3; leg_param4; leg_param5; leg_param6];
leg_lengths = [leg_length1; leg_length2; leg_length3; leg_length4; leg_length5; leg_length6];
leg_origins = [leg_origin1; leg_origin2; leg_origin3; leg_origin4; leg_origin5; leg_origin6];

% Get joint position in 3 dimentions.
for i = 1:6
    arm_edge_pose(:, :, i) = fk_get_pose(leg_params(i, :), leg_lengths(i, :), leg_origins(i, :));
end

% Remove angle data. Only (x,y,z).
arm_edge_point = arm_edge_pose(1:3, :, :);

% Visualize robot.
robot_drawer(body_center, body_corner, arm_edge_point);
