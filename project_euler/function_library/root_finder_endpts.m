function [a t]=root_finder_endpts(f,interval,precision)
t1=now;
if nargin==2
	precision=eps;
end
if ~isnumeric(interval) || length(interval)~=2 || interval(2)-interval(1) <= precision;
	error('improper range input!!');
end
if f(interval(1))*f(interval(2))>=precision
	error('functiond does not change sign on interval');
end
if f(interval(1))>0
	tmp=f;
	f=@(x) -tmp(x);
	clear tmp;
end
a=recursive_root_find(f,interval,precision);
t=run_time(t1);
end

function mid_int=recursive_root_find(f,interval,precision)
mid_int=mean(interval);
if f(mid_int)<-precision
	mid_int=recursive_root_find(f,[mid_int,interval(2)],precision);
elseif f(mid_int)>precision
	mid_int=recursive_root_find(f,[interval(1),mid_int],precision);
end 
end