function [a t]=prime_sieve_01(N)
t1=now;
a=1:N;
index=2;
while index<length(a)
	a=a(a<=a(index) | mod(a,a(index))~=0);
	index=index+1;
end
t=run_time(t1);
end