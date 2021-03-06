% Exercício 1 -----------------------------------------------------
img = imread('parafuso2.jpg')
img = double(img)

X = fft2(img); % Calcula a fft da img e retorna uma variável complexa
X = fftshift(X); % Ajusta o espectro colocando o centro na origem
module = abs(X); 
phase = angle(X);

% Módulo da fft - escala linear
% Ajuste da faixa dinâmica
mres = module - min(min(module));
nmres = 255 * (mres / max(max(mres)));

% Módulo da fft - escala log
module = log10(module + 1E-6);
% Ajuste da faixa dinâmica 
mreslog = module - min(min(module));
nmreslog = 255 * (mreslog / max(max(mreslog)));

% Fase da fft
% Ajuste da faixa dinâmica
pres = phase - min(min(phase));
npres = 255 * (pres / max(max(pres)));

nmres = uint8(nmres);
imwrite(nmres,'ex1-modulefft-linear.bmp');
nmreslog = uint8(nmreslog);
imwrite(nmreslog,'ex1-modulefft-log.bmp');
npres = uint8(npres);
imwrite(npres,'ex1-phasefft2.bmp');

% Exercício 2 -----------------------------------------------------
img2 = imread('parafusos2.jpg')
img2 = double(img2)

X2 = fft2(img2); % Calcula a fft da img e retorna uma variável complexa
X2 = fftshift(X2); % Ajusta o espectro colocando o centro na origem
module2 = abs(X2); 
phase2 = angle(X2);

% Módulo da fft - escala log
module2 = log10(module2 + 1E-6);
% Ajuste da faixa dinâmica 
module2 = module2 - min(min(module2));
module2 = 255 * (module2 / max(max(module2)));

% Fase da fft
% Ajuste da faixa dinâmica
phase2 = phase2 - min(min(phase2));
phase2 = 255 * (phase2 / max(max(phase2)));

imwrite(uint8(module2),'ex2-modulefft-log.bmp');
imwrite(uint8(phase2),'ex2-phasefft2.bmp');

% Módulo da Imagem 1 + Fase da Imagem 2
img1 = imread('parafuso2.jpg')
img1 = double(img1)

X1 = fft2(img1); 
X2 = fft2(img2);

[I3r I3i] = pol2cart(angle(X2),abs(X1));
i3 = real(ifft2(I3r+I3i*1i));
% Ajuste da faixa dinâmica
i3 = i3 - min(min(i3));
i3 = 255 * (i3 / max(max(i3)));

imwrite(uint8(i3),'ex2-i3.bmp');

% Exercício 3 -----------------------------------------------------
img = imread('parafuso2.jpg')
img = double(img)

% Filtragem no domínio espacial
mask = [1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25; 
        1/25 1/25 1/25 1/25 1/25;
        1/25 1/25 1/25 1/25 1/25];

tic
res = convolution(img, mask);
toc

% Elapsed time is 0.078093 seconds.

imwrite(uint8(res),'ex3-conv.bmp');

% Filtragem no domínio da frequência

[nli nci] = size(img);
[nlm ncm] = size(mask);

sd = (nli + nlm) - 1;

Xp = zeros(sd,sd);
Mp = zeros(sd,sd);

% Zero padding
for i = 1:1:nli
    for j = 1:1:nci
        Xp(i,j) = img(i,j);
    end
end

% Zero padding
for i = 1:1:nlm
    for j = 1:1:ncm
        Mp(i,j) = mask(i,j);
    end
end

tic
Xp = fftshift(fft2(Xp));
Mp = fftshift(fft2(Mp));

r = Xp .* Mp;
r = ifft2(r);
toc

ifftshow(r);

% Filtragem no domínio espacial
% Elapsed time is 0.078093 seconds.

% Filtragem no domínio da frequência
% Elapsed time is 0.008143 seconds.

% Exercício 4 -----------------------------------------------------
img = imread('parafuso2.jpg')
img = double(img)

Xp = fftshift(fft2(img));

[nlX ncX] = size(Xp);

nl = nlX/2 - 30;
nc = ncX/2 - 30;

for i = nl:1:nl+60
    for j = nc:1:nc+60
        Xp(i,j) = 0;
    end
end

r = ifft2(Xp);

ifftshow(r);