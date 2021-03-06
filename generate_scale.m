function [point_index, ...
          line_index, ...
          surface_index, ...
          volume_index, ...
          point_str, ...
          line_str, ...
          surface_str, ...
          volume_str] = generate_scale(x_start, ...
                                       y_start, ...
                                       z_start, ...
                                       x_dim, ...
                                       y_dim, ...
                                       z_dim, ...
                                       point_index, ...
                                       line_index, ...
                                       surface_index, ...
                                       volume_index, ...
                                       point_str, ...
                                       line_str, ...
                                       surface_str, ...
                                       volume_str, ...
                                       enable_color, ...
                                       color_map)
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n', point_index, x_start, y_start, z_start);
    point_str = [point_str str];
end

