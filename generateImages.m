% Creates artificial images for testing the densification approach

% Image 1
% Creates 3 gaussians in the image
mu = [-5 -5; 0 0; 5 5];
sigma = cat(3, [1 10], [1 10], [1 10]);
gm = gmdistribution(mu, sigma);
x = 1; 
y = 1;
z = [];
for i=-10:0.1:10
    for j=-10:0.1:10
        z(x, y) = pdf(gm, [i j]);
        y = y + 1;
    end
    y = 1;
    x = x + 1;
end

img1 = uint8(zeros(200,200,3));
m1 = min(z(:));
m2 = max(z(:));
for i=1:200
    for j=1:200
        img1(i,j,1) = (z(i,j) -m1) / (m2-m1) * 255;
        img1(i,j,2) = (z(i,j) -m1) / (m2-m1) * 255 + 80;
        img1(i,j,3) = (z(i,j) -m1) / (m2-m1) * 255;
    end
end
figure; imshow (img1);


% Image 2
% Creates 3 gaussians in the image
mu = [-5 -5; 0 0; 5 5; -5 5; 5 -5];
sigma = cat(3, [1.5 20], [1.5 20], [1.5 20], [20 1.5], [20 1.5]);
gm = gmdistribution(mu, sigma);
x = 1; 
y = 1;
z = [];
for i=-10:0.1:10
    for j=-10:0.1:10
        z(x, y) = pdf(gm, [i j]);
        y = y + 1;
    end
    y = 1;
    x = x + 1;
end

img2 = uint8(zeros(200,200,3));
m1 = min(z(:));
m2 = max(z(:));
for i=1:200
    for j=1:200
        img2(i,j,1) = (z(i,j) -m1) / (m2-m1) * 255 + 90;
        img2(i,j,2) = (z(i,j) -m1) / (m2-m1) * 255;
        img2(i,j,3) = (z(i,j) -m1) / (m2-m1) * 255;
    end
end
figure; imshow (img2);



% Image 3
% Creates 3 gaussians in the image
mu = [-5 -5; 0 0; 5 5; -5 5; 5 -5];
sigma = cat(3, [10 1], [10 1], [10 1], [10 1], [10 1]);
gm = gmdistribution(mu, sigma);
x = 1; 
y = 1;
z = [];
for i=-10:0.1:10
    for j=-10:0.1:10
        z(x, y) = pdf(gm, [i j]);
        y = y + 1;
    end
    y = 1;
    x = x + 1;
end

img3 = uint8(zeros(200,200,3));
m1 = min(z(:));
m2 = max(z(:));
for i=1:200
    for j=1:200
        img3(i,j,1) = (z(i,j) -m1) / (m2-m1) * 255;
        img3(i,j,2) = (z(i,j) -m1) / (m2-m1) * 255 ;
        img3(i,j,3) = (z(i,j) -m1) / (m2-m1) * 255 + 80;
    end
end
figure; imshow (img3);

% Image 4
% Creates 3 gaussians in the image
mu = [-5 -5; 0 0; 5 5; -5 2.5; 5 -2.5];
sigma = cat(3, [15 2], [15 2], [15 2], [15 2], [15 2]);
gm = gmdistribution(mu, sigma);
x = 1; 
y = 1;
z = [];
for i=-10:0.1:10
    for j=-10:0.1:10
        z(x, y) = pdf(gm, [i j]);
        y = y + 1;
    end
    y = 1;
    x = x + 1;
end

img4 = uint8(zeros(200,200,3));
m1 = min(z(:));
m2 = max(z(:));
for i=1:200
    for j=1:200
        img4(i,j,1) = (z(i,j) -m1) / (m2-m1) * 255 + 80;
        img4(i,j,2) = (z(i,j) -m1) / (m2-m1) * 255 + 90;
        img4(i,j,3) = (z(i,j) -m1) / (m2-m1) * 255;
    end
end
figure; imshow (img4);

% Place the images into the space
% image 1 is placed in (2, 0, 0)

imwrite(img1,'img1.bmp');
imwrite(img2,'img2.bmp');
imwrite(img3,'img3.bmp');
imwrite(img4,'img4.bmp');

