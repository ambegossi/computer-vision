function [Res] = rotate(Img,t)
r = ones(1,3);
[nl nc] = size(Img);
Res = zeros(nl,nc);

T = [cosd(t) sind(t) 0; -sind(t) cosd(t) 0; 0 0 1];

for i = 1:1:nl
    for j = 1:1:nc
        r(1) = i;
        r(2) = j;
        s = r * T;
        s(1) = abs(round(s(1)));
        s(2) = abs(round(s(2)));
        if ((s(1) && s(2)) ~= 0)
            Res(s(1),s(2)) = Img(i,j);
        end
    end
end
end
