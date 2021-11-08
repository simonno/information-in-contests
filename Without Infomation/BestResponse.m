function [result] = BestResponse(p, M, c, n)
result = 0;
for j=0:n-1
    % result = result + binopdf(j, n-1, p) / (1 + j);   
    result = result +  (nchoosek(n - 1, j)*(p^j)*(1-p)^(n-1-j)) / (1 + j);  
end
result = M * result - c;
end
