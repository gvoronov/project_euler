function [a t]=sol_01(N)
tic;
a=0;
for i=1:N
	for j=1:i-1
		a=a+i*j;
	end
end
a=2*a;
t=toc;
end
