function  [point_index, ...
           line_index, ...
           surface_index, ...
           volume_index, ...
           point_str, ...
           line_str, ...
           surface_str, ...
           volume_str] = generate_connector(x_pos, ...
                                            y_pos, ...
                                            z_pos, ...
                                            tsv_r, ...
                                            point_index, ...
                                            line_index, ...
                                            surface_index, ...
                                            volume_index, ...
                                            point_str, ...
                                            line_str, ...
                                            surface_str, ...
                                            volume_str)

    
    % radius
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos, z_pos);
    point_str = [point_str str];
    point_r = point_index;

    % first point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos + tsv_r, y_pos, z_pos);
    point_str = [point_str str];
    point_a = point_index;

    % second point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos + tsv_r, z_pos);
    point_str = [point_str str];
    point_b = point_index;

    % third point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos - tsv_r,  y_pos, z_pos);
    point_str = [point_str str];
    point_c = point_index;

    % fourth point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos - tsv_r, z_pos);
    point_str = [point_str str];
    point_d = point_index;
    
    % fifth point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos, z_pos + tsv_r);
    point_str = [point_str str];
    point_e = point_index;
    
    % sixth point
    point_index = point_index + 1;
    str = sprintf('Point(%d) = {%.2f,%.2f,%.2f,lc};\n',...
                  point_index, x_pos, y_pos, z_pos - tsv_r);
    point_str = [point_str str];
    point_f = point_index;   
    
    % create circles
    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                 line_index, point_a, point_r, point_b);
    line_str = [line_str str];
    line1 = line_index;
    
    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_b, point_r, point_c);
    line_str = [line_str str];
    line2 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_c, point_r, point_d);
    line_str = [line_str str];
    line3 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_d, point_r, point_a);
    line_str = [line_str str];
    line4 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_a, point_r, point_e);
    line_str = [line_str str];
    line5 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_e, point_r, point_c);
    line_str = [line_str str];
    line6 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_b, point_r, point_e);
    line_str = [line_str str];
    line7 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_e, point_r, point_d);
    line_str = [line_str str];
    line8 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_a, point_r, point_f);
    line_str = [line_str str];
    line9 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_f, point_r, point_c);
    line_str = [line_str str];
    line10 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_b, point_r, point_f);
    line_str = [line_str str];
    line11 = line_index;

    line_index = line_index + 1;
    str = sprintf('Circle(%d) = {%d,%d,%d};\n',...
                  line_index, point_f, point_r, point_d);
    line_str = [line_str str];
    line12 = line_index;
    
    % create surfaces
    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, -%d, %d};\n',... 
                  surface_index,...
                  line1,...
                  line5,...
                  line7);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface1 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, -%d, -%d};\n',... 
                  surface_index,...
                  line2,...
                  line7,...
                  line6);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface2 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, %d, -%d};\n',... 
                  surface_index,...
                  line3,...
                  line6,...
                  line8);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface3 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, %d, %d};\n',... 
                  surface_index,...
                  line4,...
                  line8,...
                  line5);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface4 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, -%d, %d};\n',... 
                  surface_index,...
                  line1,...
                  line9,...
                  line11);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface5 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, -%d, -%d};\n',... 
                  surface_index,...
                  line2,...
                  line11,...
                  line10);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface6 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, %d, -%d};\n',... 
                  surface_index,...
                  line3,...
                  line10,...
                  line12);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface7 = surface_index;

    surface_index = surface_index + 1;
    str = sprintf('Line Loop(%d) = {%d, %d, %d};\n',... 
                  surface_index,...
                  line4,...
                  line12,...
                  line9);
    surface_str = [surface_str str];
    str = sprintf('Ruled Surface(%d) = {%d};\n',...
                  surface_index,...
                  surface_index);
    surface_str = [surface_str str];
    surface8 = surface_index;
    
    % create volume
    surface_index = surface_index + 1;
    str = sprintf('Surface Loop(%d) = {%d, %d, %d, %d, %d, %d, %d, %d};\n',...
                  surface_index, ...
                  surface1, ...
                  surface2, ...
                  surface3, ...
                  surface4, ...
                  surface5, ...
                  surface6, ...
                  surface7, ...
                  surface8);
    surface_str = [surface_str str];
    
    volume_index = volume_index + 1;
    str = sprintf('Volume(%d) = {%d};\n', volume_index, surface_index);
    volume_str = [volume_str str];
end
          