function [a t]=sol_01(N)
tic;
addpath('../function_library');
ps=prime_sieve(2*(N^2)+N);
plN=ps(ps<N);
max_n=1;
for b=plN(2:end)
    as=1:N;
    %as=as((abs(-as+sqrt(power(as,2)-4*b))/2)-floor(abs(-as+sqrt(power(as,2)-4*b))/2)>eps('single'));
    rps=ps(ps<b*(b+N+1));
    for a=[-as 0 as]
        n=1;
        while ~isempty(find(n^2+a*n+b==rps,1)), n=n+1; end
        if n>max_n
            max_n=n; max_a=a; max_b=b;
        end
    end
end
a=max_a*max_b;
t=toc;
end





