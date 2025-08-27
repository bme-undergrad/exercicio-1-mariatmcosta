function t = exercicio1(func,x0,imax)

% nao alterar: inicio
es = 0.01;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% Segundo chute inicial, necessário para o método da secante:
  if x0 == 0
    x1 = 1e-3;  
  else
    x1 = x0 * 1.1;
  endif


  t_roots = zeros(imax,1);
  t_roots(1) = x0;
  t_roots(2) = x1;

  for ii = 2:imax
    % fórmula da secante
    t_roots(ii+1) = t_roots(ii) - func(t_roots(ii)) * ((t_roots(ii) - t_roots(ii-1)) / (func(t_roots(ii)) - func(t_roots(ii-1))));
    erro(ii) = abs((t_roots(ii)-t_roots(ii-1))/t_roots(ii));
    if erro(ii) < es
      break
    endif
  endfor
  
  t = round(t_roots(ii) * 1e4) / 1e4;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction
