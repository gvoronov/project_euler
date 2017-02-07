function [a t]=sol_01(N)
tic;
addpath('../function_library/AB10');
construct_AB10_globals;
tmp=power_AB10(AB10_two,N);
a=sum(tmp.digits);
t=toc;
end
