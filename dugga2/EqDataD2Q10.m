function [a, d, c, f] = EqDataD2Q10(x, tag, h, L)
E=1e7;                  % N/m^2 Young's modulus
R=0.01;
r=R*(1+h*x/L*(1-x/L));  % m radius
A=pi*r^2;               % m^2 area
a=E*A;
d=0; c=0; f=0;