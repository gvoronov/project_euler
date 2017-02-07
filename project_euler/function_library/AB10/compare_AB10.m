function comparison=compare_AB10(a,comp_str,b)
%perform a variety of logical comparisons of AB10 number type
switch comp_str
    case {'<','lt'}
        comparison=less_than_AB10(a,b);
    case {'<=','lte'}
        comparison=less_than_AB10(a,b)||equal_AB10(a,b);
    case {'>','gt'}
        comparison=~less_than_AB10(a,b) && ~equal_AB10(a,b);
    case {'>=','gte'}
        comparison=~less_than_AB10(a,b);%||equal_AB10(a,b);
    case {'==','eq'}
        comparison=equal_AB10(a,b);
    otherwise
        error('invalid comparison operator');
end
end

function equal=equal_AB10(a,b)
if a.sign==b.sign && a.precision==b.precision && ...
        length(a.digits)==length(b.digits) && ...
        sum(a.digits==b.digits)==length(a.digits)
    equal=true;
else
    equal=false;
end
end

function lt=less_than_AB10(a,b)
%for AB10 type numbers a and b determine if a < b
if equal_AB10(a,b)
    lt=false;
    return;
end
if a.sign==1 && b.sign==1
    lt=less_than_AB10pos(a,b);
elseif a.sign==-1 && b.sign==-1
    lt=~less_than_AB10pos(a,b);
else
    lt=a.sign<b.sign;
end
end

function lt=less_than_AB10pos(a,b)
%for strictly positive AB10 type numbers dertermine if a < b
if length(a.digits)+a.precision<length(a.digits)+a.precision
    lt=true;
elseif length(a.digits)+a.precision>length(a.digits)+a.precision
    lt=false;
else
    comp_precision=min(a.precision,b.precision);
    num_digits=max(length(a.digits)+a.precision,length(b.digits)+b.precision)-comp_precision;
    comp_table=zeros(2,num_digits);
    start=num_digits-a.precision+comp_precision+1-length(a.digits); comp_table(1,start:start+length(a.digits)-1)=a.digits;
    start=num_digits-b.precision+comp_precision+1-length(b.digits); comp_table(2,start:start+length(b.digits)-1)=b.digits;
    for i=1:num_digits
        if comp_table(1,i)~=comp_table(2,i)
            lt=comp_table(1,i)<comp_table(2,i);
            break;
        end
    end
end
end