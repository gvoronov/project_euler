function [a t]=sol_01(N)
tic;
for d=2:N
    firstOccurance=[];
    alpha=10;
    i=1;
    %loop over until one of two conditions met
    %first: checks that the last value of alpha is non-zero if its zero it
    %means that the mod from the last step is 0 and the exact value is
    %calculated at finite decimal expansion
    %second: checks for reccurence
    while alpha(end) && isempty(firstOccurance)
        i=i+1;
        alpha(i)=mod(alpha(i-1),d)*10;
        firstOccurance=find(alpha(end)==alpha(1:end-1));
    end
    if isempty(firstOccurance)
        cycle(d)=0;
    else
        cycle(d)=length(alpha)-firstOccurance;
    end
    
end
%digits=floor(alpha/d);
a=find(cycle==max(cycle));
t=toc;
end





