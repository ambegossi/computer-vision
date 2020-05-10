function [res] = av_filter(img, mask)
%{ 
Gera uma imagem cujos pixels correspondem à média da vizinhança do respectivo
pixel da imagem original. Vizinhança de área 9x9.
%}
[nl nc] = size(img)
res = zeros(nl,nc)
halfmask = fix(mask/2);

for i = 1:1:nl
    for j = 1:1:nc
        if (i>halfmask && i<(nl-halfmask) && j>halfmask && j<=(nc-halfmask))
            media = 0;
            for k = i-halfmask:1:i+halfmask
                for r = j-halfmask:1:j+halfmask
                    if (k~=i || r~=j)
                        media = media + img(k,r);
                end
            end
            res(i,j) = media / (mask*mask);
        end
    end
end
end