import sys
sys.path.append('../function_library/')

from numpy import *
import time, primes, root_finder

def sol_01(N):
    start=time.time()
    found=array([],dtype=uint64)
    max_check=int(10**(1+math.ceil(math.log10(9**N))))
    for n in range(2,max_check):
        tmp=n
        num_digits=int(math.floor(math.log10(n)))+1
        digits=zeros(num_digits,dtype=uint64)
        for i in range(num_digits-1,-1,-1):
            digits[i]=tmp/10**i
            tmp-=digits[i]*10**i
        if sum(power(digits,N))==n:
            found=append(found,n)
    return sum(found.astype(uint64)),time.time()-start
    
def sol_02(N):
    start=time.time()
    found=array([],dtype=uint64)
    n,t=root_finder.root_finder_guess(lambda n: n-log10(n)-math.log10(9**5),log10(9**5))
    max_check=int(math.ceil(10**n))
    print(max_check)
    for n in range(2,max_check):
        tmp=n
        num_digits=int(math.floor(math.log10(n)))+1
        digits=zeros(num_digits,dtype=uint64)
        for i in range(num_digits-1,-1,-1):
            digits[i]=tmp/10**i
            tmp-=digits[i]*10**i
        if sum(power(digits,N))==n:
            found=append(found,n)
    return sum(found.astype(uint64)),time.time()-start