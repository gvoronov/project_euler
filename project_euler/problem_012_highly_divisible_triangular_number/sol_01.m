function [a t]=sol_01(N)
addpath('../function_library/');
tic;

tri_num=1; n=1; num_divisors=1;
while num_divisors<N
    n=n+1; tri_num=tri_num+n;
    num_divisors=prod(get_prime_dist(tri_num)+1);
end
a=tri_num;
t=toc;
end

function prime_dist=get_prime_dist(tri_num)
prime_decomp=prime_decomposition(tri_num);
prime_dist=[];
while ~isempty(prime_decomp)
    tmp=prime_decomp==prime_decomp(1);
    prime_dist=[prime_dist sum(tmp)];
    prime_decomp=prime_decomp(~tmp);
end
end
