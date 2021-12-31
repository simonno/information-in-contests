%%% Priel %%%
%%% Information provider in binary contests %%%
function [z]= plot_performance()
global par;
c = par.c;
M = par.M;
p=0.5;
q=0.5;

t=0:0.001:1;
profit=zeros(1,1001);
for i=1:1001
    profit(i) = (P_win(t(i),t(i),p,q)*M - c);
end
plot(t,profit)
end