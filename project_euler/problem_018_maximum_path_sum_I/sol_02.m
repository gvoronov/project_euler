function [a t]=sol_02
tic;
tri_data={}; counter=0; max_entry=0;
fid=fopen('data.dat');
while ~feof(fid), counter=counter+1;
    tri_data{counter}=str2num(fgetl(fid));
    max_entry=max([max_entry tri_data{counter}]);
end
fclose(fid);
for i=length(tri_data)-1:-1:1
    for j=1:length(tri_data{i})
        tri_data{i}(j)=tri_data{i}(j)+max(tri_data{i+1}(j),tri_data{i+1}(j+1));
    end
end
a=tri_data{1}(1);
t=toc;
end

