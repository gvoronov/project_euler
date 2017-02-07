function [a t]=sol_01(N,M)
tic;
reducedN=N-1;
lexDigs=[];
%get lexonographic digits
for i=M-1:-1:1
    lexDigs=[lexDigs floor(reducedN/factorial(i))];
    reducedN=reducedN-lexDigs(end)*factorial(i);
end
%convert to lexconigraphic number
digs=0:M-1;
for i=1:length(lexDigs)
    index=lexDigs(i)+1;
    tmpa(i)=digs(index);
    digs=[digs(1:index-1) digs(index+1:end)];
end
tmpa(M)=digs;
%format ans assuming that M<=10
for i=1:length(tmpa)
    a(i)=num2str(tmpa(i));
end
t=toc;
end




