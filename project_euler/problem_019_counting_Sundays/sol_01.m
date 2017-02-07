function [a t]=sol_01(start_date,end_date)
tic;
a=0;
day=[1 1 1900 2];
while day(1)~=start_date(1) || day(2)~=start_date(2) || day(3)~=start_date(3)
    day=next_day(day);
end
while day(1)~=end_date(1) || day(2)~=end_date(2) || day(3)~=end_date(3)
    if day(4)==1 && day(1)==1
        a=a+1;
    end
    day=next_day(day);
end
t=toc;
end

function next_day=next_day(day)
next_day(4)=mod(day(4),7)+1;
if day(1)==31 && day(2)==12
    %last day of the year
    next_day(1)=1;
    next_day(2)=1;
    next_day(3)=day(3)+1;
elseif (day(1)==30 && ismember(day(2),[4 6 9 11])) || ...
        (day(1)==31 && ismember(day(2),[1 3 5 7 8 10])) || ...
        (day(2)==2 && ...
        ((day(1)==28 && ~(mod(day(3),4)==0 && (mod(day(3),100)~=0 || mod(day(3),400)==0))) || ...
        (day(1)==29 && (mod(day(3),4)==0 && (mod(day(3),100)~=0 || mod(day(3),400)==0)))))
    %last day of any month besides december
    next_day(1)=1;
    next_day(2)=day(2)+1;
    next_day(3)=day(3);
else
    %only day gets incremented
    next_day(1)=day(1)+1;
    next_day(2)=day(2);
    next_day(3)=day(3);
end
end

