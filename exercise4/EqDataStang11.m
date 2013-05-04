function [a, d, c, f] = EqDataStang11(x, tag)
E=1e7;      % N/m^2 Young's modulus
r=0.01;     % m radius
A=pi*r^2;   % m^2 area
a=E*A;
d=0; c=0; f=0;