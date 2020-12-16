clc;
clear all;
close all;

% Duomenu mokymo paruosimas 
x = 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
plot(x, d); % n
grid on; % n
hold on; % n

% Susigeneruojam rand vertes pagal isejimus w1, w2 and b
w1_1 = randn(1);
w2_1 = randn(1);
w3_1 = randn(1);
w4_1 = randn(1);

w1_2 = randn(1);
w2_2 = randn(1);
w3_2 = randn(1);
w4_2 = randn(1);

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
    
v1_1=x(1)*w1_1+b1_1;
v2_1=x(1)*w2_1+b2_1;
v3_1=x(1)*w3_1+b3_1;
v4_1=x(1)*w4_1+b4_1;

%Pritaikom aktyviaja funkcija
y1_1=1/(1+exp(-v1_1));
y2_1=1/(1+exp(-v2_1));
y3_1=1/(1+exp(-v3_1));
y4_1=1/(1+exp(-v4_1));

%Skaiciuojam antro sluoksnio isejimus
v=y1_1*w1_2+y2_1*w2_2+y3_1*w3_2+y4_1*w4_2;

y=v;

%Skaiciuojam klaida
e=d(1)-y;

% Atnaujinimas 
eta=0.15;
w1_2=w1_2+eta*e*y1_1;
w2_2=w1_2+eta*e*y2_1;
w3_2=w1_2+eta*e*y3_1;
w4_2=w1_2+eta*e*y4_1;

b=b+eta*e*1;

delta1=v1_1*(1-v1_1)*e*w1_2;
delta1=v1_1*(1-v1_1)*e*w1_2;
delta1=v1_1*(1-v1_1)*e*w1_2;
delta1=v1_1*(1-v1_1)*e*w1_2;








