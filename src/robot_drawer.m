% file name: robot_drawer.m
% author: UCHIYAMA Katsu
% date: 2022-07-30

function robot_drawer(base_center, base_corner, legs_edge)
    % description: base_center must be 1x3 matrix
    % description: base must be 6x3 matrix
    % description: legs_edge must be 6x3x3 matrix

    g = graph([1:1:6], [2:1:6 1]);
    o = dfsearch(g, 1);
    f = o';

    % Plot
    cla
    grid; hold on

    xlim([-2.5 2.5]);
    ylim([-2.5 2.5]);
    zlim([-2.5 2.5]);

    cols = lines(7);
    patch('Faces', f, 'Vertices', base_corner, 'FaceColor', cols(1, :), 'FaceAlpha', 0.4);
    view([120 30]);

    for i = 1:6
        plot3(legs_edge(1, :, i), legs_edge(2, :, i), legs_edge(3, :, i), 'Color', cols(i + 1, :), 'linewidth', 1);
        scatter3(legs_edge(1, :, i), legs_edge(2, :, i), legs_edge(3, :, i), 10, 'filled', 'Color', cols(i + 1, :));
    end

end
