clear all; close all; clc;
format longG;

% Utiliser la fonction test ou imageTest ou lambda.
function x = main(xtilde, l, L, A)
  figure;
  imshow(reshape(xtilde,l,L));
  title('Image floutee et bruitee');

  % Choose parameter and solve problem
  lambda = 1e-4;
  x = deblurr(A,xtilde,lambda);

  % Display solution
  figure;
  imshow(reshape(x,l,L) );
  title('Image defloutee et debruitee');
  endfunction

function test(file)

  load(file);
  main(xtilde, l, L, A);
  endfunction

function imageTest()

  load Example0;
  x = main(xtilde, l, L, A);
  figure;
  imshow(reshape(xtrue,l,L));
  title('Image fournie');
  fprintf('L''erreur relative de reconstruciton L1 est de %2.2f %% +//0-n',
          norm(x-xtrue,1)/norm(xtrue,1)*100);

  endfunction

function lambda(file)
  load(file);
  errors = testLambda(A,xtilde,xtrue);
  display(errors)
  endfunction

test("Example0")

