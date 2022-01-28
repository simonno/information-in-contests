function result = P_tag_win(t,T,p)
global par;
n = par.n;
k = par.k;
if t > T
    T = t;
end
result = 0;
for w = 0:n-k
    result = result + (nchoosek(n - k - 1, w).*(p.^w)*(1-p).^(n-k-w -1)).*F_big(t).^w;        
end
result = F_big(T).^k.*result;   
end