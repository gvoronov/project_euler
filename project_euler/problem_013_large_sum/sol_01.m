function [a t]=sol_01(N)
addpath('../function_library/AB10');
construct_AB10_globals;
tic;
fid=fopen('numbers.dat');
total=AB10_zero;
while ~feof(fid)
    line=fgetl(fid);
    tmp.digits=zeros(1,length(line));
    tmp.precision=0;
    tmp.sign=1;
    for i=1:length(line)
        tmp.digits(i)=str2num(line(i));
    end
    tmp=strip0s_AB10(tmp);
    total=sum_AB10(total,tmp);
end
fclose(fid);
firstNdigs=total.digits(1:10);
for i=1:length(firstNdigs)
    a(i)=num2str(firstNdigs(i));
end
t=toc;
end
