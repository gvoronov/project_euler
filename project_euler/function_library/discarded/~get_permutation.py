from numpy import *
import time, math, copy

def get_permutation(n,objects):
    start=time.time()
    assert isinstance(objects,list), "objects not a list"
    tmp_objects=copy.copy(objects)
    n_objects=len(tmp_objects)
    permutation=[]
    for i in range(1,n_objects):
        index=ceil(float(n)/math.factorial(n_objects-i)).astype(int) 
        permutation.append(tmp_objects[index-1])
        del tmp_objects[index-1]        
        n=((n-1)%math.factorial(n_objects-i))+1
    permutation.append(tmp_objects[0])
    return permutation,time.time()-start
    
def get_permutation_iter(objects):
    for i in range(math.factorial(len(objects))):
        permutation,t=get_permutation(i+1,objects)
        yield permutation
