function x = newton(f,x0,tol)
% Newton's method for the system of equations f(x)=0
% 
%   Syntax: 
%           x = newton(f,x0,tol)
%   Arguments: 
%           f - function handle pointing to a function file  
%               which returns an nx1 matrix y=f(x).  
%           x0 - an nx1 matrix, the initial approximation
%           tol - a positive number, the tolerance 
%   Returns: 
%           x - an nx1 matrix, an approximate solution 
%   Description:
%           The program newton uses Newton's method to compute an 
%           approximate solution of the system of equations f(x)=0.  
%           The file f.m must return an nx1 matrix y=f(x).  
%           The Jacobi matrix A=Df(x) is computed by the subfunction
%           jacobi.m below.  
%           Here x, x0, y are of type nx1 and A is of type nxn.
%           If the initial approximation x0 is sufficiently close 
%           to an exact root x_exact, then the program
%           computes an approximate solution x with the error
%           |x-x_exact| < tol.  
%   Examples: 
%          x = newton(@sin, 3, 1e-7) computes pi to 7 decimals
%
%          If the m-file funk1.m contains 
%          function y = funk1(x)
%          y=x.^2-2;
%
%          then the command 
%          x = newton(@funk1, 3, 1e-7) 
%          computes the square root of 2. 
%   See also:
%          bisec.m, fixpoint.m
%

%----------------------------------------------------------------------
%   Date created: 
%
%   Author:  
%------------------------------+---------------------------------------+
format long;
h = 1;
n = length(x0);
x = x0;

while abs(h) > tol
    A = jacobi(f, x);
    b = -f(x);
    h = A\b;
    x = x+h;
end

