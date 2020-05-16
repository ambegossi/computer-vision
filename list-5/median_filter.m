function [res] = median_filter(img, mask)


[nl nc] = size(img)
res = zeros(nl,nc)
halfmask = fix(mask/2);

for i = 1:1:nl
    for j = 1:1:nc
        if (i>halfmask && i<(nl-halfmask) && j>halfmask && j<=(nc-halfmask))
            m = 0;
            for k = i-halfmask:1:i+halfmask
                for r = j-halfmask:1:j+halfmask
                     m = [m img(k,r)];
                end
            end
            m = m(2:end);
            res(i,j) = median(m);
        end
    end
end
end