function v = funk3( u )

v = zeros(2,1);
u1 = u(1,1);
u2 = u(2,1);
u3 = u(3,1);
v(1,1) = sin(u1 + u2 * u3);
v(2,1) = cos(u1 * u2 * u3);