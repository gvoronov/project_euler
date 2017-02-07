function [a t]=sol_03(N)
tic;
a=1;
longest_seq=1;
seq_lengths=zeros(1,N);
for i=N:-1:1
	[seq_lengths(i) Nit]=collatz_sequence(i,N);
    seq_lengths(i)=seq_lengths(i)+seq_lengths(Nit);
end
a=find(seq_lengths==max(seq_lengths));
t=toc;
end


function [seq_length N]=collatz_sequence(N,maxN)
start_n=N;
seq_length=1;
while N~=1
	seq_length=seq_length+1;
	if mod(N,2)==0
		N=N/2;
	else
		N=3*N+1;
    end
    if N>start_n && N<=maxN
        break;
    end
end
end

