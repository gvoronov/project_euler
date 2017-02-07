function [a t]=sol_05(N)
tic;
tmp=0;
for i=1:N
    tmpprod=i;
    for j=2:i
        tmpprod=tmpprod*i;
        trunc_large(tmpprod,10);
    end
    tmp=tmp+tmpprod;
    trunc_large(tmp,10);
end
a=sprintf('%1.0f',tmp);
for i=1:10-length(a), a=['0' a]; end
t=toc;
end

function trunc_large(num,keep)
tmp=sprintf('%1.0f',num);
if length(tmp)>keep;
    num=str2num(tmp(end-keep+1:end));
    assignin('caller',inputname(1),num);
end
end