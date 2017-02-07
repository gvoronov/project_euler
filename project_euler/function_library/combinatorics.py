from numpy import *
import time, math, copy

def get_digits(n):
    start=time.time()
    if n==0: return [0]
    num_digits=int(math.floor(math.log10(n)))+1
    digits=[0]*num_digits
    for i in range(num_digits-1,-1,-1):
        ind=num_digits-i-1
        digits[ind]=n/10**i
        n-=digits[ind]*10**i
    return digits,time.time()-start

def get_digits_iter(n):
    digits,t=get_digits(n)
    for digit in digits:
        yield digit
        
def get_permutation(n,objects):
    start=time.time()
    assert isinstance(objects,list), "objects not a list"
    tmp_objects=copy.copy(objects)
    n_objects=len(tmp_objects)
    permutation=[]
    for i in range(1,n_objects):
        index=ceil(float(n+1)/math.factorial(n_objects-i)).astype(int) 
        permutation.append(tmp_objects[index-1])
        del tmp_objects[index-1]        
        n=(n%math.factorial(n_objects-i))
    permutation.append(tmp_objects[0])
    return permutation,time.time()-start
    
def get_permutation_iter(objects):
    for i in range(math.factorial(len(objects))):
        permutation,t=get_permutation(i,objects)
        yield permutation
        
def get_combination(n,choose,objects):
    start=time.time()
    assert isinstance(objects,list), "objects not a list"
    tmp_objects=copy.copy(objects)
    combination=[None]*choose
    for i in range(choose):
        binom_sum=0
        for index,j in enumerate(range(len(tmp_objects)-1,choose-i-2,-1)):
            tmp_binom=binom(j,choose-i-1)
            binom_sum+=tmp_binom
            if n<binom_sum:
                combination[i]=tmp_objects[index]
                del tmp_objects[0:index+1]
                n-=binom_sum-tmp_binom
                break
    return combination,time.time()-start

def get_combination_iter(choose,objects):
    for i in range(binom(len(objects),choose)):
        combination,t=get_combination(i,choose,objects)
        yield combination

def binom(n,m):
    return math.factorial(n)/(math.factorial(m)*math.factorial(n-m))