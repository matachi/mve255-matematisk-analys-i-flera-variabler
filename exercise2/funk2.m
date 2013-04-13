function v = funk2( u )

v = zeros(2,1);
u1 = u(1,1);
u2 = u(2,1);
v(1,1) = u2*(1-u1^2);
v(2,1) = 2-u1*u2;