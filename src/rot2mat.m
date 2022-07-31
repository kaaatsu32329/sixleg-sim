% file name: rot2mat.m
% author: UCHIYAMA Katsu
% date: 2022-07-31

function mat = rot2mat(rot_vec)

    mat = [
        cos(rot_vec(2)) * cos(rot_vec(1)) sin(rot_vec(3)) * sin(rot_vec(2)) * cos(rot_vec(1)) - cos(rot_vec(3)) * sin(rot_vec(1)) sin(rot_vec(3)) * sin(rot_vec(1)) + cos(rot_vec(3)) * sin(rot_vec(2)) * cos(rot_vec(1));
        cos(rot_vec(2)) * sin(rot_vec(1)) sin(rot_vec(3)) * sin(rot_vec(2)) * sin(rot_vec(1)) + cos(rot_vec(3)) * cos(rot_vec(1)) -sin(rot_vec(3)) * cos(rot_vec(1)) + cos(rot_vec(3)) * sin(rot_vec(2)) * sin(rot_vec(1));
        -sin(rot_vec(2)) sin(rot_vec(3)) * cos(rot_vec(2)) cos(rot_vec(3)) * cos(rot_vec(2));
        ];

end
