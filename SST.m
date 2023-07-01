function R = SST(A, b)
  % functie care rezolva un sistem superior triunghiular
  N = length(A);
  R = zeros(N, 1);
  for i = N : -1 : 1
    aux = 0;
    for j = N : -1 : i
      aux = aux + R(j) * A(i, j); 
    endfor
    R(i) = (b(i) - aux) / A(i, i);
  endfor
endfunction