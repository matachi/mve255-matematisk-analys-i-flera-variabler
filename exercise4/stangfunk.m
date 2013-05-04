function y = stangfunk(r)
L=1;    % the length of the rod
n=101;  % the number of points, n-1 is the number of intervals
p=linspace(0,L,n);
t=[1:n-1; 2:n; ones(1,n-1)];
e=[1 n; 1 2];
P=10;
EqData=@(x,tag)EqDataStang12(x,tag,r);
BdryData=@(x,tag)BdryDataStang12(x,tag,P);
[U,A,b]=MyPoissonSolver(p,t,e,EqData,BdryData);
dL=U(end);
y=dL-0.001;
end