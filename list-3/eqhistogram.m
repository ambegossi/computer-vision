function [res] = eqhistogram(h, img)
% Equalizes a histogram and returns the resulting image

[nl nc] = size(img);
sum = 0;
res = zeros(nl, nc);

for i = 1:1:nl
    for j = 1:1:nc
        for k = 1:1:img(i,j)
            sum = sum + h(k);
        end
        r = (sum / (nl*nc)) * 255;
        res(i,j) = r;
        sum = 0;
    end
end

end

