% 1)
im_in = imread('im_in.bmp')
im_in = double(im_in)

[nl nc] = size(im_in);

% limiarização
limiar = 95;

for i = 1:1:nl
    for j = 1:1:nc
        if (im_in(i,j) <= limiar) 
            im_in(i,j) = 0;
        else 
            im_in(i,j) = 255;
        end
    end
end

res = uint8(im_in);
imwrite(res,'ex1.bmp');

% 2)
neg1 = imread('neg1.jpg')
neg1 = double(neg1)

[nl nc] = size(neg1);

for i = 1:1:nl
    for j = 1:1:nc
        neg1(i,j) = 255 - neg1(i,j);
    end
end

res = uint8(neg1);
imwrite(res,'ex2.bmp');

% 3) 
im_in = imread('ex2.bmp');
im_in = double(im_in);

p1 = [60 10];
p2 = [130 240];

res = transf_linear(im_in,p1,p2);

res = uint8(res);
imwrite(res,'ex3.bmp');

% 4)
im_in = imread('im_in.bmp')
im_in = double(im_in)
h = myhistogram(im_in);

% 5)
im_in = imread('ex2.bmp')
im_in = double(im_in)

h = myhistogram(im_in);
res = eqhistogram(h, im_in);
h = myhistogram(res);

res = uint8(res);
imwrite(res,'ex5.bmp');

% 6)
im_in = imread('im_in.bmp');
im_in = double(im_in)

mask = [1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81; 
        1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81 1/81];

res = convolution(im_in, mask);

res = uint8(res);
imwrite(res,'ex6mask99.bmp');

% 7)
im_in = imread('parafuso.JPG');
im_in = double(im_in)

mask = [1 0 0 0 0 -1; 
        1 0 0 0 0 -1; 
        1 0 0 0 0 -1; 
        1 0 0 0 0 -1];

res = convolution(im_in, mask);

res = uint8(res);
imwrite(res,'ex7.bmp');