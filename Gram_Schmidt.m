function [Q R] = Gram_Schimidt(A)
  % algoritmul Gram Schmidt pt descompunerea QR implementat la laborator
  n = length(A);
  Q = zeros(n);
  R = zeros(n);
  for j = 1 : n
    for i = 1 : j - 1
      R(i, j) = Q(:, i)' * A(:, j);
    endfor
    v = zeros(n, 1);
    for i = 1:j-1
      v = v + R(i, j) * Q(:, i);
    endfor
    aux = A(:, j) - v;
    R(j, j) = norm(aux, 2);
    Q(:, j) = aux / R(j, j);
  endfor
endfunction