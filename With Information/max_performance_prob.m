function [prob] = max_performance_prob(y,p,q,T, n)
if y < T
    prob = n*((1-q)*p)*(q + (1 - q).*(p.*y +(1-p))).^(n-1);
else 
    prob = n*(q+(1-q)*p)*(q.*y + (1 - q).*(p.*y +(1-p))).^(n-1);
end
end

