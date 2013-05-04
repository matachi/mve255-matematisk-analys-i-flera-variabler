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

## Exercise 4

### FEM1 1.4

    n=101;
    p=linspace(0,1,n);
    t=[1:n-1; 2:n; ones(1,n-1)];
    e=[1 n; 1 2];
    [U, A, b] = MyPoissonSolver(p, t, e, @EqData14, @BdryData14);
    U2 = p./2.*(1.-p); % real solution
    plot(p,U,p,U2)

### FEM1 1.5

    [U, A, b] = MyPoissonSolver(p, t, e, @EqData15, @BdryData15);
    U2 = -p.^2./2 + p + 1; % real solution
    plot(p,U,p,U2)

### Problem 3

    [U, A, b] = MyPoissonSolver(p, t, e, @EqData3, @BdryData3);
    plot(p,U)

Explanation: a(x) = The thermal conductivity coefficient. Half-way through the
plate there is another material with 10 times higher thermal conductivity as
the material to the left. So it will lead heat 10 times better and get 1/10th
as hot.

### Problem 4

[Analogy between thermal conductivity and
mechanic](http://www.math.chalmers.se/Math/Grundutb/CTH/mve255/1213/lectures/fem1.pdf#page=6&zoom=133,0,616)
(In Firefox the link will go to the correct page and position):  
a ↔ EA  
j ↔ N  
g ↔ P  
f ↔ KxA

    [U, A, b] = MyPoissonSolver(p, t, e, @EqData4, @BdryData4);
    plot(p,U)

### FEM1 Intro - Stången/The Rod

[Stången: Introduktion till MyPoisson och Dugga
2](http://www.math.chalmers.se/Math/Grundutb/CTH/mve255/1213/lectures/fem1-intro.pdf)

#### [Example 1](http://www.math.chalmers.se/Math/Grundutb/CTH/mve255/1213/lectures/fem1-intro.pdf#page=1&zoom=133,0,145)

    L=1;    % the length of the rod
    n=101;  % the number of points, n-1 is the number of intervals
    p=linspace(0,L,n);
    t=[1:n-1; 2:n; ones(1,n-1)];
    e=[1 n; 1 2];
    [U,A,b]=MyPoissonSolver(p,t,e,@EqDataStang11, @BdryDataStang11);
    plot(p,U)
    dL=U(end) % the extension of the rod

#### [Example 2](http://www.math.chalmers.se/Math/Grundutb/CTH/mve255/1213/lectures/fem1-intro.pdf#page=2&zoom=133,0,85)

Radius as a parameter:

    L=1;    % the length of the rod
    n=101;  % the number of points, n-1 is the number of intervals
    p=linspace(0,L,n);
    t=[1:n-1; 2:n; ones(1,n-1)];
    e=[1 n; 1 2];

    P=10;   % N force
    r=0.01; % m radius
    EqData=@(x,tag) EqDataStang12(x,tag,r);
    BdryData=@(x,tag) BdryDataStang12(x,tag,P);
    [U,A,b]=MyPoissonSolver(p,t,e,EqData,BdryData);
    dL=U(end) % the extension of the rod
    plot(p,U)

Plot a table with the two columns *radius of rod* and *extension*.

    P=10;   % N
    BdryData=@(x,tag)BdryDataStang12(x,tag,P);
    rr=[]; dL=[];
    for r=0.01:.001:0.03
        EqData=@(x,tag)EqDataStang12(x,tag,r);
        [U,A,b]=MyPoissonSolver(p,t,e,EqData,BdryData);
        dL=[dL;U(end)];     % save the extension in a column matrix
        rr=[rr;r];          % save the radius in a column matrix
    end
    [rr,dL]                 % display a table

If we want the rod to extend 0.001 units, we can use the function
[stangfunk](exercise4/stangfunk.m) and solve it using
[newton](exercise2/newton.m) to get the most optimal radius of the rod:

    R=newton(@stangfunk,.01,1e-6)

