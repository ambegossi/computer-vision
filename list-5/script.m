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

mask = 5;
    
res = av_filter(img, mask);

imwrite(uint8(res),'ex2.bmp');

% O ruído diminuiu, porém, a imagem ficou com efeito de blur.
% Ruído reduzido em consequência do borramento. 

% Exercício 3 -----------------------------------------------------
img = imread('I2_r1.bmp');
img = double(img);

% Filtro de 5x5
mask = 5;

res = geo_filter(img, mask);

imwrite(uint8(res),'ex3.bmp');

% A suavização é comparável ao filtro de média aritmética, 
% mas o borramento ficou um pouco menor.

% Exercício 4 -----------------------------------------------------
img = imread('I2_r1.bmp');
img = double(img);

% Filtro de 5x5
mask = 5;

res = harm_filter(img, mask);

imwrite(uint8(res),'ex4.bmp');

% Tem um bom desempenho para o ruído gaussiano.
% Funciona bem para o ruído de sal, mas não para o de pimenta.

% Exercício 5 -----------------------------------------------------
img = imread('I2_r1.bmp');
img = double(img);

% Filtro de 5x5
mask = 5;

res = median_filter(img, mask);

imwrite(uint8(res),'ex5.bmp');

% Visualmente foi o filtro que apresentou o melhor resultado comparado
% aos demais. O ruído foi removido consideravelmente, e a imagem
% não ficou com tanto borramento

% Exercício 6 -----------------------------------------------------
img = imread('I1_r1.bmp');
img = double(img);

mask = [1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25];

[nli nci] = size(img);
[nlm ncm] = size(mask);

% Zero padding
sdl = (nli + nlm) - 1;
sdc = (nci + ncm) - 1;

F = zeros(sdl,sdc);
H = zeros(sdl,sdc);

% Zero padding imagem 
for i = 1:1:nli
    for j = 1:1:nci
        F(i,j) = img(i,j);
    end
end

% Zero padding mask
for i = 1:1:nlm
    for j = 1:1:ncm
        H(i,j) = mask(i,j);
    end
end

F = fftshift(fft2(F));
H = fftshift(fft2(H));

G = F .* H;
r1 = ifft2(G);
ifftshow(r1,'ex6a.bmp');

r2 = G ./ H;

for i = 1:1:sdl
    for j = 1:1:sdc
        if(isnan(r2(i,j)))
            r2(i,j) = 1;
        end
    end
end

r3 = ifft2(r2);

ifftshow(r3,'ex6b.bmp');

% Exercício 7 -----------------------------------------------------
img = imread('I1_r1.bmp');
img = double(img);

mask = [1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25];

[nli nci] = size(img);
[nlm ncm] = size(mask);

% Zero padding
sdl = (nli + nlm) - 1;
sdc = (nci + ncm) - 1;

F = zeros(sdl,sdc);
H = zeros(sdl,sdc);

% Zero padding imagem 
for i = 1:1:nli
    for j = 1:1:nci
        F(i,j) = img(i,j);
    end
end

% Zero padding mask
for i = 1:1:nlm
    for j = 1:1:ncm
        H(i,j) = mask(i,j);
    end
end

F = fftshift(fft2(F));
H = fftshift(fft2(H));

G = F .* H;
r1 = ifft2(G);

% Adicionando ruído gaussiano com variância 100
for i = 1:1:sdl
    for j = 1:1:sdc
        r1(i,j) = r1(i,j) + abs(sqrt(100)*randn());
        G(i,j) = G(i,j) + abs(sqrt(100)*randn());
    end
end
ifftshow(r1,'ex7a.bmp');


r2 = G ./ H;

for i = 1:1:sdl
    for j = 1:1:sdc
        if(isnan(r2(i,j)) || isinf(r2(i,j)))
            r2(i,j) = 1;
        end
    end
end

r3 = ifft2(r2);

ifftshow(r3,'ex7b.bmp');


