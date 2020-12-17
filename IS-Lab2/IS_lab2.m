clc;
clear all;
close all;

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

for kartai = 0:1:10000
for x = 0.1:1/22:1
    % Generuojam d
    d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;

    % Skaiciuojam pirmo sluoksnio isejimus
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
    v=y1_1*w1_2+y2_1*w2_2+y3_1*w3_2+y4_1*w4_2+b1_2;

    y=v;
    
    % Skaiciuojam klaida, delta_out = e
    e=d-y;

    % Atnaujinam koeficientus: w = w + n * phi * y, n bet koks
    n=0.15;
    w1_2=w1_2+n*e*y1_1;
    w2_2=w2_2+n*e*y2_1;
    w3_2=w3_2+n*e*y3_1;
    w4_2=w4_2+n*e*y4_1;
    b1_2 = b1_2 + n * e;
    
    % Atnaujinam pirmo sluoksnio koeficientus
    % delta1 = phi1' * delta_out * W1_2
    % phi1' = y1_1(1-y1_1)

    delta1=(y1_1*(1-y1_1))*e*w1_2;
    delta2=(y2_1*(1-y2_1))*e*w2_2;
    delta3=(y3_1*(1-y3_1))*e*w3_2;
    delta4=(y4_1*(1-y4_1))*e*w4_2;

    w1_1=w1_1+n*delta1*x;
    w2_1=w2_1+n*delta2*x;
    w3_1=w3_1+n*delta3*x;
    w4_1=w4_1+n*delta4*x;

    b1_1=b1_1+n*delta1;
    b2_1=b2_1+n*delta2;
    b3_1=b3_1+n*delta3;
    b4_1=b4_1+n*delta4;
end
end

yf = [];
i = 0;

for x = 0.1:1/22:1
    % Generuojam d
    d = (1 + 0.6 * sin(2*pi*x/0.7)) + 0.3 * sin(2*pi*x) / 2;

    % Skaiciuojam pirmo sluoksnio isejimus
    v1_1=x*w1_1+b1_1;
    v2_1=x*w2_1+b2_1;
    v3_1=x*w3_1+b3_1;
    v4_1=x*w4_1+b4_1;

    % Pritaikom aktyviaja funkcija
    y1_1=1/(1+exp(-v1_1));
    y2_1=1/(1+exp(-v2_1));
    y3_1=1/(1+exp(-v3_1));
    y4_1=1/(1+exp(-v4_1));
    
    % Skaiciuojam antro sluoksnio isejimus, y = v
    i = i + 1;
    y = y1_1 * w1_2 + y2_1 * w2_2 + y3_1 * w3_2 + y4_1 * w4_2 + b1_2;
    yf = [yf, y];
end

x = 0.1:1/22:1;
d = (1 + 0.6 * sin(2*pi*x/0.7)) + 0.3 * sin(2*pi*x) / 2;
plot ( x, d, 'r*', x, yf, 'bx')








