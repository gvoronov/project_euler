function [a t]=sol_02(N)
tic;
a=0;
i=1;
Nbar=N;
while i<=Nbar
	for j=1:ceil(i/2)
		m=N-j+1; n=-m+2*N-i+1;
		if is_palindromic(m*n)
			a=max(a,m*n);
			Nbar=min(N-floor((2*n*m)/(m+n)));
		end
	end
	i=i+1;
end
t=toc;
end

function palindromic=is_palindromic(n)
str=num2str(n);
palindromic=true;
for i=floor(1:length(str)/2)
	palindromic=palindromic&&strcmp(str(i),str(end-i+1));
end
end