function [res] = erosion(img,elem)

[nl nc] = size(img);
[nle nce] = size(elem);

% posição central da estrutura
pivot = fix(nle/2);

res = zeros(nl,nc);

for i = 1:1:nl
    for j = 1:1:nc
        covered = 1;
        if(img(i,j)==1)
            elemi = 1;
            for k=i - pivot:1:(i-pivot)+nle-1
                if (covered == 0)
                    break;
                end
                elemj = 1;
                for l=j - pivot:1:(j-pivot)+nce-1
                    if(elem(elemi,elemj)==1)
                        if (((k<1 || k>nl) || (l<1 || l>nc)))
                            covered = 0;
                            break;
                        elseif(img(k,l)==0)
                            covered = 0;
                            break;
                        end  
                    end
                    elemj = elemj + 1;
                end
                elemi = elemi + 1;
            end
            if(covered == 0)
                res(i,j)=0;
            else
                res(i,j)=1;
            end
        end

    end
end

end

