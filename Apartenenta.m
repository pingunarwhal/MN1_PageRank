function y = Apartenenta(x, val1, val2)
    % rezolvarea sistemului:
    % val1 * a + b = 0
    % val2 * a + b = 1
    A = [val1, 1; val2, 1];
    c = [0; 1];
    [Q, SupT] = Gram_Schmidt(A);
    R = SST(SupT, Q' * c);
    a = R(1);
    b = R(2);
    % contruirea functiei u(x)
    if x <= val1
      y = 0;
    endif
    if x > val1 && x < val2
      y = a * x + b;  
    endif
    if x >= val2
      y = 1;
    endif
endfunction