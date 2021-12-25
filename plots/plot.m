t_min = 0;
t_max = 1;
n = 3;
M = 10;
c_p = 3;
c_i = 1;
pc = 0.5;
qc = 0.5;
Tc = 0.5;
% p = 0:0.1:1;
% q = 0:0.1:1;
% t = 0:0.1:1;
% [P,Q,T] = meshgrid(p,q,t);


disp('T:')
fun = @(t,T) P_win(t, pc, qc, T, n).*f_small(t);
E_part = @(T) M*(integral(@(t) fun(t,T), t_min, T) + integral(@(t) fun(t,T), T, t_max))-c_p;
E_purc = @(T) M*integral(@(t) fun(t,T), T, t_max)-c_p-c_i;
Max_T = @(T) P_win(T, pc, qc, T, n)*M - c_p;
disp('T in B^P:')
Tsolve_part = fzero(E_part,0.5);
disp(Tsolve_part)
disp('T in B^Purchase:')
Tsolve_purc = fzero(E_purc,0.5);
disp(Tsolve_purc)
disp('T in B^P(T*):')
Tsolve_max = fzero(Max_T,0.5);
disp(Tsolve_max)




disp('q:')
fun = @(t,q) P_win(t, pc, q, Tc, n).*f_small(t);
E_part = @(q) M*(integral(@(t) fun(t,q), t_min, Tc) + integral(@(t) fun(t,q), Tc, t_max))-c_p;
E_purc = @(q) M*integral(@(t) fun(t,q), Tc, t_max)-c_p-c_i;
Max_T = @(q) P_win(Tc, pc, q, Tc, n)*M - c_p;
disp('q in B^P:')
qsolve_part = fzero(E_part,0.5);
disp(Tsolve_part)
disp('q in B^Purchase:')
qsolve_purc = fzero(E_purc,0.5);
disp(Tsolve_purc)
disp('q in B^P(T*):')
qsolve_max = fzero(Max_T,0.5);
disp(qsolve_max)



disp('p:')
fun = @(t,p) P_win(t, p, qc, Tc, n).*f_small(t);
E_part = @(p) M*(integral(@(t) fun(t,p), t_min, Tc) + integral(@(t) fun(t,p), Tc, t_max))-c_p;
E_purc = @(p) M*integral(@(t) fun(t,p), Tc, t_max)-c_p-c_i;
Max_T = @(p) P_win(Tc, p, qc, Tc, n)*M - c_p;
disp('p in B^P:')
psolve_part = fzero(E_part,0.5);
disp(psolve_part)
disp('p in B^Purchase:')
psolve_purc = fzero(E_purc,0.5);
disp(psolve_purc)
disp('p in B^P(T*):')
psolve_max = fzero(Max_T,0.5);
disp(psolve_max)


% v1 = EB_participate( P, Q, T, n, M, c_p, t_min, t_max);
% v2 = P_win(T, P, Q, T, n) * M - c_p;
% v3 = EB_participate(P, Q, T, n, M, c_p, t_min, t_max) - EB_purchase(P, Q, T, n, M, c_p, c_i, t_max);

% sliceomatic(v1,p,q,t)
% sliceomatic(v2,p,q,t)
% sliceomatic(v3,p,q,t)