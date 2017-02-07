function [ans t]=sol_01(N)
tic;
b=1:ceil(N/2);
a=(2*N*b-N^2)./(2*(b-N));
b_int=find(floor(a)==a & a>0);
ans=b_int(1)*b_int(2)*(N-b_int(1)-b_int(2));
t=toc;
end
