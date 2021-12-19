function [p, q, T, B_org, fval, flag_p, flag_q, flag_T] = runParallelHomogeneousIPT( n, M, c_p, c_i)
flag_p = 0;
flag_q = 0;
flag_T = 0;
p = 0.3;
q = 0.5;
funcs = @(p, q, T) [P_win(T, p, q, T, n) * M - c_p;
     EB_participate(p, q, T, n, M, c_p, 0, 1);
    EB_participate(p, q, T, n, M, c_p, 0, 1) - EB_purchase(p, q, T, n, M, c_p, c_i, 1)];
func = @(T) funcs(q,p,T);

T0 = 0.5;
opts = optimset('fsolve');
opts.Display = 'none';
opts.MaxIter = 2000;
opts.MaxFunEvals = 6000;
opts.Algorithm = 'levenberg-marquardt';
[x , fval, exitflag, output] = fsolve(func, T0,opts);
if (exitflag <= 0)
    disp('exitflag');
    disp(exitflag);
    disp('output');
    disp(output);
end

T = x;
if(T<0)
    flag_T=-1;
    T = 0;
elseif(T>1)
    flag_T=2; 
    T = 1;
end

integrant = @(y) y .* max_performance_prob(y, p, q, T, n);
B_org = integral(integrant, 0, 1);
end
