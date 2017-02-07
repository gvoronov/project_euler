import sys
sys.path.insert(0,'../function_library/')

import numpy as np
import time, primes, combinatorics 

def sol_01(N):
    start=time.time()
    ps=primes.prime_sieve(N)[0]
    circular_primes={}
    for p in ps:
        digits=combinatorics.get_digits(int(p))[0]
        cs=[p]
        circular=True
        for i in range(1,len(digits)):
            c=get_circular(digits,i)
            cs=cs+[c]
            circular = circular and (c in ps)
        if circular:
            circular_primes[min(cs)]=get_disdinct(cs)
    return sum(circular_primes.values())-1,time.time()-start
    
def get_disdinct(cs):
    distinct={}
    for i in range(len(cs)):
        distinct[cs[i]]=1
    return sum(distinct.values())
    
def get_circular(digits,i):
    tmp=digits[i:]+digits[:i]
    return int(np.dot(np.array(tmp),np.power(10,range(len(tmp)-1,-1,-1))))