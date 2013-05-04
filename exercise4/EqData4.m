function [a, d, c, f] = EqData4(x, tag)
E=1e7;      % N/m^2 Young's modulus
A=1;        % m^2 area
p=1e3;      % kg/m^3
% E: https://en.wikipedia.org/wiki/Young%27s_modulus#Approximate_values
% p: http://en.wikipedia.org/wiki/Densities_of_the_elements_(data_page)
if x <= 1/2 % Aluminum
    E = E * 7;
    p = p * 3;
elseif x > 1/2 % Iron
    E = E * 22;
    p = p * 8;
end
a=E*A;
f=p;
d=0; c=0;