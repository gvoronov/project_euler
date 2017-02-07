function [permutation t]=get_permtutation(n,objects)
ti=now;
n_objects=length(objects);
permutation=cell(1,n_objects);
for i=1:n_objects-1
	n/factorial(n_objects-i)
    index=ceil(n/factorial(n_objects-i))
    permutation{i}=objects{index};
    objects={objects{1:index-1} objects{index+1:end}};
    n=mod(n-1,factorial(n_objects-i))+1;
end
permutation{end}=objects{1};
t=run_time(ti);
end