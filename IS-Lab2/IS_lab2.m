clc;
close all;
clear all;

% Susigeneruojam rand vertes pagal isejimus w1, w2 and b
w1_1 = randn(1);
w2_1 = randn(1);
w3_1 = randn(1);
w4_1 = randn(1);

w1_2 = randn(1);
w2_2 = randn(1);
w3_2 = randn(1);
w4_2 = randn(1);

b0=rand(1);
b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);

b1_2 = randn(1);

% Skaiciuojame pirmos sluoksnio isejimus (ja reiks 20 kartu prasukti)
% for index 1:20
%     v1.1=x(index)*w1.1+b1.1;
%     v2.1=x(index)*w2.1+b2.1;
%     v3.1=x(index)*w3.1+b3.1;
%     v4.1=x(index)*w4.1+b4.1;

for kartai = 0:1:800
for x = 0.1:1/22:1
%1. generuojamas d
d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
plot(x, d); % n
grid on; % n
hold on; % n

%y=zeros(1:46);
%e_all=800;
%while e_all~=0
%for index=1:46

% Skaiciuojami pirmo sluoksnio isejimai
    v1_1=x*w1_1+b1_1;
    v2_1=x*w2_1+b2_1;
    v3_1=x*w3_1+b3_1;
    v4_1=x*w4_1+b4_1;
    
% Pritaikom aktyviaja funkcija
    y1_1=1/(1+exp(-v1_1));
    y2_1=1/(1+exp(-v2_1));
    y3_1=1/(1+exp(-v3_1));
    y4_1=1/(1+exp(-v4_1));
    
% Skaiciuojam antro sluoksnio isejimus
    v=y1_1*w1_2+y2_1*w2_2+y3_1*w3_2+y4_1*w4_2;
    
    y=v;
    
% Skaiciuojam klaida, delta_out = e
    e=d-y;
    
% Atnaujinami koeficientai: w = w + n * phi * y, n bet koks 0:1
    n=0.15;
    w1_2=w1_2+n*e*y1_1;
    w2_2=w2_2+n*e(*y2_1;
    w3_2=w3_2+n*e*y3_1;
    w4_2=w4_2+n*e*y4_1;
    
    % b0=b0+eta*e(index)*1;
%3.2 atnaujinami pirmo sluoksnio koeficientai
%delta1 = phi1' * delta_out * W1_2
%phi1' = y1_1(1-y1_1)

    delta1=(y1_1*(1-y1_1))*e*w1_2;
    delta2=(y2_1*(1-y2_1))*e*w2_2;
    delta3=(y3_1*(1-y3_1))*e*w3_2;
    delta4=(y4_1*(1-y4_1))*e*w4_2;
    
    w1_1=w1_1*n*delta1*x;
    w2_1=w2_1*n*delta2*x;
    w3_1=w3_1*n*delta3*x;
    w4_1=w4_1*n*delta4*x;
    
    b1_1=b1_1+n*delta1;
    b2_1=b2_1+n*delta2;
    b3_1=b3_1+n*delta3;
    b4_1=b4_1+n*delta4;
end

for index=1:46
    v1_1=x((index))*w1_1+b1_1;
    v2_1=x((index))*w2_1+b2_1;
    v3_1=x((index))*w3_1+b3_1;
    v4_1=x((index))*w4_1+b4_1;

    %Pritaikom aktyviaja funkcija
    y1_1=1/(1+exp(-v1_1));
    y2_1=1/(1+exp(-v2_1));
    y3_1=1/(1+exp(-v3_1));
    y4_1=1/(1+exp(-v4_1));
    
    yf(index)=y1_1*w1_2+y2_1*w2_2+y3_1*w3_2+y4_1*w4_2+b0;
end
plot(x,yf,'*');








