function [a t]=sol_01
tic;
fid=fopen('number.dat');
digits=[];
while ~feof(fid)
	line=fgetl(fid);
	for i=1:length(line)
		digits=[digits str2num(line(i))];
	end
end
fclose(fid);
toc;
a=0;
for i=5:length(digits)
	tmp=digits(i)*digits(i-1)*digits(i-2)*digits(i-3)*digits(i-4);
	a=max(a,tmp);
end
t=toc;
end
