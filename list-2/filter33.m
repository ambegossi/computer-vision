function [res] = filter33(img)
%{ 
Gera uma imagem cujos pixels correspondem à média da vizinhança-8 do respectivo
pixel da imagem original
%}
img = double(img)
[nl nc] = size(img)
res = zeros(nl,nc)
for i = 1:1:nl
    for j = 1:1:nc
        if (i~=1 && i~=nl && j~=1 && j~=nc)
            media = (img(i-1,j+1) + img(i,j+1) + img(i+1,j+1) + img(i-1,j) + img(i+1, j) + img(i-1,j-1) + img(i, j-1) + img(i+1, j-1)) / 8;
            res(i,j) = media;
        end
    end
end
end

