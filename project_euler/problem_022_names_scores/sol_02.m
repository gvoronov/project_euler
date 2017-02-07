function [a t]=sol_02
tic;
global letters; letters='0ABCDEFGHIJKLMNOPQRSTUVWXYZ';
fid=fopen('names.txt');
line=fgetl(fid);
fclose(fid);
locs=strfind(line,'"');
num_names=length(locs)/2;
names=cell(1,num_names);
max_length=1;
%go thru and store names in cell also find the length of the longest name
for i=1:num_names
    names{i}=line(locs(2*i-1)+1:locs(2*i)-1);
    max_length=max(length(names{i}),max_length);
end
%go thru and padd 0s to each name and finally convert each name from a 
%base 27 to a base 10 number
names10=zeros(1,num_names);
for i=1:num_names
    names{i}=[names{i} padd0s(max_length-length(names{i}))];
    names10(i)=name2num(names{i});
end
switch_sort(names10);
a=0;
for i=1:num_names
    a=a+i*alph_sum(num2name(names10(i),max_length));
end
t=toc;
end

function zstr=padd0s(n)
zstr=num2str(zeros(1,n));
zstr=zstr(strfind(zstr,'0'));
end

function val=getCharVal(char)
global letters;
val=strfind(letters,char)-1;
end

function num=name2num(name)
num=0;
for j=1:length(name)
    num=num+getCharVal(name(end-j+1))*power(27,j-1);
end
end

function name=num2name(num,max_length)
global letters;
name=[];
for i=max_length:-1:1
    tmp=floor(num/power(27,i-1));
    name=[name letters(tmp+1)];
    num=num-tmp*power(27,i-1);
end
end

function a_sum=alph_sum(name)
a_sum=0;
for i=1:length(name)
    a_sum=a_sum+getCharVal(name(i));
end
end

function switch_sort(array)
sorted=false;
while ~sorted
    sorted=true;
    for i=1:length(array)-1
        if array(i)>array(i+1)
            tmp=array(i);
            array(i)=array(i+1);
            array(i+1)=tmp;
            sorted=false;
        end
    end
end
assignin('caller',inputname(1),array);
end