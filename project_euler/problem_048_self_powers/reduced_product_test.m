function red_prod=reduced_product_test(a,b,keep)
global AB10_zero;
red_prod=AB10_zero;
a.digits=[a.digits zeros(1,a.precision)]; a.precision=0;
b.digits=[b.digits zeros(1,b.precision)]; b.precision=0;
for i=length(a.digits):-1:max(1,length(a.digits)-keep-1)     %i=1:min(length(a.digits),keep)  %length(a.digits)-keep
    for j=length(b.digits):-1:max(1,i-keep-1) %1:min(length(b.digits),keep-i)
        tmp_prod=a.digits(i)*b.digits(j);
        c1=floor(tmp_prod/10);
        c0=tmp_prod-10*c1;
        tmp_term.digits=[c1 c0];
        tmp_term.precision=length(a.digits)+length(b.digits)-i-j;%i+j-2;
        tmp_term.sign=1;
        tmp_term=strip0s_AB10(tmp_term);
        red_prod=sum_AB10(red_prod,tmp_term);
    end
end
%trunc_large(red_prod,keep);
end