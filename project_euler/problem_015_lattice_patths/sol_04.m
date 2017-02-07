function [a t]=sol_04(N)
tic;
A=zeros(N+1);
A(3,1)=1; A(3,2)=3; A(3,3)=6;
for i=4:N
	A(i,i)=2*sum(A(i-1,1:i-1));
	for j=1:i-1
		A(i,j)=sum(A(i-1,1:j));
	end
end
a=2*sum(A(N,1:N));
t=toc;
end
