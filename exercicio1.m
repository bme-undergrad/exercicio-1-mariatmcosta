function t = exercicio1(func,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% Segundo chute inicial, necessário para o método da secante:
  if x0 == 0
    x1 = 1e-3;  % ou qualquer valor significativo
  else
    x1 = x0 * 1.1;
  endif


  t_roots = zeros(imax,1);
  erro = zeros(imax,1);

  t_roots(1) = x0;
  t_roots(2) = x1;

  for ii = 2:imax
    if ii ~= 1
      erro(ii) = abs((t_roots(ii)-t_roots(ii-1))/t_roots(ii));
      fprintf('Iteração %d: t = %.6f, erro = %.6f\n', ii, t_roots(ii), erro(ii));
      if erro(ii) < es
        break
      endif
    endif
     % fórmula da secante
    t_roots(ii+1) = t_roots(ii) - func(t_roots(ii)) * ((t_roots(ii) - t_roots(ii-1)) / (func(t_roots(ii)) - func(t_roots(ii-1))));
  endfor
  
  t = t_roots(ii);

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
