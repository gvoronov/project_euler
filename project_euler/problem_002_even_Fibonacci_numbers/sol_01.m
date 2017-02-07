function [a t]=sol_01(N)
tic;
x=zeros(1,N);
x(1)=2;
x1=2; x2=8; counter=1;
while x2<N
	counter=counter+1;
	x(counter)=x2;
	x3=x1+4*x2;
	x1=x2;
	x2=x3;
end
a=sum(x);
t=toc;
end