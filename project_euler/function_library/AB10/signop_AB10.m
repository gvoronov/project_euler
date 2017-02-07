function ap=signop_AB10(op_str,a)
ap=a;
switch op_str
    case {'-','neg'}
        ap.sign=-ap.sign;
    case 'abs'
        ap.sign=1;
end
end