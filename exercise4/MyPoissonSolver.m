function [U, A, b] = MyPoissonSolver(p, t, e, EqData, BdryData)
% Syntax:  
%           [U, A, b] = MyPoissonSolver(p, t, e, EqData, BdryData)
%
% Purpose:  Solves  D(-aDu)+dDu+cu=f  in an interval  I  with
%           boundary conditions  a Dn u+k(u-uA)=g  at the endpoints of  I,
%           where  Dn u  denotes the derivative in the outward direction 
%           and  g  denotes a prescribed influx rate.  The solver is based 
%           on the piecewise linear finite element method. 
%           
%        p  1 x n vector of node coordinates.
%
%        t  3 x m matrix of element node numbers t(1,el)=nn1
%           and t(2,el)=nn2, 1 <= el <= m, pointing to 
%           corresponding node coordinates p(nn1) and p(nn2),
%           and subdomain reference tags t(3,el), useful
%           if the data are given by different expresssions in
%           different parts of the domain.
%
%        e  2 x 2 matrix of boundary node numbers and 
%           reference tags, where the node number e(1,1)=n1 points
%           to the coordinate p(n1) of the left boundary, and e(2,1)=1
%           is a reference tag indicating that it is the left endpoint.  
%           Similarly, e(1,2)=n2, e(2,2)=2 refer to the right endpoint 
%           (see the example below).
%
%   EqData  function handle pointing to a matlab function of the form  
%           function [a,d,c,f] = EqData(x,tag), 
%           returning [a,d,c,f] given the coordinate x 
%           and the subdomain reference tag.
%
% BdryData  function handle pointing to a matlab function of the form
%           function [k,uA,g] = BdryData(x,tag), 
%           returning [k,uA,g] given x and the boundary reference tag.
% 
%        A  n x n global stiffness matrix
%
%        b  n x 1 global load vector
%
%        U  n x 1 vector, the finite element solution at node points p
%           
%
% Example:  To solve  D(-(1+x)Du)=2x  in  [0,1]  with boundary
%           conditions  -Du(0)+u(0)=0  and  u(1)=3/2 (k=infinity), define
% 
%           n=101  % the number of points, n-1 is the number of intervals 
%           p=linspace(0,1,n), t=[1:n-1; 2:n; ones(1,n-1)], e=[1 n; 1 2]
%
%           and write two m-files EqData1.m 
%
%           function [a, d, c, f] = EqData1(x, tag)
%             a=1+x; d=0; c=0; f=2*x;
%
%           and BdryData1.m 
%
%           function [k, uA, g] = BdryData1(x, tag)
%             if tag==1  k=1;   uA=0;   g=0; end
%             if tag==2  k=1e4; uA=3/2; g=0; end
%
%           To call the solver, type
% 
%           [U, A, b] = MyPoissonSolver(p, t, e, @EqData1, @BdryData1);
%
%           To plot the solution, type  plot(p,U).
%
%           The solution is  u(x)=-0.5*x.^2+x+1.
%
%           Written by K. Eriksson.  Modified by S. Larsson, 2008. 
%           Corrected 2008-04-24  /stig 
%-------------------------------------------------------------------------

% initializing

  n = size(p, 2);
  A = zeros(n, n);
  b = zeros(n, 1);

% collecting local contributions to A and b
% loop over elements
  for el = 1:size(t, 2)
    [dA, db] = ElementContributions(p, t, EqData, el);
    nn = t(1:2, el);
    A(nn, nn) = A(nn, nn) + dA;
    b(nn)     = b(nn)     + db;
  end

% collecting boundary contributions to A and b
% loop over boundary nodes
  for bel = 1:size(e, 2)
     [dA, db] = BoundaryContributions(p, e, BdryData, bel);
     nn = e(1, bel);
     A(nn, nn) = A(nn, nn) + dA;
     b(nn)     = b(nn)     + db;
  end

% solving resulting system

  U = A\b;

% subfunctions

function [dA, db] = ElementContributions(p, t, EqData, el)

% returns the local stiffness matrix dA and local load
% vector db for element number el defined by t(1:3,el) and
% p(t(1:2,el), and the equation data returned by EqData,
% using element midpoint quadrature.

  NodeCoords = p(t(1:2, el));
  x = sum(NodeCoords)/2;             % element midpoint!
  [a, d, c, f] = EqData(x, t(3, el));

  dx = NodeCoords(2)-NodeCoords(1);
  phi =[0.5;0.5];        % midpoint values of the two basis functions
  Dphi = [-1/dx ; 1/dx]; % derivatives of the basis functions corresponding
                         % the left and right endpoints of the element

  dA =a*Dphi*Dphi'*dx+d*phi*Dphi'*dx+c*phi*phi'*dx ;             
  % the 2x2 local stiffness matrix  
  % dA(I,J) = int_el ( a Dphi(I) Dphi(J) + d phi(I) Dphi(J) + c phi(I) phi(J) ) dx
  % I,J = 1,2
  
 db = f*phi*dx ;     % the 2x1 local load vector
                     % db(I) = int_el f phi(I) dx, I=1,2
              
function [dA, db] = BoundaryContributions(p, e, BdryData, bel)

% returns the contributions dA and db from boundary node number
% bel to the stiffness matrix and load vector.

  NodeCoord = p(e(1, bel));
  x = NodeCoord;
  [k, u0, g] = BdryData(x, e(2, bel));
  
  phi = 1;

  dA = k*phi*phi;     % the 1x1 bdry node contribution
                         
  db = k*u0*phi+g*phi;       % the 1x1 bdry node contribution
                                   
  

