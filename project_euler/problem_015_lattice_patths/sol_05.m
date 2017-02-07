function [a t]=sol_05(N)
tic;
a=factorial(2*N)/(factorial(N)^2);
t=toc;
end
