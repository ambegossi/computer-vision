function [res] = convolution(img, mask)
% Function that performs the filtering (convolution) of an image of
% any input by any mask (filter).
% Ignores pixels near borders.

[nl nc] = size(img);
[mnl mnc] = size(mask);
res = zeros(nl,nc);
out = 0;

for i = 1:1:nl
    for j = 1:1:nc
        imgi = i-fix(mnl/2);
        imgj = j-fix(mnc/2);
        if(i-fix(mnl/2) > 0 && i+fix(mnl/2)<=nl && j-fix(mnc/2) > 0 && j+fix(mnc/2)<=nc)
            for k = 1:1:mnl
                for l = 1:1:mnc
                    out = mask(k,l) * img(imgi,imgj) + out;
                    imgj = imgj + 1;
                end
                imgj = j-fix(mnc/2);
                imgi = imgi + 1;
            end
            res(i,j) = out;
            out = 0;
        end
    end
end

end

