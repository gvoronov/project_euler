function [a t]=sol_01
tic;
global tri_data max_entry;
tri_data={}; counter=0; max_entry=0;
fid=fopen('triangle.txt');
while ~feof(fid), counter=counter+1;
    if counter<=20
        tri_data{counter}=str2num(fgetl(fid));
        max_entry=max([max_entry tri_data{counter}]);
    else
        break;
    end
end
%tri_data=tri_data{1:15};
fclose(fid);
a=recursive_path([],tri_data{1}(1),[]);
t=toc;
end

function path_sum=get_path_sum(path)
global tri_data;
path_sum=tri_data{1}(1);
for i=1:length(path)
    path_sum=path_sum+tri_data{1+i}(1+sum(path(1:i)));
end
end

function [max_path_sum max_path]=recursive_path(path,max_path_sum,max_path)
global tri_data max_entry;
for i=0:1
    new_path=[path i];
    path_sum=get_path_sum(new_path);
    if path_sum>max_path_sum
        max_path_sum=path_sum;
        max_path=new_path;
    end
    if max_path_sum-path_sum<(length(tri_data)-1-length(new_path))*max_entry && length(new_path)<length(tri_data)-1
        %check if the current path can possibly catch up to current max and
        %check if at the end of the triangle
        [max_path_sum max_path]=recursive_path(new_path,max_path_sum,max_path);
    end
end
end
