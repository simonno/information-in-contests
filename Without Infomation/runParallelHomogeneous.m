function [EB_org,EB_i,p,fval,flag] = runParallelHomogeneous(M, c, n)
flag=0;
fun=@(x)(Equilibrium( x, M, c, n));
[res, fval]=fsolve(fun,0.5); 
p=res;
if(p<0)
    flag=-1;
    p = 0;
elseif(p>1)
    flag=2; 
    p = 1;
end

EB_i=M/n*(1-p)^(n-1);
integrant = @(y) y .* n .* p.*(p.*y +(1-p)).^(n-1) ;
EB_org = integral(integrant, 0, 1) - M;
end