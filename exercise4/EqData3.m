function [a, d, c, f] = EqData3(x, tag)
% Returns the values at x of the data a=a(x), d=d(x), c=c(x) and f=f(x) 
% in the differential equation D(-aDu)+dDu+cu=f.
% tag is a subdomain reference tag, which is not used in this example.
% 

a = 0;
if x < 1/2
    a=1;
elseif x > 1/2
    a=10;
end
d=0;
c=0;
f=x;
 