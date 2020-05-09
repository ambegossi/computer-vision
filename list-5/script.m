% Exercício 1 -----------------------------------------------------
% a)
img = imread('I1_r1.bmp')
img = double(img)

% Takes only a small noisy part of the image
subimg = img(1:50,1:50);

h = myhistogram(subimg, 'pdf-i1r1.png');

% b)
img = imread('I1_r2.bmp')
img = double(img)

% Takes only a small noisy part of the image
subimg = img(1:20,1:20);

h = myhistogram(subimg, 'pdf-i1r2.png');

% c)
img = imread('I2_r1.bmp')
img = double(img)

% Takes only a small noisy part of the image
subimg = img(1:20,1:20);

h = myhistogram(subimg, 'pdf-i2r1.png');

% d)
img = imread('I2_r2.bmp')
img = double(img)

% Takes only a small noisy part of the image
subimg = img(1:50,1:50);

h = myhistogram(subimg, 'pdf-i2r2.png');

% Exercício 2 -----------------------------------------------------
img = imread('I2_r1.bmp')
img = double(img)

mask = [1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25];
    
res = convolution(img, mask);

imwrite(uint8(res),'ex2.bmp');

% O ruído diminuiu, porém, a imagem ficou com efeito de blur.