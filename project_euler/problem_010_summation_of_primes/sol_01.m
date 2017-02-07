function [a t]=sol_01(N)
addpath('../function_library/');
tic;
primes=prime_sieve(N);
a=sum(primes(2:end));
t=toc;
end
