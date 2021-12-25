%%% Priel %%%
%%% Information provider in binary contests %%%
function [z]= runAll()
global par;
par.n = 3;
par.c = 0.2;
par.c_p = 0.03;
par.M = 0.4;
par.limUp = 1; %if changes, F_big and f_small should be modified as well.
par.limDown = 0;
EPSILON = 0.001;
jump = 0.01;

n = par.n;
c = par.c;
c_p = par.c_p;
M = par.M;
limDown = par.limDown;
limUp = par.limUp;

xls_output = zeros(20, 5);
i = 1;
for p = 0.01:jump:1
    for q = 0.01:jump:1
        eq1 = @(T) (P_win(T,T,p,q)*M - c);
        [res, fval] = fzero(eq1,0.5);
        TOpt = res;
        if TOpt < 0
            TOpt = 0;
        end
        %EB(not purchase and participate) 
        eq2 = @(t)(f_small(t)*P_win(t,TOpt,p,q));
        f1 = -c+M*quadv(eq2,limDown,limUp);

        %EB(purchase and participate) 
        eq3 = @(t)(f_small(t)*P_win(t,TOpt,p,q));
        f2 = -c-c_p+M*quadv(eq3,TOpt,limUp);
        %if (f1>0 && f1<EPSILON && f2>0 && f2<EPSILON)
        %    disp('Found!');
        %end
        xls_output(i,1) = M;
        xls_output(i,2) = n;
        xls_output(i,3) = c;
        xls_output(i,4) = c_p;
        xls_output(i,5) = p;
        xls_output(i,6) = q;
        xls_output(i,7) = TOpt;
        xls_output(i,8) = fval;
        xls_output(i,9) = f1;
        xls_output(i,10) = f2;
        i = i+1;
    end
    %if mod(p,jump) == 0
    %   fprintf('p value is %d\n',p);
    %end
end
xlswrite('excelM1',xls_output,'test1','A2');
end