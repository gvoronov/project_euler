function [a t]=sol_01(N)
tic;
ds=nan(1,N);
a=0;
for i=2:length(ds)
    if isnan(ds(i))
        ds(i)=d(i);
        if ds(i)<=N && ds(i)>1 && ds(i)~=i
            ds(ds(i))=d(ds(i));
            if ds(ds(i))==i
                a=a+i+ds(i);
            end
        end
    end
end
t=toc;
end

function d=d(n)
d=sum(find(mod(n,1:n/2)==0));
end
