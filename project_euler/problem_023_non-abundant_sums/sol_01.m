function [a t]=sol_01
tic;
max_num=28123;
abundant_nums=[];
for n=1:max_num
    if sum(find(mod(n,1:n-1)==0))>n
        abundant_nums=[abundant_nums n];
    end
end
sum_of_2_abun=zeros(1,max_num);
for i=1:length(abundant_nums)
    for j=i:length(abundant_nums)
        tmp=abundant_nums(i)+abundant_nums(j);
        if tmp<=max_num
            sum_of_2_abun(tmp)=1;
        end
    end
end
a=sum(find(~sum_of_2_abun));
t=toc;
end


