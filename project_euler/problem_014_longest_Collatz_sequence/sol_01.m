function [a t]=sol_01(N)
%addpath('../function_library/');
tic;
rev_collatz=1;
found=zeros(1,N);
for j=1:60%while length(rev_collatz)<N %
%while sum(found)<N
	new_rev_collatz=[];
    %for i=1:length(rev_collatz)
		new_rev_collatz=2*rev_collatz;
		subset=(mod(rev_collatz-1,3)==0) & rev_collatz~=1;
		new_rev_collatz=[new_rev_collatz (rev_collatz(subset)-1)/3];
        
    %end
	%rev_collatz=new_rev_collatz;
    rev_collatz=new_rev_collatz(mod(new_rev_collatz,3)~=0);
	found(rev_collatz(rev_collatz<=N))=1;
	%sum(rev_collatz>mean(rev_collatz))/length(rev_collatz)
end
a=find(~found);
t=toc;
end
