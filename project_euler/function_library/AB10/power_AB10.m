function Apower=power_AB10(a,n)
AB10_globals;
Apower=AB10_one;
for i=1:n
	Apower=prod_AB10(Apower,a);
end
end