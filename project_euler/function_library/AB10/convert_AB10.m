function onum=convert_AB10(inum)
%convert a matlab float to an AB10 number and vice versa depending on input
%type
if isstruct(inum)
    onum=0;
    %AB10num2num
    for i=1:length(inum.digits)
        onum=onum+inum.digits(i)*power(10,inum.precision+length(inum.digits)-i);
    end
    onum=inum.sign*onum;
else
    %num2AB10num
    num_str=sprintf('%1.18e',abs(inum));
    onum.digits=zeros(1,length(num_str)-6);
    onum.digits(1)=str2num(num_str(1));
    epos=strfind(num_str,'e');
    for i=3:epos-1
        onum.digits(i-1)=str2num(num_str(i));
    end
    Ntrailing0s=find(onum.digits(end:-1:1)~=0,1)-1;
    if isempty(Ntrailing0s)
        AB10_globals;
        onum=AB10_zero;
    else
        onum.digits=onum.digits(1:length(onum.digits)-Ntrailing0s);
        precision=str2num(num_str(epos+1:end));
        onum.precision=precision-length(onum.digits)+1;
        onum.sign=sign(inum);
    end
end