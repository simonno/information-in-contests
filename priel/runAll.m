%%% Priel %%%
%%% Information provider in binary contests %%%
function [z]= runAll()
global par;
par.n = 3;
par.k = 1;
par.c = 0.5;
par.M = 0.7;
par.limUp = 1; %if changes, F_big and f_small should be modified as well.
par.limDown = 0;
EPSILON = 0.0001;
jump = 0.001;

n = par.n;
c = par.c;
k = par.k;
M = par.M;
limDown = par.limDown;
limUp = par.limUp;

xls_output = zeros(20, 5);
i = 1;
for p = 0.001:jump:1
    eq1 = @(T) (P_win(T,T,p)*M - c);
    [res, fval] = fzero(eq1,0.5);
    TOpt = res;
    if TOpt < 0
        TOpt = 0;
    end
    %EB(not purchase and participate) 
    eq2 = @(t)(f_small(t).*P_tag_win(t,TOpt,p));
    f1 = -c+M*integral(eq2,limDown,limUp);

    if (abs(f1)<EPSILON)
        disp('Found! n=%d k=%d M=%.2f c=%.2f p=%.4f Topt=%.4f EB=%.5f', n,k,M,c,p,TOpt,f1);
    end
    xls_output(i,1) = M;
    xls_output(i,2) = n;
    xls_output(i,3) = k;
    xls_output(i,4) = c;
    xls_output(i,5) = p;
    xls_output(i,6) = TOpt;
    xls_output(i,7) = fval;
    xls_output(i,8) = f1;
    i = i+1;
end
col_names = {'M', 'n', 'k', 'c','p','T_optimal','fval', 'B_Participate'};
t = array2table(xls_output,'VariableNames',col_names);
writetable(t,'ParallelHomogeneousWithInformationProvider.xlsx',"WriteMode","overwritesheet","AutoFitWidth",false);
end