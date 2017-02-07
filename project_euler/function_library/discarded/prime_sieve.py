from numpy import *;
import time;
def prime_sieve(N):
    start=time.time();   
    a=array(range(1,N+1),dtype=uint64);
    index=2;
    while index<len(a) and a[index-1]**2<=N:
        tmp=a[index:];
        tmp=tmp[mod(tmp,a[index-1])!=0];
        a=concatenate([a[:index],tmp]);
        index+=1;
    t=time.time()-start;
    return a,t;        
        
        