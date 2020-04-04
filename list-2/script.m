% 1)
img = imread('ex2.bmp')
img = double(img)
res = img - min(min(img))
nres = 255 * (res / max(max(res)))
nres = uint8(nres)
imwrite(nres,'ex2after.bmp')

% 2) a)
fg = imread('fg00009.bmp')
bg = imread('bg00010.bmp')
fg = double(fg)
bg = double(bg)
res = fg - bg
res = uint8(res)
imwrite(res,'2a.bmp')

% 2) b)
fg = imread('fg00009.bmp')
bg = imread('bg00010.bmp')
fg = double(fg)
bg = double(bg)
dif = fg - bg
res = dif - min(min(dif))
nres = 255 * (res/ max(max(res)))
nres = uint8(nres)
imwrite(nres,'2b.bmp')

% 2) c)
fg = imread('fg00009.bmp')
bg = imread('bg00010.bmp')
fg = double(fg)
bg = double(bg)
res = imabsdiff(fg,bg)
res = uint8(res)
imwrite(res,'2c.bmp')

% 2) d)
fg = imread('fg00009.bmp')
bg = imread('bg00010.bmp')
fg = double(fg)
bg = double(bg)
dif = imabsdiff(fg,bg)
res = dif - min(min(dif))
nres = 255 * (res/ max(max(res)))
nres = uint8(nres)
imwrite(nres,'2d.bmp')

% 2) e) 
fg = imread('fg00009.bmp')
bg = imread('bg00010.bmp')
fg = double(fg)
bg = double(bg)

% Diferença absoluta das imagens
dif = imabsdiff(fg,bg)

% Ajuste da faixa dinâmica 
res = dif - min(min(dif))
nres = 255 * (res/ max(max(res)))

% Apagando pixels do background
[nl nc] = size(nres)
for i = 1:1:nl
    for j = 1:1:nc
        if (nres(i,j) <= 50) 
            nres(i,j) = 0;
        end
    end
end
nres = uint8(nres)
imwrite(nres,'2e.bmp')

% 3)
fg = imread('fg00009.bmp')
bg = imread('bg00010.bmp')
res = dif(fg,bg);
res = uint8(res)
imwrite(res,'3.bmp')

% 4) a)
fg = imread('fg00009.bmp')
res = filter33(fg);
res = uint8(res);
imwrite(res,'4a.bmp');

% 4) b)
fg = imread('fg00009.bmp')
res = filter99(fg);
res = uint8(res)
imwrite(res,'4b.bmp');

% 5)
fg = imread('fg00009.bmp')
fg = double(fg);
res = rotate(fg, 30);
res = uint8(res);
imwrite(res,'5.bmp');

% 6) 
fg = imread('fg00009.bmp')
fg = double(fg);
res = rotate(fg, 90);
res = uint8(res);
imwrite(res,'6-90.bmp');

% 7) 
im_in = imread('im_in.bmp');
im_ref = imread('im_ref.bmp');
im_in = double(im_in);
im_ref = double(im_ref);
res = aprox_bilinear(im_in,im_ref);
res = uint8(res);
imwrite(res,'7.bmp');