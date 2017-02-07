function [a t]=sol_01(N)
tic;
addpath('../function_library/AB10');
construct_AB10_globals;
tmp1=AB10_one;
tmp2=AB10_one;
tmp3=AB10_two;
counter=2;
while length(tmp3.digits)<N
    tmp3=sum_AB10(tmp1,tmp2);
    tmp1=tmp2;
    tmp2=tmp3;
    counter=counter+1;
end
a=counter;
t=toc;
end





