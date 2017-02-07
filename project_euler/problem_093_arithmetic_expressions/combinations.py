"""
Generator for returning all groups of size m<=len(lst),
where lst is a list or tuple.
"""
def combinations(lst,m):
    if type(lst)!=list and type(lst)!=tuple:
        raise Exception("Error in combinations: lst must be a list of tuple.")

    n=len(lst)

    if m==0:
        yield lst[0:0]
    elif m>0:
        for first_ind in range(n-m+1):
            for subcomb in combinations(lst[first_ind+1:],m-1):
                yield lst[first_ind:first_ind+1]+subcomb

