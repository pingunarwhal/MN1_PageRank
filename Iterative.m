function R = Iterative(nume, d, eps)
  fid = fopen(nume);
  % citesc toate datele din fisierul de intrare intr-un vector
  input = fscanf(fid, '%f');
  N = input(1);
  A = zeros(N, N);
  % iterez prin vector pt a extrage lista de adiacenta a grafului
  idx = 1;
  for i = 1 : N
    idx += 1;
    src = input(idx);
    idx += 1;
    count = input(idx);
    for j = 1 : count
      idx += 1;
      dest = input(idx);
      % construiesc matricea de adiacenta A
      A(src, dest) = 1;
    endfor
  endfor
  for i = 1 : N
    L(i) = 0;
    for j = 1 : N
      % contruiesc vectorul L care retine gradul fiecarui nod
      L(i) += A(i, j);
    endfor
    A(i, :) = A(i, :) / L(i);
  endfor
  A = A';
  % construirea vectorului de page rank
  R = ones(N, 1);
  R = R ./ norm(R, 1);
  R_new = d * A * R + (1 - d) / N * ones(N, 1);
  while norm(R_new - R, 2) > eps
    R = R_new;
    R_new = d * A * R + (1 - d) / N * ones(N, 1);
  endwhile
  fclose(fid);
endfunction