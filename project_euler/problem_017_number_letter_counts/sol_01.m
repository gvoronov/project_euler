function [a t]=sol_01(N)
tic;
a=0;
for i=1:N
    a=a+get_num_letters(i);
end
t=toc;
end

function num_letters=get_num_letters(n)
switch n
    case {0,4,5,9}, num_letters=4; return;
    case {1,2,6,10,}, num_letters=3; return;
    case {3,7,8,40,50,60}, num_letters=5; return;
    case {11,12,20,30,80,90}, num_letters=6; return;
    case {13,14,18,19}, num_letters=8; return;
    case {15,16,70,}, num_letters=7; return;
    case {17}, num_letters=9; return;
end
if ismember(n,21:99)
    a1=floor(n/10)*10;
    a0=n-a1;
    num_letters=get_num_letters(a1);
    if a0~=0
        num_letters=num_letters+get_num_letters(a0);
    end
elseif ismember(n,100:999)
    a1=floor(n/100);
    a0=n-a1*100;
    num_letters=get_num_letters(a1)+7;
    if a0~=0
        num_letters=num_letters+3+get_num_letters(a0);
    end
elseif ismember(n,1000:999999)
    a1=floor(n/1000);
    a0=n-a1*1000;
    num_letters=get_num_letters(a1)+8;
    if a0~=0
        num_letters=num_letters+get_num_letters(a0);
    end
else
    error('case not handled');
end
end
