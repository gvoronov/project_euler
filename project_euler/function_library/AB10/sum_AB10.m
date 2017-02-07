function ABsum=sum_AB10(a,b)
%perform a sum of two AB10 type numbers
sum_precision=min(a.precision,b.precision);
%[a.precision b.precision]
num_digits=max(length(a.digits)+a.precision,length(b.digits)+b.precision)-sum_precision;

sum_table=zeros(2,num_digits);
pm=a.sign*b.sign;
if compare_AB10(signop_AB10('abs',a),'>=',signop_AB10('abs',b))
    start=num_digits-a.precision+sum_precision+1-length(a.digits); sum_table(1,start:start+length(a.digits)-1)=a.digits;
    start=num_digits-b.precision+sum_precision+1-length(b.digits); sum_table(2,start:start+length(b.digits)-1)=pm*b.digits;
else
    start=num_digits-b.precision+sum_precision+1-length(b.digits); sum_table(1,start:start+length(b.digits)-1)=b.digits;
    start=num_digits-a.precision+sum_precision+1-length(a.digits); sum_table(2,start:start+length(a.digits)-1)=pm*a.digits;
end
%sum_table
ABsum.digits=zeros(1,num_digits+1);
c1=0;
for i=num_digits:-1:1;
    tmp_sum=sum(sum_table(:,i))+c1;
    if tmp_sum>=0
        c1=floor(tmp_sum/10);
        c0=tmp_sum-c1*10;
        ABsum.digits(i+1)=c0;
    else
        ABsum.digits(i+1)=10+tmp_sum;
        c1=-1;
    end
end
ABsum.digits(1)=c1;

%clean up the heads and tails and assign precision
Nleading0s=find(ABsum.digits~=0,1)-1;
if isempty(Nleading0s)
    %the sum is exactly 0
    AB10_globals;
    ABsum=AB10_zero;
else
    Ntrailing0s=find(ABsum.digits(end:-1:1)~=0,1)-1;
    ABsum.digits=ABsum.digits(Nleading0s+1:length(ABsum.digits)-Ntrailing0s);
    ABsum.precision=sum_precision+Ntrailing0s;
    %work out the sign
    if (pm==-1 && a.sign==-1 && compare_AB10(signop_AB10('abs',a),'>',signop_AB10('abs',b))) || ...
            (pm==-1 && b.sign==-1 && compare_AB10(signop_AB10('abs',b),'>',signop_AB10('abs',a))) || ...
            (a.sign==-1 && b.sign==-1)
        ABsum.sign=-1;
    else
        ABsum.sign=1;
    end
end
end