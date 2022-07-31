% file name: fk_get_leg_pose.m
% author: UCHIYAMA Katsu
% date: 2022-07-31

% ToDo: Simplify by using for loops, etc. Like `fk_get_arm_pose.m`

function leg_edge_pose = fk_get_leg_pose(joint_param, link_length, origin_pose)

    trans_mat_origin = trans_mat(origin_pose(1:3), origin_pose(4:6));
    trans_mat_0to1 = trans_mat([0 0 0], [0 0 joint_param(1)])
    trans_mat_1to2 = trans_mat([link_length(1) 0 0], [0 -joint_param(2) 0]);
    trans_mat_2to3 = trans_mat([link_length(2) 0 0], [0 joint_param(3) 0]);
    trans_mat_3to4 = trans_mat([link_length(3) 0 0], [0 0 0]);

    trans_mat_worldto1 = trans_mat_origin * trans_mat_0to1;
    trans_mat_worldto2 = trans_mat_worldto1 * trans_mat_1to2;
    trans_mat_worldto3 = trans_mat_worldto2 * trans_mat_2to3;
    trans_mat_worldto4 = trans_mat_worldto3 * trans_mat_3to4;

    rot_vec1 = mat2rot(trans_mat_worldto1);
    leg_edge_pose = [
                trans_mat_worldto1(1, 4),
                trans_mat_worldto1(2, 4),
                trans_mat_worldto1(3, 4),
                rot_vec1(1),
                rot_vec1(2),
                rot_vec1(3)
                ];

    rot_vec2 = mat2rot(trans_mat_worldto2);
    leg_edge_pose(:, 2) = [
                        trans_mat_worldto2(1, 4),
                        trans_mat_worldto2(2, 4),
                        trans_mat_worldto2(3, 4),
                        rot_vec2(1),
                        rot_vec2(2),
                        rot_vec2(3)
                        ];

    rot_vec3 = mat2rot(trans_mat_worldto3);
    leg_edge_pose(:, 3) = [
                        trans_mat_worldto3(1, 4),
                        trans_mat_worldto3(2, 4),
                        trans_mat_worldto3(3, 4),
                        rot_vec3(1),
                        rot_vec3(2),
                        rot_vec3(3)
                        ];

    rot_vec4 = mat2rot(trans_mat_worldto4);
    leg_edge_pose(:, 4) = [
                        trans_mat_worldto3(1, 4),
                        trans_mat_worldto3(2, 4),
                        trans_mat_worldto3(3, 4),
                        rot_vec4(1),
                        rot_vec4(2),
                        rot_vec4(3)
                        ];

end
