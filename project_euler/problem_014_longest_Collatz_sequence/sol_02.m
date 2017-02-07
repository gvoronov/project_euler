function [a t]=sol_02(N)
%addpath('../function_library/');
tic;
%a=collatz_sequence(N);
a=1;
longest_seq=1;
for i=N:-1:1
	seq_length=collatz_sequence(i);
	if seq_length>longest_seq
		longest_seq=seq_length;
		a=i;
	end
end
t=toc;
end


function seq_length=collatz_sequence(N)
seq_length=1;
%seq=[];
while N~=1
	seq_length=seq_length+1;
	if mod(N,2)==0
		N=N/2;
	else
		N=3*N+1;
	end
	%seq=[seq N];
end
end

%function seq=collatz_sequence(N)
%seq=1;
%seq=[];
%while N~=1
	%seq=seq+1;
%	if mod(N,2)==0
%		N=N/2;
%	else
%		N=3*N+1;
%	end
%	seq=[seq N];
%end
%end

%a =  837799
%t =  1407.1
