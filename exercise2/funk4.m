function v = funk4( u )

v = zeros(3,1);
u1 = u(1,1);
u2 = u(2,1);
u3 = u(3,1);
v(1,1) = 2*u1 + u2 + u3 - 4;
v(2,1) = u1 + 2*u2 + u3 - 4;
v(3,1) = u1*u2*u3 - 1;