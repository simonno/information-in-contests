%%% Priel, 2017 %%%

function [z]= runAll()
n = 20;
M = 0.6;
limUp = 1; %if changes, F_big anf f_small should be modified as well.
limDown = 0;

cx = 0:0.01:0.6;
xls_output_pm = zeros(length(cx), 8);

tic % begin of the loop
for cx_i=1:length(cx)
    c=cx(cx_i);
    
    [EB_org,EB_i,p,fval,flag]=runParallelHomogeneous(M, c, n); 
    xls_output_pm(cx_i,1) = M;
    xls_output_pm(cx_i,2) = n;
    xls_output_pm(cx_i,3) = c;
    xls_output_pm(cx_i,4) = p;
    xls_output_pm(cx_i,5) = EB_i;
    xls_output_pm(cx_i,6) = EB_org;
    xls_output_pm(cx_i,7) = fval;
    xls_output_pm(cx_i,8) = flag; 
     
end
col_names = {'M', 'n','c', 'p','EB_i', 'EB_org','fval', 'flag'};
t = array2table(xls_output_pm,'VariableNames',col_names);
writetable(t,'ParallelHomogeneous.xlsx',"WriteMode","overwritesheet","AutoFitWidth",false);
end