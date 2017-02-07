function factorial_AB10=factorial_AB10(n)
AB10_globals;
factorial_AB10=AB10_one;
for i=1:n;
    factorial_AB10=prod_AB10(factorial_AB10,convert_AB10(i));
end
end