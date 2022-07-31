% file name: mat2rot.m
% author: UCHIYAMA Katsu
% date: 2022-07-31

function rot = mat2rot(ht_matrix)
    % description: Roll: theta, Pitch: phi, Yaw: psi
    % description: ht_matrix is homogeneous transform

    phi = asin(-ht_matrix(3, 1));
    psi = atan2(ht_matrix(3, 2) / cos(phi), ht_matrix(3, 3) / cos(phi));
    theta = atan2(ht_matrix(2, 1) / cos(phi), ht_matrix(1, 1) / cos(phi));

    rot = [theta phi psi];

end
