MVE255, Matematisk analys i flera variabler M, 2012/13
======================================================

Daniel Jonsson, IT, Chalmers

[Course site](http://www.math.chalmers.se/Math/Grundutb/CTH/mve255/1213/)

## Exercise 2

    >> jacobi(@funk2, [1;2])

    ans =

       -4.0000         0
       -2.0000   -1.0000

    >> newton(@funk2, [1;1], 0.1)

    ans =

        1.0000
        2.0000

    >> newton(@funk2, [-2;-1], 10^-6)

    ans =

       -1.0000
       -2.0000

### Dugga 1

#### Question 1

    >> jacobi(@funk3, [1;2;3])

    ans =

        0.7539    2.2617    1.5078
        1.6765    0.8382    0.5588

#### Question 4

    >> newton(@funk4, [-1;-1;-5], 10^-6)

    ans =

       -0.4343
       -0.4343
        5.3028

    >> newton(@funk4, [-1;-1;-1], 10^-6)

    ans =

        1.0000
        1.0000
        1.0000

#### Question 5

Plot `f(x,y) = (2x + y - 3)^2 + (x*y - 1)^2` in Matlab:

    >> x = -5:.5:5;
    >> y = x;
    >> [X, Y] = meshgrid(x, y);
    >> Z = (2.*X + Y - 3).^2 + (X.*Y - 1).^2;
    >> surfc(X, Y, Z);

[meshgrid documentation](http://www.mathworks.se/help/matlab/ref/meshgrid.html)
[plot3 documentation](http://www.mathworks.se/help/matlab/ref/plot3.html)

Other way to set x and y:

    >> x = linspace(-10,10);
    >> y = x;

## Exercise 3

The PDF hand-in document:
[exercise3/documentation.pdf](exercise3/documentation.pdf). This contains all
found extreme points, eigenvalues and a bunch of images.  
The [Google Docs version can be accessed
here](https://docs.google.com/document/d/1TpmuT33LReuyjWPvGgq1A2E5tpHZDUubNsesFsPfhVM/edit).
Anyone has access to view the document and write comments in it.

### Part 1

[extremeFinder](exercise3/extremeFinder.m) finds an extreme point close to
[0;0]:

    >> [p, e] = extremeFinder(@ex3funk1, [0;0], 10e-5)
    p =
       -0.4214
        0.1330
    e =
        2.3243
        8.9020

p = Coordinate for the point, (-0.4214, 0.1330).  
e = Eigenvalues for the Hessian matrix. Both are positive, meaning it's
positive definite and it's a local minimum point.

### Part 2

    >> [p, e] = extremeFinder(@ex3funk2, [0;0;0], 10e-5)
    p =
        1.0000
        2.0000
             0
    e =
       -2.0000
        2.0000
        6.0000

The Hessian is indefinite, because there are both positive and negative
eigenvalues. Therefore it's a saddle point.
