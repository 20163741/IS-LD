x = [0.1:1/22:1]; %input values are generated using equation x = 0.1: 1/22: 1; 
                  
                  
out = sin(2*pi*x)/2; % output 
% desired output values are calculated using formula: 
% y = (1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2; 

% - kuriamas neuronø tinklas turëtø "modeliuoti/imituoti ðios formulës elgesá" 

w = [randn(1) randn(1) randn(1)];
b = randn(1);

nu = 0.1;

%centrø reikðmes c1 ir c2, spinduliø reikðmes r1 ir r2 parinkite rankiniu bûdu;
c = [0.5 0.8]; %c1 ir c2
r = [0.4 0.3]; %r1 ir r2
%-------------------------------------------------------------------------------------

for e=1:100
   for n=1:20
    y = gauss(x(n),r(1),c(1))*w(1)+gauss(x(n),r(2),c(2))*w(2)+b;
    err = out(n) - y; 
    b = b + nu*err;
    w(1) = w(1) + nu*err*gauss(x(n),r(1),c(1));
    w(2) = w(2) + nu*err*gauss(x(n),r(2),c(2));
   end
   e = e - 1;
end

yy = gauss(x,r(1),c(1))*w(1)+gauss(x,r(2),c(2))*w(2)+b;

figure
plot(x,out,'red',x,yy,'blue'); 
title('raudona kreive pries apmokymà, o mëlyna po apmokymo')
grid on;
 
%-------------------------------------------------------------------------------------
function F = gauss(x,r,c)     
                              %dvi spindulio tipo funkcijos 
                              %(naudokite Gauso funkcijas: F = exp(-(x-c)^2/(2*r^2));
F = exp(-(x-c).^2/(2*r.^2));
end