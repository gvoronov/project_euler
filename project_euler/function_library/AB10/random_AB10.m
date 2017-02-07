function random_AB10=random_AB10(max_digits,max_prec,max_sign)
random_AB10.digits=randi(10,1,randi(max_digits))-1;
random_AB10.precision=randi(2*max_prec)-max_prec;
Nleading0s=find(random_AB10.digits~=0,1)-1;
if isempty(Nleading0s)
    construct_AB10_globals;
    random_AB10=AB10_zero;
else
    Ntrailing0s=find(random_AB10.digits(end:-1:1)~=0,1)-1;
    random_AB10.digits=random_AB10.digits(Nleading0s+1:length(random_AB10.digits)-Ntrailing0s);
    random_AB10.precision=random_AB10.precision+Ntrailing0s;
    if randi(max_sign)==1
        random_AB10.sign=1;
    else
        random_AB10.sign=-1;
    end
end
end