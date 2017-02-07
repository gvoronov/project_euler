function [a t]=sol_01(N)
addpath('../function_library/');
tic;
a=1;
primes=prime_sieve(N);
decompositions=zeros(N,length(primes));
for i=2:N
	decomposition=prime_decomposition(i);
	for j=1:length(primes)
		decompositions(i,j)=length(decomposition(decomposition==primes(j)));
	end
end
for i=2:length(primes)
	a=a*primes(i)^max(decompositions(:,i));
end
t=toc;
end
