%Affiche dans la console si la solution est un sommet 
%du polyedre de contraintes A

function estSommet(A,sol,B,n)
  actives=[];
  prod=abs(A * sol - B);
  for i=1:length(sol)
    if prod(i) <= 0.0001
        actives = [actives;A(i:i,:)];
    end
  end
  activesEtLinInd=sum(sol < 0.0001) + sum(abs(sol(1:n) - 1) < 0.0001);

  if rank(actives) + activesEtLinInd >= 2*n
      disp("La solution est un sommet du polyedre");
  else
      disp("la solution n'est pas un sommet du polyedre");
  end

end
