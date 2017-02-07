function [a t]=root_finder_guess(f,guess,dx,precision)
t1=now;
if nargin==3
	precision=eps;
end
while abs(f(guess))>=precision
	slope=(f(guess+dx)-f(guess))/dx;
	guess=guess-(f(guess)/slope);
end
a=guess;
t=run_time(t1);
end