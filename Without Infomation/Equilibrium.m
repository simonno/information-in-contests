function [val] = Equilibrium(p , M, c, n)
f1=0; %EB(not compete)
f2=BestResponse(p, M, c, n); %EB(compete)
val=f1-f2;
end