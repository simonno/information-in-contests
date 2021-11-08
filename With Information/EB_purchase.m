function result = EB_purchase(p, q, T, n, M, c_p, c_i, t_max)
fun = @(t) P_win(t, p, q, T, n)*f_small(t);
result = M*integral(fun, T, t_max, 'ArrayValued', true)-c_p-c_i;
end

