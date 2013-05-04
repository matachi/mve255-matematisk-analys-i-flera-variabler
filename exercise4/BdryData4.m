function [k, uA, g] = BdryData4(x, tag)
P=9.81;   % N the force
if tag==1  k=1e8; uA=0; g=0; end
if tag==2  k=0;   uA=0; g=P; end
