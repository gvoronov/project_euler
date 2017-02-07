import sys
sys.path.insert(1,'../function_library/')

from numpy import *
import time,combinatorics, fractions

def sol_01():
    start=time.time()
    dc_fractions={}
    #for numerator in range(11,100):
    for numerator in range(11,100):
        num_digits=combinatorics.get_digits(numerator)[0]
        if num_digits[1]==0: continue
        #print(num_digits)
        for i in range(1,10):
            for j,k in enumerate(range(1,-1,-1)):
                den_digits=[num_digits[j],i]
                _is_digit_canceling_frac(num_digits,den_digits,k,1,dc_fractions)
                den_digits=[i,num_digits[j]]
                _is_digit_canceling_frac(num_digits,den_digits,k,0,dc_fractions)
    tmp=reduce(lambda a,b: (a[0]*b[0],a[1]*b[1]),dc_fractions)
    return fractions.reduce_fraction(tmp[0],tmp[1])[1],time.time()-start
    
def _is_digit_canceling_frac(num_digits,den_digits,num_Ncancel,den_Ncancel,dc_fractions):
    numerator=_get_num_from_digits(num_digits)
    denominator=_get_num_from_digits(den_digits)
    frac=fractions.reduce_fraction(numerator,denominator)[0:2]
    red_frac=fractions.reduce_fraction(num_digits[num_Ncancel],den_digits[den_Ncancel])[0:2]
    if frac==red_frac and 1.0*numerator/denominator<1:
        dc_fractions[frac[0],frac[1]]=None
    return None
    

def _get_num_from_digits(digits):
    return digits[0]*10+digits[1]