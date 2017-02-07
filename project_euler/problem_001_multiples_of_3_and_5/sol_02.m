function [a t]=sol_02(N)
tic;
x=1:N-1;
a=sum(x(mod(x,5)==0 | mod(x,3)==0));
t=toc;
end