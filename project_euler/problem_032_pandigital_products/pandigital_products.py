import sys
sys.path.append('../function_library/')

from numpy import *
import time, math, combinatorics,copy

def sol_01():
    start=time.time()
    pandigital_prods={}
    all_nums,t=_get_all_nums_02()
    all_ns=[]
    len_an=len(all_nums)
    for i,numI in enumerate(all_nums):
        print(str(1.0*i/len_an)+'%')
        lenI=len(numI)
        all_ns.append(_digits_to_num(numI))
        for j in range(i):
            numJ=all_nums[j]
            lenJ=len(numJ)
            if lenI+lenJ+min(lenI,lenJ)<=9: 
                overlap_dict=dict.fromkeys(numI,None)
                overlap_dict.update(dict.fromkeys(numJ,None))
                if len(overlap_dict)==lenI+lenJ:
                    prod=all_ns[i]*all_ns[j]
                    overlap_dict.update(dict.fromkeys(combinatorics.get_digits(prod)[0],None))
                    if lenI+lenJ+len(combinatorics.get_digits(prod)[0])==9 and len(overlap_dict)==9:
                        pandigital_prods[prod]=None
    return sum(pandigital_prods.keys()),time.time()-start

def sol_02():
    start=time.time()
    pandigital_prods={}
    all_nums,t=_get_all_nums_02(4)
    all_ns=[]
    for i,numI in enumerate(all_nums):
        lenI=len(numI)
        all_ns.append(_digits_to_num(numI))
        comp_all_nums=_recursive_get_all_nums_02(list(set(range(1,10))-set(numI)),[],[],5-lenI)[0:-1]
        for j,numJ in enumerate(comp_all_nums):
            lenJ=len(numJ)
            prod=all_ns[i]*_digits_to_num(numJ)
            prod_digits=combinatorics.get_digits(prod)[0]
            if 0 in prod_digits: continue
            if  lenI+lenJ+len(prod_digits)!=9: continue
            overlap_dict=dict.fromkeys(numI,None)
            overlap_dict.update(dict.fromkeys(numJ,None))
            overlap_dict.update(dict.fromkeys(prod_digits,None))
            if len(overlap_dict)==9:
                pandigital_prods[prod]=None
    return sum(pandigital_prods.keys()),time.time()-start
    
def _get_all_nums_01(n_digits):
    start=time.time()
    all_digits=range(1,10)
    all_nums=[]
    for i in range(1,n_digits+1):
        for j,combination in enumerate(combinatorics.get_combination_iter(i,all_digits)):
            for k,permutation in enumerate(combinatorics.get_permutation_iter(combination)):
                all_nums.append(permutation)
    return all_nums,time.time()-start

def _get_all_nums_02(n_digits):
    start=time.time()
    return _recursive_get_all_nums_02(range(1,10),[],[],n_digits)[0:-1],time.time()-start

def _recursive_get_all_nums_02(digits,num,all_nums,n_digits):
    if len(num)<n_digits:
        for i,digit in enumerate(digits):
            all_nums=_recursive_get_all_nums_02(digits[0:i]+digits[i+1:],num+[digit],all_nums,n_digits)
    all_nums.append(num)
    return all_nums
    
def _digits_to_num(num):
    n=0
    tmp_num=copy.copy(num)
    tmp_num.reverse()
    for i,digit in enumerate(tmp_num):
        n+=digit*10**i
    return n