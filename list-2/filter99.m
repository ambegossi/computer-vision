function [res] = filter99(img)
%{ 
Gera uma imagem cujos pixels correspondem à média da vizinhança do respectivo
pixel da imagem original. Vizinhança de área 9x9.
%}
img = double(img)
[nl nc] = size(img)
res = zeros(nl,nc)
for i = 1:1:nl
    for j = 1:1:nc
        if (i>=5 && i<=(nl-4) && j>=5 && j<=(nc-4))
            media = 0;
            for k = i-4:1:i+4
                for r = j-4:1:j+4
                    if (k~=i || r~=j)
                        media = media + img(k,r);
                end
            end
            res(i,j) = media / 80;
        end
    end
end
end