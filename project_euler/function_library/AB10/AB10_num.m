function AB10_num=AB10_num(digits,precision,sign)
if digits(1)==0 || digits(end)==0
    error('bad digit input');
end
%evenutually check sign input
%eventually check precsion input
%eventually check that digits is a vector
%eventually only require digits
AB10_num.digits=digits;
AB10_num.precision=precision;
AB10_num.sign=sign;
end