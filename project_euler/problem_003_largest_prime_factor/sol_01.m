function [a t]=sol_01(N)
addpath('../function_library/');
tic;
a=prime_decomposition(N);
a=max(a);
t=toc;
end