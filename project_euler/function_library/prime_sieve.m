function [a t]=prime_sieve(N)
t1=now;
a=1:N;
index=2;
while index<length(a) && a(index)^2<=N
	tmp=a(index+1:end);
	tmp=tmp(mod(tmp,a(index))~=0);
	a=[a(1:index) tmp];
	index=index+1;
end
t=run_time(t1);
end