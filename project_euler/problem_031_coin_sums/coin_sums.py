from numpy import *
import time

def sol_01():
    start=time.time()
    denominations=array([200,100,50,20,10,5,2,1],dtype=uint64)
    return _recursive_sol_01(0,0,0,denominations,200),time.time()-start
    
def _recursive_sol_01(num_ways,current_amt,level,denominations,amt_needed):
    while current_amt<=amt_needed:
        if current_amt!=amt_needed:
            if level+1<len(denominations):
                num_ways=_recursive_sol_01(num_ways,current_amt,level+1,denominations,amt_needed)
        else:
            num_ways+=1
        current_amt+=denominations[level]
    return num_ways