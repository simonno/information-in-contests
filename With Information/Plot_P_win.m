p = rand();
q = rand();
n = randi(30) + 5;
T = randi(100) / 100;

P = zeros(1,100);
for t=0:100
    P(t+1) = P_win(t/100, p,q,T,n);
end

figure
plot(0:1/100:1, P);
title({'$P^{win}_i(t)$';}, 'interpreter','latex');
subtitle(['T=' num2str(T) ' n=' num2str(n) ' p=' num2str(p) ' q=' num2str(q)])
