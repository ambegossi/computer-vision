function [Res] = aprox_bilinear(im_in,im_ref)
%{
Algoritmo de registro baseado em aproximações bilineares para
registrar a imagem "im_in" com a imagem de referência "im_ref"
%}

%{
p1r = [088 134]; // Centro da unha do indicador
p1i = [106 302]; // Centro da unha do indicador
p2r = [459 129]; // Centro da unha do minguinho
p2i = [345 173]; // Centro da unha do minguinho
p3r = [252 526]; // Junção das veias próximas ao polegar
p3i = [287 500]; // Junção das veias próximas ao polegar
p4r = [033 414]; // Base da unha do polegar
p4i = [130 500]; // Base da unha do polegar
%}

[nl nc] = size(im_in);
Res = zeros(nl,nc);
M = zeros(8,8);

pf = [134;129;526;414;088;459;252;033];
pi = [302;173;500;500;106;345;287;130];

for i=1:1:4
    M(i,1) = pi(i);
    M(i,2) = pi(i+4);
    M(i,3) = pi(i)*pi(i+4);
    M(i,4) = 1;
    M(i+4,5) = pi(i);
    M(i+4,6) = pi(i+4);
    M(i+4,7) = pi(i)*pi(i+4);
    M(i+4,8) = 1;
end

 w = zeros(8,1);
 w = inv(M) * pf;
 
 for i = 1:1:nl
    for j = 1:1:nc
        cf = w(1)*j + w(2)*i + w(3)*j*i + w(4);
        lf = w(5)*j + w(6)*i + w(7)*j*i + w(8);
        cf = fix(cf);
        lf = fix(lf);
        if (lf>0 && lf<nl && cf>0 && cf<nc)
            Res(lf,cf) = im_in(i,j);
        end
    end
 end
 
end

