function [p, q, T, B_org, fval, flag_p, flag_q, flag_T] = runParallelHomogeneousIP( n, M, c_p, c_i)
flag_p = 0;
flag_q = 0;
flag_T = 0;

funcs = @(p, q, T) [P_win(T, p, q, T, n) * M - c_p;
     EB_participate(p, q, T, n, M, c_p, 0, 1);
    EB_participate(p, q, T, n, M, c_p, 0, 1) - EB_purchase(p, q, T, n, M, c_p, c_i, 1)];

F = @(x) funcs(x(1), x(2), x(3));

x0 = [0.5,0.5,0.5];
opts = optimset('fsolve');
opts.Display = 'none';
opts.MaxIter = 2000;
opts.MaxFunEvals = 2000;
[x , fval, exitflag, output] = fsolve(F, x0,opts);
if (exitflag <= 0)
    disp('exitflag');
    disp(exitflag);
    disp('output');
    disp(output);
end

p = x(1);
q = x(2);
T = x(3);
if(p<0)
    flag_p=-1;
    p = 0;
elseif(p>1)
    flag_p=2; 
    p = 1;
end


if(q<0)
    flag_q=-1;
    q = 0;
elseif(p>1)
    flag_q=2; 
    q = 1;
end

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
