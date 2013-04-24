function [ p, e ] = extremeFinder( f, x0, tol )

gradient = @(x)(jacobi(f, x)'); % gradient
p = newton(gradient, x0, tol);  % values when gradient is zero
h = jacobi(gradient, p);        % hesse matrix
e = eig(h);                     % egenvärden
end

