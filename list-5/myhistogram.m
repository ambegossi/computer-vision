function [h] = histogram(img, res_name)
% Function that calculates the histogram of an image

h = zeros(1,256);
x = 0:1:255;

[nl nc] = size(img);

for i = 1:1:nl
    for j = 1:1:nc
        h(img(i,j)+1) = h(img(i,j)+1) + 1;
    end
end

area(x,h);
xlim([0 255]);
saveas(gcf,res_name);

end

