function [k, uA, g] = BdryData3(x, tag)
% Returns the values at x of the data  k=k(x), uA=uA(x), and  g=g(x)
% in the boundary condition  a Dn u+k(u-uA)=g.
% tag=1 specifies the left boundary point.
% tag=2 specifies the right boundary point.
% uA is the ambient temperature. 
% g is the prescribed rate of heat influx. 
% k is the heat transfer coefficient of the boundary. 
% k=infinity  means  u=uA (in practice we use a very large number k=1e8) 
% 
    if tag==1  k=1e8; uA=0; g=0; end
    if tag==2  k=1e8; uA=0; g=0; end
