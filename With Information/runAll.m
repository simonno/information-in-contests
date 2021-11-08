%%% Priel, 2017 %%%

function [z]= runAll()
n = 3;
M = 0.6;
limUp = 1; %if changes, F_big anf f_small should be modified as well.
limDown = 0;

cpx = 0:0.2:0.6;
cix = 0:0.1:0.6;

xls_output_pm = zeros(length(cpx)*length(cix), 12);

tic % begin of the loop
for cpx_i=1:length(cpx)
    c_p=cpx(cpx_i);
    for cix_i=1:length(cix)
        c_i=cix(cix_i);
        [p, q, T, B_org, fval, flag_p, flag_q, flag_T] = runParallelHomogeneousIP( n, M, c_p, c_i);
        newRow = (cpx_i-1)*length(cix)+cix_i;
        xls_output_pm(newRow,1) = M;
        xls_output_pm(newRow,2) = n;
        xls_output_pm(newRow,3) = c_p;
        xls_output_pm(newRow,4) = c_i;
        xls_output_pm(newRow,5) = q;
        xls_output_pm(newRow,6) = p;
        xls_output_pm(newRow,7) = T;
        xls_output_pm(newRow,8) = B_org;
        xls_output_pm(newRow,9) = strjoin(string(fval), ',');
        xls_output_pm(newRow,10) = flag_q; 
        xls_output_pm(newRow,11) = flag_p;
        xls_output_pm(newRow,12) = flag_T; 
    end  
end
col_names = {'M', 'n', 'c_p', 'c_i', 'q', 'p', 'T', 'B_org','fval', 'flag_q', 'flag_p', 'flag_T'};
t = array2table(xls_output_pm,'VariableNames',col_names);
writetable(t,'ParallelHomogeneousWithInfomationProvider.xlsx',"WriteMode","overwrite","AutoFitWidth",true);
end