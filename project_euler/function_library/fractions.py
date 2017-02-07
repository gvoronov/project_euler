from numpy import *
import time, primes

def reduce_fraction(numerator,denominator):
    start=time.time()
    numerator_pd=list(primes.prime_decomposition(numerator)[0])
    denominator_pd=list(primes.prime_decomposition(denominator)[0])
    for i,factor in enumerate(numerator_pd):
        if factor in denominator_pd:
            numerator_pd[i]=1
            denominator_pd[denominator_pd.index(factor)]=1
    red_numerator=reduce(lambda a,b: int(a*b),numerator_pd)
    red_denominator=reduce(lambda a,b: int(a*b),denominator_pd)
    return red_numerator,red_denominator,time.time()-start