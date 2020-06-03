% Exercício 1 -----------------------------------------------------

img = imread('wire-bond.jpg')
img = double(img)

elem = ones(45,45);

res = erosion(img,elem);
imwrite(uint8(res),'ex1.jpg');

% Exercício 2 -----------------------------------------------------

img = imread('text.tif')

elem = [0 1 0; 1 1 1; 0 1 0]

res = dilation(img,elem);
imwrite(res,'ex2.tif');
