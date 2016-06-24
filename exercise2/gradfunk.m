function g=gradfunk(x)
g=jacobi(@funk2, x);
g=g';