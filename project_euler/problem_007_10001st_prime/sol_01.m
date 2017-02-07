function [a t]=sol_01(N)
addpath('../function_library/');
tic;
f=@(n) (n/log(n))-N-1;
num_numbers=root_finder_guess(f,3,1e-3,eps('single'));
primes=prime_sieve(ceil(num_numbers));
a=primes(N+1);
t=toc;
end
