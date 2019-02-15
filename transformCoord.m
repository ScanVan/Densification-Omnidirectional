%% Generates the equirectangular image of an artificial mode

% Convention of the coordinates
%        Z
%         1
%         |  -1
%         | /
%         |/
% -1 -----/-------1 Y
%        /|
%     X 1 |
%         |
%         -1

% Width and height of the destination equirectangular image
w = 6016;
h = 3008;

% Position where the sphere will be placed
X_s = 0;
Y_s = 50;
Z_s = 0;

% Read the image to place centered around (-200, 0, 0)
im1 = imread('img1.bmp');
% Get the size of image 1
[h1, w1, ~] = size(im1);
[XX1,YY1] = meshgrid(1:w1,1:h1);
idx_1 = 0;

% Read the image to place centered around (0, -200, 0)
im2 = imread('img2.bmp');
% Get the size of image 1
[h2, w2, ~] = size(im2);
[XX2,YY2] = meshgrid(1:w2,1:h2);
idx_2 = 0;

% Read the image to place centered around (200, 0, 0)
im3 = imread('img3.bmp');
% Get the size of image 1
[h3, w3, ~] = size(im3);
[XX3,YY3] = meshgrid(1:w3,1:h3);
idx_3 = 0;

% Read the image to place centered around (0, 200, 0)
im4 = imread('img4.bmp');
% Get the size of image 1
[h4, w4, ~] = size(im4);
[XX4,YY4] = meshgrid(1:w4,1:h4);
idx_4 = 0;

% Pre-allocates space for the destination image
im_dest = uint8(zeros(h,w,3));
% scans through the pixel positions of the destination image
for i=0.5:1:w
    for j=0.5:1:h        
        [x,y,z] =convertCartesian2Spherical(i, j, w, h);        
        % for points that are on the negative x
        if (x<0)             
            % Plce the image cetered around (-200, 0, 0);
            % The projected point on the plane passing through (-200, 0, 0)
            X_1 = -(200 + X_s);            
            rho_1 = X_1/x;
            Y_1 = rho_1 * y;
            Z_1 = rho_1 * z;
            % Translate the coordinates into coordinates of the image
            x_im1 = (Y_1 + Y_s) + w1/2;
            y_im1 = (Z_1 + Z_s) + h1/2;
            % Check if it falls between the ranges
            if (x_im1>0)&&(x_im1<=w1)&&(y_im1>0)&&(y_im1<=h1)                 
                % Record the destination position and the x,y coordinate to
                % query on the image
                idx_1 = idx_1 + 1;
                vec_idx_Y_1(idx_1)= j+0.5;
                vec_idx_X_1(idx_1)= i+0.5;
                vec_coord_X_1(idx_1) = x_im1;
                vec_coord_Y_1(idx_1) = y_im1;                
            end
        end
        % for points that are on the negative y
        if (y<0)             
            % Plce the image cetered around (0, -200, 0);
            % The projected point on the plane passing through (0, -200, 0)
            Y_2 = -(200 + Y_s);
            rho_2 = Y_2/y;
            X_2 = rho_2 * x;
            Z_2 = rho_2 * z;
            % Translate the coordinates into coordinates of the image
            x_im2 = -(X_2 + X_s) + w2/2;
            y_im2 = (Z_2 + Z_s) + h2/2;
            % Check if it falls between the ranges
            if (x_im2>0)&&(x_im2<=w2)&&(y_im2>0)&&(y_im2<=h2) 
                % Record the destination position and the x,y coordinate to
                % query on the image
                idx_2 = idx_2 + 1;
                vec_idx_Y_2(idx_2)= j+0.5;
                vec_idx_X_2(idx_2)= i+0.5;
                vec_coord_X_2(idx_2) = x_im2;
                vec_coord_Y_2(idx_2) = y_im2;                           
            end
        end
        % for points that are on the positive x
        if (x>0)             
            % Plce the image cetered around (200, 0, 0);
            % The projected point on the plane passing through (200, 0, 0)
            X_3 = (200 + X_s);
            rho_3 = X_3/x;
            Y_3 = rho_3 * y;
            Z_3 = rho_3 * z;
            % Translate the coordinates into coordinates of the image
            x_im3 = -(Y_3 + Y_s) + w3/2;
            y_im3 = (Z_3 + Z_s) + h3/2;
            % Check if it falls between the ranges
            if (x_im3>0)&&(x_im3<=w3)&&(y_im3>0)&&(y_im3<=h3) 
                % Record the destination position and the x,y coordinate to
                % query on the image
                idx_3 = idx_3 + 1;
                vec_idx_Y_3(idx_3)= j+0.5;
                vec_idx_X_3(idx_3)= i+0.5;
                vec_coord_X_3(idx_3) = x_im3;
                vec_coord_Y_3(idx_3) = y_im3;           
            end
        end
        % for points that are on the positive y
        if (y>0)             
            % Plce the image cetered around (0, 200, 0);
            % The projected point on the plane passing through (0, 200, 0)
            Y_4 = (200 - Y_s);
            rho_4 = Y_4/y;
            X_4 = rho_4 * x;
            Z_4 = rho_4 * z;
            % Translate the coordinates into coordinates of the image
            x_im4 = (X_4 + X_s) + w4/2;
            y_im4 = (Z_4 + Z_s) + h4/2;
            % Check if it falls between the ranges
            if (x_im4>0)&&(x_im4<=w4)&&(y_im4>0)&&(y_im4<=h4) 
                % Record the destination position and the x,y coordinate to
                % query on the image
                idx_4 = idx_4 + 1;
                vec_idx_Y_4(idx_4)= j+0.5;
                vec_idx_X_4(idx_4)= i+0.5;
                vec_coord_X_4(idx_4) = x_im4;
                vec_coord_Y_4(idx_4) = y_im4;                           
            end
        end
        
    end
end

Vq1 = interp2(XX1,YY1,double(im1(:,:,1)),vec_coord_X_1, vec_coord_Y_1,'cubic');
Vq2 = interp2(XX1,YY1,double(im1(:,:,2)),vec_coord_X_1, vec_coord_Y_1,'cubic');
Vq3 = interp2(XX1,YY1,double(im1(:,:,3)),vec_coord_X_1, vec_coord_Y_1,'cubic');

for i=1:idx_1
    im_dest(vec_idx_Y_1(i),vec_idx_X_1(i),1) = Vq1(i);
    im_dest(vec_idx_Y_1(i),vec_idx_X_1(i),2) = Vq2(i);
    im_dest(vec_idx_Y_1(i),vec_idx_X_1(i),3) = Vq3(i);
end

Vq1 = interp2(XX2,YY2,double(im2(:,:,1)),vec_coord_X_2, vec_coord_Y_2,'cubic');
Vq2 = interp2(XX2,YY2,double(im2(:,:,2)),vec_coord_X_2, vec_coord_Y_2,'cubic');
Vq3 = interp2(XX2,YY2,double(im2(:,:,3)),vec_coord_X_2, vec_coord_Y_2,'cubic');

for i=1:idx_2
    im_dest(vec_idx_Y_2(i),vec_idx_X_2(i),1) = Vq1(i);
    im_dest(vec_idx_Y_2(i),vec_idx_X_2(i),2) = Vq2(i);
    im_dest(vec_idx_Y_2(i),vec_idx_X_2(i),3) = Vq3(i);
end

Vq1 = interp2(XX3,YY3,double(im3(:,:,1)),vec_coord_X_3, vec_coord_Y_3,'cubic');
Vq2 = interp2(XX3,YY3,double(im3(:,:,2)),vec_coord_X_3, vec_coord_Y_3,'cubic');
Vq3 = interp2(XX3,YY3,double(im3(:,:,3)),vec_coord_X_3, vec_coord_Y_3,'cubic');

for i=1:idx_3
    im_dest(vec_idx_Y_3(i),vec_idx_X_3(i),1) = Vq1(i);
    im_dest(vec_idx_Y_3(i),vec_idx_X_3(i),2) = Vq2(i);
    im_dest(vec_idx_Y_3(i),vec_idx_X_3(i),3) = Vq3(i);
end

Vq1 = interp2(XX4,YY4,double(im4(:,:,1)),vec_coord_X_4, vec_coord_Y_4,'cubic');
Vq2 = interp2(XX4,YY4,double(im4(:,:,2)),vec_coord_X_4, vec_coord_Y_4,'cubic');
Vq3 = interp2(XX4,YY4,double(im4(:,:,3)),vec_coord_X_4, vec_coord_Y_4,'cubic');

for i=1:idx_4
    im_dest(vec_idx_Y_4(i),vec_idx_X_4(i),1) = Vq1(i);
    im_dest(vec_idx_Y_4(i),vec_idx_X_4(i),2) = Vq2(i);
    im_dest(vec_idx_Y_4(i),vec_idx_X_4(i),3) = Vq3(i);
end

figure; imshow (im_dest);
imwrite(im_dest,'equi2.jpg');