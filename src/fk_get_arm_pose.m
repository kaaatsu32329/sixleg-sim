% file name: fk_get_arm_pose.m
% author: UCHIYAMA Katsu
% date: 2022-07-31

function arm_edge_pose = fk_get_arm_pose(joint_param, link_length, origin_pose)

    trans_mat_leg_origin = trans_mat(origin_pose(1:3), origin_pose(4:6));

    for i = 1:7
        trans_mat_to(:, :, i) = trans_mat([link_length(i) 0 0], [0 0 joint_param(i)]);
    end

    trans_mat_leg_worldto(:, :, 1) = trans_mat_leg_origin * trans_mat_to(:, :, 1);
    rot_vec(:, 1) = mat2rot(trans_mat_leg_worldto(:, :, 1));

    for j = 2:7
        trans_mat_leg_worldto(:, :, j) = trans_mat_leg_worldto(:, :, j-1) * trans_mat_to(:, :, j);
        rot_vec(:, j) = mat2rot(trans_mat_leg_worldto(:, :, j));
    end

    for k = 1:7
        arm_edge_pose(:, k) = [
            trans_mat_leg_worldto(1, 4, k),
            trans_mat_leg_worldto(2, 4, k),
            trans_mat_leg_worldto(3, 4, k),
            rot_vec(1, k),
            rot_vec(2, k),
            rot_vec(3, k)
        ];
    end

end
