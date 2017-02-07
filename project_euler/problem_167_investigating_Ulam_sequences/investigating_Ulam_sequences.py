import sys
sys.path.insert(0,'../function_library/')

import numpy as np
import time, primes, combinatorics 

def sol_01(N):
    start=time.time()
    
    return start,time.time()-star
    
def _get_ulam_sequence(a,b,k):
    ulam=[a,b]
    for i in range(2,k):
        sums={}
        for i,n in enumerate(ulam):
            for m in ulam[i+1:]:
                if sums.has_key(n+m):
                    sums[n+m]+=1
                else:
                    sums[n+m]=1
        ulam.append(min(filter(lambda item: item>ulam[-1],dict(filter(lambda item: item[1]==1,sums.items())).keys())))
        yield ulam[-1]

            
        