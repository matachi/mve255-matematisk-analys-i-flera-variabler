function v=funk(a)
x = a(1,1);
y = a(2,1);
z = a(3,1);
v = zeros(5,1);
v(1,1) = sin(x*y*z);
v(2,1) = cos(x*y*z);
v(3,1) = x*y*z;
v(4,1) = x*y+z;
v(5,1) = x+y+z;