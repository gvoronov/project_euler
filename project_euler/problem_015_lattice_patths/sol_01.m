function [a t]=sol_01(N)
tic;
a=recursive_count(1,1,0,N+1);
t=toc;
end

function count=recursive_count(i,j,count,N)
if i~=N && j~=N
	count=recursive_count(i+1,j,count,N);
	count=recursive_count(i,j+1,count,N);
else
	count=count+1;
end
end