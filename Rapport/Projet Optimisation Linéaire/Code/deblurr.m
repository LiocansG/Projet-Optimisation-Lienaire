% Deblurring algorithm
%
% Given A and xtilde, solve the linear optimization problem:
%
% min_{0 <= x <= 1} ||A*xtilde - x||_1 + lambda ||x||_1
function x = deblurr(A,xtilde,lambda)

  n = length(xtilde);

  one = eye(n,n);
  oneCol(1:n,1:1) = 1;
  lambdaCol(1:n,1:1) = lambda;
  infini(1:n,1:1) = Inf;

  A=[-one,A; -one,-A];

  C = [oneCol;lambdaCol];

  B = [xtilde;-xtilde];

  LB = [oneCol * 0; oneCol * 0];%borne inf

  UB = [infini ; oneCol];%borne sup

  CTY = "";
  for i = 1 : 2*n
    CTY = strcat(CTY,"U");
  endfor

  sol = glpk(C, A, B, LB, UB, CTY);
  x = sol(n + 1:length(sol),1:1);

  %affiche dans la console si la solution est un sommet du polyèdre
  estSommet(A, sol, B, n);

end
