function [a t]=sol_01
tic;
numbers=load('numbers.dat');
dims=size(numbers);
numbers=resize(numbers,dims(1)+3,dims(2)+3);
numbers=[zeros(3,dims(2)+3); numbers];
a=0;
for i=4:dims(1)+3
	for j=1:dims(2)
		a=max(a,numbers(i,j)*numbers(i,j+1)*numbers(i,j+2)*numbers(i,j+3));
		a=max(a,numbers(i,j)*numbers(i+1,j)*numbers(i+2,j)*numbers(i+3,j));
		a=max(a,numbers(i,j)*numbers(i+1,j+1)*numbers(i+2,j+2)*numbers(i+3,j+3));
		a=max(a,numbers(i,j)*numbers(i-1,j+1)*numbers(i-2,j+2)*numbers(i-3,j+3));
	end
end
t=toc;
end
