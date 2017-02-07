function ABprod=prod_AB10(a,b)
AB10_globals;
ABprod=AB10_zero;
for i=1:length(a.digits)
    for j=1:length(b.digits)
        tmp_prod=a.digits(i)*b.digits(j);
        c1=floor(tmp_prod/10);
        c0=tmp_prod-10*c1;
        tmp_term.digits=[c1 c0];
        tmp_term.precision=a.precision+length(a.digits)-i+b.precision+length(b.digits)-j;
        tmp_term.sign=1;
        %pick off leading and trailing 0s and look for zero
        Nleading0s=find(tmp_term.digits~=0,1)-1;
        if isempty(Nleading0s)
            AB10_globals;
            tmp_term=AB10_zero;
        else
            Ntrailing0s=find(tmp_term.digits(end:-1:1)~=0,1)-1;
            tmp_term.digits=tmp_term.digits(Nleading0s+1:length(tmp_term.digits)-Ntrailing0s);
            tmp_term.precision=tmp_term.precision+Ntrailing0s;
        end

        ABprod=sum_AB10(ABprod,tmp_term);
    end
end
ABprod.sign=a.sign*b.sign;
end