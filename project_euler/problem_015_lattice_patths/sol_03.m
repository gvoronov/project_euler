function [a t]=sol_03(N)
tic;
A=zeros(N+1);
A(3,1)=1; A(3,2)=3; A(3,3)=6;
for i=4:N
	A(i,i)=border(i-1,A);
	for j=1:i-1
		A(i,j)=border_top(i-1,j,A);
	end
end
a=border(N,A);
t=toc;
end

function count=border_top(n,m,A)
count=sum(A(n,1:m));
end

function count=border(n,A)
count=2*sum(A(n,1:n));
end