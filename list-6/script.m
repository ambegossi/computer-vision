% Exercício 1 -----------------------------------------------------

img = imread('cbt.bmp')

I = rgb2gray(img);
imshow(I)

imwrite(I,'ex1.png');

% Exercício 2 -----------------------------------------------------

img = imread('cbt.bmp')

% Extract the individual red, green, and blue color channels.
redChannel = img(:, :, 1);
greenChannel = img(:, :, 2);
blueChannel = img(:, :, 3);

% Then find the red color pixels.
redPixels = redChannel >=170;

redChannel(redPixels) = 255;
greenChannel(redPixels) = 255;
blueChannel(redPixels) = 255;

rgbImage = cat(3, redChannel, greenChannel, blueChannel);

imshow(rgbImage);

imwrite(rgbImage,'ex2.png');