import sys
sys.path.append('../function_library/')

from numpy import *
import time, primes

def sol_01(N):
#worst method, takes prime deocmposition, no hashing append with seach
    start=time.time()
    ps,t=primes.prime_sieve(N)
    ps=ps[1:]
    distinct_values=[]
    for a in range(2,N+1):
        pd,t=primes.prime_decomposition(a)
        a_power_decomp=zeros(len(ps))
        while len(pd)>0:
            tmp=where(pd==pd[0])[0]
            a_power_decomp[int(where(ps==pd[0])[0])]=len(tmp)
            pd=pd[max(tmp)+1:]
        for b in range(2,N+1):
            _append_value_if_distinct(b*a_power_decomp,distinct_values)
    return len(distinct_values),time.time()-start
    
def sol_02(N):
#hashing and break into subsets of powers of smaller a's
    start=time.time()
    n_vals=N-1
    bases={}
    powers={}
    for a in range(2,N+1):
        pow_a=a
        n=0
        while pow_a<=N:
            n+=1
            if not powers.has_key(pow_a):
                bases[pow_a]=a
                powers[pow_a]=n           
            pow_a*=a
    
    distinct_values={}
    for a in range(2,N+1):
        for b in range(2,N+1):
            distinct_values[str(bases[a])+','+str(powers[a]*b)]=1; 
    return len(distinct_values.values()),time.time()-start

def sol_03(N):
#hashing with prime decomposition
    start=time.time()
    ps,t=primes.prime_sieve(N)
    ps=ps[1:]
    distinct_values={}
    for a in range(2,N+1):
        pd,t=primes.prime_decomposition(a)
        a_power_decomp=zeros(len(ps))
        while len(pd)>0:
            tmp=where(pd==pd[0])[0]
            a_power_decomp[int(where(ps==pd[0])[0])]=len(tmp)
            pd=pd[max(tmp)+1:]
        for b in range(2,N+1):
            distinct_values[str(b*a_power_decomp)]=None
    return len(distinct_values.values()),time.time()-start

def sol_04(N):
#hashing with explicit computations of python LONG ints
    start=time.time()
    distinct_values={}
    for a in range(2,N+1):
        for b in range(2,N+1):
            distinct_values[a**b]=None
    return len(distinct_values.values()),time.time()-start    

def _append_value_if_distinct(new_value,values):
    for value in values:
        same=True
        for i,v in enumerate(value):
            same=same and (new_value[i]==v)
        if same: return values
    
    return values.append(new_value)