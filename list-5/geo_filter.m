function [res] = geo_filter(img, mask)

[nl nc] = size(img)
res = zeros(nl,nc)
halfmask = mask/2;

for i = 1:1:nl
    for j = 1:1:nc
        if (i>fix(halfmask) && i<(nl-fix(halfmask)) && j>fix(halfmask) && j<(nc-fix(halfmask)))
            out = 1;
            for k = i-fix(halfmask):1:i+fix(halfmask)
                for r = j-fix(halfmask):1:j+fix(halfmask)
                        out = out * img(k,r);
                end
            end
            res(i,j) = out ^ (1/(mask*mask));
        end
    end
end
end