
clc;
clear all;
close all;

x = [0.1:1/22:1]; %input values are generated using equation x = 0.1: 1/22: 1; 
                                 
out = sin(2*pi*x)/2; % output 
% desired output values are calculated using formula: 
% y = (1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2; 

w = [randn(1) randn(1) randn(1)];
b = randn(1);
num = 0.1;

% c1 ir c2, r1 ir r2 parinkame rankiniu bûdu
c = [0.6 0.9]; 
r = [0.5 0.4]; 

for e=1:100
   for n=1:20
        y = gauss(x(n),r(1),c(1))*w(1)+gauss(x(n),r(2),c(2))*w(2)+b;
        err = out(n) - y; 
        b = b + num*err;
        w(1) = w(1) + num*err*gauss(x(n),r(1),c(1));
        w(2) = w(2) + num*err*gauss(x(n),r(2),c(2));
   end
   e = e - 1;
end

yy = gauss(x,r(1),c(1))*w(1)+gauss(x,r(2),c(2))*w(2)+b;

figure(1)
plot(x,out,'g',x,yy,'b'); 
title('Pokycio grafikas panaudojant apmokyma')
legend('Pries apmokyma', 'Po apmokymo')
grid on;
hold on;
 

function F = gauss(x,r,c)                                   
    F = exp(-(x-c).^2/(2*r.^2)); % two Gaussian radial basis functions: F = exp(-(x-c)^2/(2*r^2
end

