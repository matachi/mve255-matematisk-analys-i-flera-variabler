function A=jacobi(f,x)
% Computes the derivative (Jacobi matrix) A=Df(x) of the function f at x.
% 
%   Syntax: 
%           A = jacobi(f,x)
%   Arguments: 
%           f - function handle pointing to a function file  
%               which returns an mx1 matrix y=f(x).  
%           x - an nx1 matrix
%   Returns: 
%           A - an mxn matrix, the Jacobian of f 
%   Description:
%           The program jacobi uses a central difference quotient
%           to compute an approximation of the Jacobi matrix A=Df(x)
%           The file f.m must return an mx1 matrix y=f(x).  
%           The stepsize is h=1e-5.  
%           The optimal stepsize for the central difference quotient is 
%           h = (df/Kf)^(1/3), where df=1e-16 is the error in f(x) and 
%           Kf is the constant in Taylor's formula,
%           f(x)=f(a)+f'(a)(x-a)+0.5 f''(a)(x-a)^2 + Ef, |Ef| < Kf|x-a|^3.
%           The error is then 2(df)^(2/3)(Kf)^(1/3), approximately 1e-10.
%   Examples: 
%          z = jacobi(@sin, 0) returns 1.
%
%          If the m-file funk1.m contains 
%            function y = funk1(x)
%            y=x.^2-2;
%
%          then the command 
%            z = jacobi(@funk1, 3) returns 6.
%
%          If the m-file funk1.m contains 
%            function y = funk2(x)
%            y=x'*x;
%
%          then the command 
%            A = jacobi(@funk2, [1;2;3]) returns [2 4 6]. 
%   See also:
%

%----------------------------------------------------------------------
%   Date created: 
%
%   Author:  
%------------------------------+---------------------------------------+

delta = 10^-5;
n = length(x);
m = length(f(x));
A = zeros(m, n);

for j=1:n
    h = zeros(n, 1);
    h(j, 1) = delta;
    v = (f(x+h)-f(x-h))/2/delta;
    A(:,j) = v;
end