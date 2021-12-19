t_min = 0;
t_max = 1;
n = 3;
M = 10;
c_p = 3;
c_i = 1;

q = 0:0.1:1;
p = 0:0.1:1;
t = 0:0.1:1;
[Q,P,T] = meshgrid(q,p,t);

f =  EB_participate(Q, P, T, n, M, c_p, t_min, t_max);

surfc(p,q,f);