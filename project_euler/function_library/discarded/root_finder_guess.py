from numpy import *;
import time;

def eps(): return spacing(single(1))

def root_finder_guess(f,guess,dx=eps(),precision=eps()):
    start=time.time(); 
    slope=(f(guess+dx)-f(guess))/dx    
    guess-=(f(guess)/slope)
    while abs(f(guess))>=precision:
        slope=(f(guess+dx)-f(guess))/dx
        guess-=(f(guess)/slope)
    return guess,time.time()-start