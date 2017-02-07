import sys
sys.path.insert(1,'../function_library/')

from numpy import *
import time, primes, root_finder, combinatorics 

def sol_01():
    start=time.time()
    found=array([],dtype=uint64)
    n,t=root_finder.root_finder_guess(lambda n: n-log10(n)-math.log10(math.factorial(9)),log10(math.factorial(9)))
    max_check=int(math.ceil(10**n))

    for n in range(3,max_check):
        tmp=n
        num_digits=int(math.floor(math.log10(n)))+1
        digits=zeros(num_digits,dtype=uint64)
        for i in range(num_digits-1,-1,-1):
            digits[i]=tmp/10**i
            tmp-=digits[i]*10**i
        if sum(map(lambda a: math.factorial(a),digits))==n:
            found=append(found,n)
    return sum(found.astype(uint64)),time.time()-start
    
def sol_02():
    start=time.time()
    found=array([],dtype=uint64)
    n,t=root_finder.root_finder_guess(lambda n: n-log10(n)-math.log10(math.factorial(9)),log10(math.factorial(9)))
    max_check=int(math.ceil(10**n))

    for n in range(3,max_check):
        digits=combinatorics. get_digits(n)[0]
        if sum(map(lambda a: math.factorial(a),digits))==n:
            found=append(found,n)
    return sum(found.astype(uint64)),time.time()-start