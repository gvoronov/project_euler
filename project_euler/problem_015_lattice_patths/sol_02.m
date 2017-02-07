function [a t]=sol_02(N)
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
count=0;
for i=0:m-1
	count=count+A(n,m-i);
end
end

function count=border(n,A)
count=0;
for i=0:n-1
	count=count+A(n,n-i);
end
count=2*count;
end