function  [point_index, ...
           line_index, ...
           surface_index, ...
           volume_index, ...
           point_str, ...
           line_str, ...
           surface_str, ...
           volume_str] = generate_tsv(x_pos, ...
                                      y_pos, ...
                                      tsv_r, ...
                                      z_start, ...
                                      z_dim, ...
                                      point_index, ...
                                      line_index, ...
                                      surface_index,...
                                      volume_index, ...
                                      point_str, ...
                                      line_str, ...
                                      surface_str, ...
                                      volume_str)
    % radius
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos, z_start);
    point_str = [point_str str];
    point_r = point_index;

    % first point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos + tsv_r, y_pos, z_start);
    point_str = [point_str str];
    point_a = point_index;

    % second point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos + tsv_r, z_start);
    point_str = [point_str str];
    point_b = point_index;

    % third point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos - tsv_r,  y_pos, z_start);
    point_str = [point_str str];
    point_c = point_index;

    % fourth point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos - tsv_r, z_start);
    point_str = [point_str str];
    point_d = point_index;

    % create circle 
    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                 line_index, point_a, point_r, point_b);
    line_str = [line_str str];

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_b, point_r, point_c);
    line_str = [line_str str];

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_c, point_r, point_d);
    line_str = [line_str str];

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_d, point_r, point_a);
    line_str = [line_str str];

    % create surface
    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, %d, %d, %d};\n',... 
                  surface_index,...
                  line_index - 3,...
                  line_index - 2,...
                  line_index - 1,...
                  line_index);
    surface_str = [surface_str str];

    str = sprintf('Plane Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];

    % create volume
    volume_index = volume_index + 1;
    str = sprintf('Extrude {0,0,%.2f} {\n',...
                  z_dim);
    volume_str = [volume_str str];
    str = sprintf('    Surface{%d};\n', surface_index);
    volume_str = [volume_str str '}\n'];
end
