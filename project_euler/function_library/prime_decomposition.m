function [decomposition t]=prime_decomposition(N,primes)
t1=now;
if N==1
	decomposition=1;
	t=run_time(t1);
	return;
end
if nargin==1
	sample=2;
else
	if length(primes)==1, primes=prime_sieve(1,primes); end
	sample=primes(2:end);
end
%sample=prime_sieve(1000); sample=sample(2:end);
decomposition=recursive_decomposition(N,sample,[]);
t=run_time(t1);
end

function decomposition=recursive_decomposition(N,sample,decomposition)
factor=sample(1); counter=0;
while mod(N,factor)~=0
	counter=counter+1;
	if counter<length(sample)
		factor=sample(counter);
	else
		factor=factor+1;
	end
end
	decomposition=[decomposition factor];
	if counter<length(sample)
		sample=sample(counter+1:end);
	else
		sample=factor;
	end
if factor~=N
	decomposition=recursive_decomposition(N/factor,sample,decomposition);
end
end