function [res] = transf_linear(img,p1,p2)

a1 = ((p1(2)-0) /(p1(1)-0))
b1 = p1(2)-(a1*p1(1))

a2 = ((p1(2)-p2(2)) / (p1(1)-p2(2))) 
b2 = p1(2)-(a2*p1(1))

a3 = ((p2(2)-255) / (p2(1)-255))
b3 = p2(2)-(a3*p2(1))

[nl nc] = size(img);
res = zeros(nl,nc);

for i = 1:1:nl
    for j = 1:1:nc
        if (img(i,j)>= 0 && img(i,j)<= p1(1))
            res(i,j) = a1 * img(i,j) + b1;
        elseif (img(i,j) > p1(1) && img(i,j) <=p2(1))
            res(i,j) = a2 * img(i,j) + b2;
        else
            res(i,j) = a3 * img(i,j) + b3;
        end
            
    end
end

end

