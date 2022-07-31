% file name: fk_get_pose.m
% author: UCHIYAMA Katsu
% date: 2022-07-31

function arm_edge_pose = fk_get_pose(joint_param, link_length, origin_pose)

    trans_mat_origin = trans_mat(origin_pose(1:3), origin_pose(4:6));
    trans_mat_0to1 = trans_mat([0 0 0], [0 0 joint_param(1)]) * trans_mat([0 0 0], [0 -joint_param(2) 0]);
    trans_mat_1to2 = trans_mat([link_length(1) 0 0], [0 joint_param(3) 0]);
    trans_mat_2to3 = trans_mat([link_length(2) 0 0], [0 0 0]);

    trans_mat_worldto1 = trans_mat_origin * trans_mat_0to1;
    trans_mat_worldto2 = trans_mat_worldto1 * trans_mat_1to2;
    trans_mat_worldto3 = trans_mat_worldto2 * trans_mat_2to3;

    rot_vec1 = mat2rot(trans_mat_worldto1);
    arm_edge_pose = [
                trans_mat_worldto1(1, 4),
                trans_mat_worldto1(2, 4),
                trans_mat_worldto1(3, 4),
                rot_vec1(1),
                rot_vec1(2),
                rot_vec1(3)
                ];

    rot_vec2 = mat2rot(trans_mat_worldto2);
    arm_edge_pose(:, 2) = [
                        trans_mat_worldto2(1, 4),
                        trans_mat_worldto2(2, 4),
                        trans_mat_worldto2(3, 4),
                        rot_vec2(1),
                        rot_vec2(2),
                        rot_vec2(3)
                        ];

    rot_vec3 = mat2rot(trans_mat_worldto3);
    arm_edge_pose(:, 3) = [
                        trans_mat_worldto3(1, 4),
                        trans_mat_worldto3(2, 4),
                        trans_mat_worldto3(3, 4),
                        rot_vec3(1),
                        rot_vec3(2),
                        rot_vec3(3)
                        ]

end
