function [res] = closing(img, elem)

res = dilation(img,elem);

res = erosion(res,elem);

end

