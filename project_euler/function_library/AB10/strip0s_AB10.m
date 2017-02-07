function onum=strip0s_AB10(inum)
Nleading0s=find(inum.digits~=0,1)-1;
if isempty(Nleading0s)
	AB10_globals;
	onum=AB10_zero;
else
	Ntrailing0s=find(inum.digits(end:-1:1)~=0,1)-1;
	onum.digits=inum.digits(Nleading0s+1:length(inum.digits)-Ntrailing0s);
	onum.precision=inum.precision+Ntrailing0s;
    onum.sign=inum.sign;
end
end