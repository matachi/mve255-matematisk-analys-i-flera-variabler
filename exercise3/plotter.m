[X,Y]=meshgrid(linspace(-5,5), linspace(-5,5));
Z = (X.^2+X.*Y+5.*Y.^2+-Y).*exp(1).^(-(X.^2+Y.^2));
surfc(X,Y,Z);
%% Upg 2
for i=1:30
x = -i:0.5:i;
y = x;
z = y;
[X,Y,Z]=meshgrid(x, y, z);
V = (X.^3)./3+Y.^2+Z.^2-4.*X.*Y+7.*X+8;
isosurface(X,Y,Z,V);
end
%% Upg 2
for i=1:30
x = linspace(-i,i);
y = x;
z = y;
[X,Y,Z]=meshgrid(x, y, z);
V = (X.^3)./3+Y.^2+Z.^2-4.*X.*Y+7.*X+8;
isosurface(X,Y,Z,V);
end
%%
x = linspace(-30,30);
y = x;
z = y;
[X,Y,Z]=meshgrid(x, y, z);
V = (X.^3)./3+Y.^2+Z.^2-4.*X.*Y+7.*X+8;
for i=1:2
isosurface(X,Y,Z,V,i*10);
end