function [a t]=sol_01(N)
tic;
a=0;
for i=1:N-1
	if mod(i,5)==0 || mod(i,3)==0
		a=a+i;
	end
end
t=toc;
end