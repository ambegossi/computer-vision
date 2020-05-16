function [ ] = ifftshow(f, img_name)

f1 = abs(f);
fm = max(f1(:));
r = f1/fm;

figure, imshow(r);

% Ajuste faixa dinâmica
r = r - min(min(r));
r = 255 * (r / max(max(r)));

imwrite(uint8(r),img_name);
end

