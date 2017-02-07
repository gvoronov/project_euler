function [a t]=sol_02(N)
tic;
addpath('../function_library/AB10');
construct_AB10_globals;
tmp=AB10_zero;
a='';
for i=1:N
    tmpi=convert_AB10(i);
    tmpprod=tmpi;
    for j=2:i
        tmpprod=prod_AB10(tmpprod,tmpi);
        trunc_large(tmpprod,10);
    end
    tmp=sum_AB10(tmp,tmpprod);
    trunc_large(tmp,10);
end

a=sprintf('%1.0f',convert_AB10(tmp));
for i=1:10-length(a), a=['0' a]; end

t=toc;
end

function trunc_large(num,keep)
construct_AB10_globals;
precision=(length(num.digits):-1:1)+num.precision;
first_kept_index=find(precision<=keep & num.digits~=0,1);
if isempty(first_kept_index)
    num=AB10_zero;
else
    num.digits=num.digits(first_kept_index:end);
end
assignin('caller',inputname(1),num);
end