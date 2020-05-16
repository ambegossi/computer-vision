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
sd = (nli + nlm) - 1;

F = zeros(sd,sd);
H = zeros(sd,sd);

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
r2 = ifft2(r2);
ifftshow(r2,'ex6b.bmp');