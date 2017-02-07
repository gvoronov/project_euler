function [a t]=sol_01(N)
tic;
%seq=ones(1,(2*(N+1)-1)*4);
seq=1;
for i=2:(N+1)/2
    for j=1:4
        %seq(4*i-1+j)=seq(i+j)+2*i-1;
        seq=[seq seq(end)+2*i-2];
    end
end
a=sum(seq);
t=toc;
end





