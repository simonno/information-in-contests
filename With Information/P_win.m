function result = P_win(t, p, q, T, n)
if t > T
    T = t;
end
result = 0;
for j=0:n-1
    sum=0;
    for w=0:n-j-1
        sum = sum + (nchoosek(n - 1- j, w)*(p^w)*(1-p)^(n-1-j))*f_small(t)^w;        
    end
    result = result + (nchoosek(n - 1, j)*(q^j)*(1-q)^(n-1-j))*f_small(T)^j*sum;   
end
end
