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
X1 = fftshift(X1);

[I3r I3i] = pol2cart(angle(X2),abs(X1));
i3 = real(ifft2(I3r+I3i*1i));
% Ajuste da faixa dinâmica
i3 = i3 - min(min(i3));
i3 = 255 * (i3 / max(max(i3)));

imwrite(uint8(i3),'ex2-i3.bmp');