function [R1 R2] = PageRank(nume, d, eps)
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d, eps);
  fid = fopen(nume);
  input = fscanf(fid, '%f');
  N = input(1);
  idx = 1;
  for i = 1 : N
    idx += 1;
    nodes(i) = input(idx);
    idx += 1;
    count = input(idx);
    idx += count;
  endfor
  idx += 1;
  val1 = input(idx)
  idx += 1;
  % citirea val1 si val2 din fisier
  val2 = input(idx)
  out_file = [nume ".out"];
  fout = fopen(out_file, "w");
  fprintf(fout, "%d\n", N);
  fprintf(fout, "%d\n", R1);
  fprintf(fout, "\n");
  fprintf(fout, "%d\n", R2);
  fprintf(fout, "\n");
  % sortarea descrescatoare a nodurilor dupa page rank
  M = zeros(N, 3);
  for i = 1 : N
    M(i, 2) = nodes(i);
    M(i, 3) = R2(i);
  endfor
  for i = 1 : N
    for j = i + 1 : N
      if M(i, 3) < M(j, 3)
        aux = M(i, :);
        M(i, :) = M(j, :);
        M(j, :) = aux;
      endif
    endfor
  endfor
  % scrierea datelor in fisierul de iesire
  for i = 1 : N
    M(i, 1) = i;
    M(i, 3) = Apartenenta(M(i, 3), val1, val2);
    fprintf(fout, "%d %d %.6f\n", M(i,1), M(i, 2), M(i, 3));
  endfor
  fclose(fout);
endfunction