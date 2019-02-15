function [p1, p2, p3] = convertCartesian2Spherical (x, y, width, height) 
% converts the cartesian coordinates to spherical coordinates

% The cartesian coordinates for the input image has the convention
% (0.5, 0.5) ---------------------------------------------------------------------------------------(width - 0.5, 0.5)
% .....
% (0.5, height/2) ------(width/4, height/2)-----(width/2, height/2)-----(3/4 * width, height/2)-----(width - 0.5, height/2)
% ....
% (0.5, height -0.5) -------------------------------------------------------------------------------(width - 0.5, height -0.5)

% These points are mapped close to 
% (0, 0, 1) ----------------------------------------------------------------------------------------(0, 0, 1)
% .....
% (1, 0, 0) ------------(0, 1, 0)---------------(-1, 0, 0)--------------(0, -1, 0)------------------(1, 0, 0)
% .....
% (0, 0, -1) ---------------------------------------------------------------------------------------(0, 0, -1)


    tm1 = (x / width) * 2 * pi;
    tm2 = (0.5 - (y / height)) * pi;
    
    p1 = cos(tm2) * cos(tm1);
    p2 = cos(tm2) * sin(tm1);
    p3 = sin(tm2);

end
