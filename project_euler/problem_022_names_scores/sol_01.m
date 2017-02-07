function [a t]=sol_01
tic;
global letters; letters='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
fid=fopen('names.txt');
line=fgetl(fid);
fclose(fid);
locs=strfind(line,'"');
num_names=length(locs)/2;
names=cell(1,num_names);
for i=1:num_names
    names{i}=line(locs(2*i-1)+1:locs(2*i)-1);
end
if str_lt(names{1},names{2})
    sorted_names={names{1} names{2}};
else
    sorted_names={names{2} names{1}};
end
sorted_names{1}=names{1};
for i=3:100%num_names
    if ~str_lt(sorted_names{1},names{i})
        sorted_names=[names(i) sorted_names];
    elseif str_lt(sorted_names{end},names{i})
        sorted_names=[sorted_names names(i)];
    else
        for j=1:length(sorted_names)-1
            if str_lt(sorted_names{j},names{i}) && ~str_lt(sorted_names{j+1},names{i})
                sorted_names={sorted_names{1:j} names{i} sorted_names{j+1:end}};
                break;
            end    
        end
    end
    i
end
a=sorted_names;
t=toc;
end

function val=get_char_val(char)
global letters;
val=strfind(letters,char);
end

function lt=str_lt(str1,str2)
%str1
%str2
if strcmp(str1,str2)
    lt=false;
else
    min_str_len=min(length(str1),length(str1));
    if strcmp(str1(1:min_str_len),str1(1:min_str_len))
        if length(str1)<length(str2)
            lt=true;
        else
            lt=false;
        end
    else
       index=1; undetermined=true;
       while undetermined
           if strcmp(str1(index),str2(index))
               index=index+1;
           else
               undetermined=false;
               if get_char_val(str1(index))<get_char_val(str2(index))
                   lt=true;
               else
                   lt=false;
               end
           end
       end
    end
end
end