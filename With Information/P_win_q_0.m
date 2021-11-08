function result = P_win_q_0(t, q, T, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if t > T
    T = t;
end
result = 0;
for j=0:n-1
    result = result +  binopdf(j, n-1, q).* unifcdf(T).^j;   
end
end
