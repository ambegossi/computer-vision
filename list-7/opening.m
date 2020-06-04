function [res] = opening(img, elem)

res = erosion(img,elem);

res = dilation(res,elem);

end

