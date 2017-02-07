function [a t]=sol_03(N)
%ans for N=200:  6339403340
%ans for N=1000: 9110846700
tic;
keep=10;
addpath('../function_library/AB10');
construct_AB10_globals;
tmp=AB10_zero;
a='';
for p=1:N
    AB10_p=convert_AB10(p);
    digits=[AB10_p.digits zeros(1,AB10_p.precision)];
    reduced_power=AB10_p;
    tmp_prod=reduced_power_AB10(reduced_power,digits(end),keep);
    trunc_large(tmp_prod,keep);
    for i=2:length(digits)
        reduced_power=reduced_to_10(reduced_power,keep);
        tmp_prod=prod_AB10(tmp_prod,reduced_power_AB10(reduced_power,digits(end-i+1),keep));
        trunc_large(tmp_prod,keep);
    end
    tmp=sum_AB10(tmp,tmp_prod);
    trunc_large(tmp,10);
end

a=sprintf('%1.0f',convert_AB10(tmp));
for i=1:10-length(a), a=['0' a]; end

t=toc;
end

function red_pow=reduced_to_10(p,keep)
red_pow=reduced_power_AB10(p,5,keep);
red_pow=reduced_power_AB10(red_pow,2,keep);

end
function red_pow=reduced_power_AB10(p,n,keep)
if n==0
    global AB10_one;
    red_pow=AB10_one;
else
    red_pow=p;
    for i=2:n
        red_pow=prod_AB10(red_pow,p);
        trunc_large(red_pow,keep);
    end
end
end

function trunc_large(num,keep)
global AB10_zero;
precision=(length(num.digits):-1:1)+num.precision;
first_kept_index=find(precision<=keep & num.digits~=0,1);
if isempty(first_kept_index)
    num=AB10_zero;
else
    num.digits=num.digits(first_kept_index:end);
end
assignin('caller',inputname(1),num);
end