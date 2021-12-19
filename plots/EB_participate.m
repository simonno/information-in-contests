function result = EB_participate(p, q, T, n, M, c_p, t_min, t_max)
fun = @(t) P_win(t, p, q, T, n).*f_small(t);
result = M.*integral(fun, t_min, t_max, 'ArrayValued', true)-c_p;
end

