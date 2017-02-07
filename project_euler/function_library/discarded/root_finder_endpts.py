from numpy import *
import time
def eps(): return spacing(single(1))
    
def root_finder_endpts(f,interval,precision=eps()):
    start=time.time(); 
    
    assert isinstance(interval,ndarray) and len(interval)==2 \
            and interval[1]-interval[0] >precision, \
            'improper range input!!' 
            
    assert f(interval[0])*f(interval[1])<precision, \
            'functiond does not change sign on interval'

    if f(interval[0])>0:
        return recursive_root_find(lambda x: -f(x),interval,precision),time.time()-start
    else:
        return recursive_root_find(f,interval,precision),time.time()-start

def recursive_root_find(f,interval,precision):
    mid_int=mean(interval);
    if f(mid_int)<-precision:
        return recursive_root_find(f,array([mid_int,interval[1]]),precision)
    elif f(mid_int)>precision:
        return recursive_root_find(f,array([interval[0],mid_int]),precision)
    else:
        return mid_int