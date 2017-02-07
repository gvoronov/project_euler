function [a t]=sol_01(N)
tic;
addpath('../function_library/AB10');
construct_AB10_globals;
tmp=AB10_zero;
a='';
for i=1:N
    tmp=sum_AB10(tmp,power_AB10(convert_AB10(i),i));
end
%a=tmp.digits(end-9:end);
for i=9:-1:0
    a=[a num2str(tmp.digits(end-i))];
end
t=toc;
end
