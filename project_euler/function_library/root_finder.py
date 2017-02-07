# -*- coding: utf-8 -*-
"""
Created on Mon Jun 16 14:38:05 2014

@author: 514456
"""

from numpy import *;
import time;

def _eps(): return spacing(single(1))
    
def root_finder(f,guess=None, interval=None, dx=_eps(), precision=_eps()):  
    if guess!=None and interval==None:
        return root_finder_guess(f,guess,dx,precision)
    elif guess==None and interval!=None:
        return root_finder_endpts(f,interval,precision)
    else:
        raise AssertionError, 'Input makes no sense'

def root_finder_guess(f,guess, dx=_eps(), precision=_eps()):
    start=time.time(); 
    slope=(f(guess+dx)-f(guess))/dx    
    guess-=(f(guess)/slope)
    while abs(f(guess))>=precision:
        slope=(f(guess+dx)-f(guess))/dx
        guess-=(f(guess)/slope)
    return guess,time.time()-start
    
def root_finder_endpts(f, interval, precision=_eps()):
    start=time.time(); 
    
    assert isinstance(interval,ndarray) and len(interval)==2 \
            and interval[1]-interval[0] >precision, \
            'improper range input!!' 
            
    assert f(interval[0])*f(interval[1])<precision, \
            'functiond does not change sign on interval'

    if f(interval[0])>0:
        return _recursive_root_find(lambda x: -f(x),interval,precision),time.time()-start
    else:
        return _recursive_root_find(f,interval,precision),time.time()-start

def _recursive_root_find(f, interval, precision):
    mid_int=mean(interval);
    if f(mid_int)<-precision:
        return _recursive_root_find(f,array([mid_int,interval[1]]),precision)
    elif f(mid_int)>precision:
        return _recursive_root_find(f,array([interval[0],mid_int]),precision)
    else:
        return mid_int