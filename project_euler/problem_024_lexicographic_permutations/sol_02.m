function [a t]=sol_02(N,M)
tic;
addpath('..\function_library\');
digits=cell(1,M);
for i=1:M, digits{i}=i-1; end;
tmpa=get_permutation(N,digits);
for i=1:length(tmpa)
    a(i)=num2str(tmpa{i});
end
t=toc;
end




