% file name: trans_mat.m
% author: UCHIYAMA Katsu
% date: 2022-07-30
% description: homogeneous transformation

function mat4x4 = trans_mat(trans_vec, rot_vec)

    roll = rot_vec(1);
    pitch = rot_vec(2);
    yaw = rot_vec(3);

    mat4x4 = [
        cos(yaw) * cos(pitch) cos(yaw) * sin(pitch) * sin(roll) - sin(yaw) * cos(roll) cos(yaw) * sin(pitch) * cos(roll) + sin(yaw) * sin(roll) trans_vec(1);
        sin(yaw) * cos(pitch) sin(yaw) * sin(pitch) * sin(roll) + cos(yaw) * cos(roll) sin(yaw) * sin(pitch) * cos(roll) - cos(yaw) * sin(roll) trans_vec(2);
        -sin(pitch) cos(pitch) * sin(roll) cos(pitch) * cos(roll) trans_vec(3);
        0 0 0 1
        ];

end
