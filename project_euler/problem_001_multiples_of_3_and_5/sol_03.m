function [a t]=sol_03(N)
tic;
x1=1:ceil(floor((N-1)/5)*(2/3));
f1= 3*floor((x1-1)/2)+mod(x1-1,2)+1;
x2=1:ceil(floor((N-1)/3));
a=sum(5*f1)+sum(3*x2);
t=toc;
end