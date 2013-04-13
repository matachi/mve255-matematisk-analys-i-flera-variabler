MVE255, Matematisk analys i flera variabler M, 2012/13
======================================================

Daniel Jonsson, IT, Chalmers

[Course site](http://www.math.chalmers.se/Math/Grundutb/CTH/mve255/1213/)

Exercise 2
----------

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
