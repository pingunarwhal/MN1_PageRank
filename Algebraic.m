function R = Algebraic(nume, d)
  fid = fopen(nume);
  input = fscanf(fid, '%f');
  % citirea si stocarea datelor
  N = input(1);
  A = zeros(N, N);
  idx = 1;
  for i = 1 : N
    idx += 1;
    src = input(idx);
    idx += 1;
    count = input(idx);
    for j = 1 : count
      idx += 1;
      dest = input(idx);
      A(src, dest) = 1;
    endfor
  endfor
  for i = 1 : N
    L(i) = 0;
    for j = 1 : N
      L(i) += A(i, j);
    endfor
    A(i, :) = A(i, :) / L(i);
  endfor
  A = A';
  % vectorul solutie al ecuatiei matriceale
  sol = (1 - d) / N * ones(N, 1);
  % descompunerea QR a vectorului I_n - d * A
  [Q, SupT] = Gram_Schmidt(eye(N, N) - d * A);
  % rezolvarea sistemului superior triunghuilar pt aflarea vectorului page rank
  R = SST(SupT, Q' * sol);
endfunction