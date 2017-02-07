# -*- coding: utf-8 -*-
"""
Created on Wed Jun 11 21:31:12 2014

@author: 514456
"""

from numpy import *;
import time;

def prime_decomposition(N,primes=None):
    start=time.time()
    if N==1:
        return array([1],dtype=uint64),time.time()-start
    if primes==None:
        sample=array([2],uint64);
    else:
        sample=primes[1:]
    decomposition=_recursive_decomposition(N,sample,array([],dtype=uint64))
    return decomposition,time.time()-start       
    

def _recursive_decomposition(N,sample,decomposition):
    factor=sample[0]; counter=0
    while mod(N,factor)!=0:
        counter+=1
        if counter<len(sample):
            factor=sample[counter-1]
        else:
            factor=factor+uint64(1)
    decomposition=append(decomposition,factor)
    if counter<len(sample):
        sample=sample[counter:]
    else:
        sample=array([factor],dtype=uint64)
    if factor != N:
        return _recursive_decomposition(N/factor,sample,decomposition)
    else:
        return decomposition
        
    
    
    
  