function [ ] = ifftshow(f)

f1 = abs(f);
fm = max(f1(:));
r = f1/fm;

figure, imshow(r);

end

