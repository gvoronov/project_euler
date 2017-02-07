function [a t]=sol_01(N)
tic;
addpath('../function_library/AB10');
construct_AB10_globals;
tmp=factorial_AB10(N);
a=sum(tmp.digits);
t=toc;
end
