def mult_v1(vect, n):
    """Multiply a 1d vector by n"""
    return [e*n for e in vect]

def minus_v1(vect1, vect2):
    """vect1 - vect2"""
    return [e1 - e2 for e1,e2 in zip(vect1, vect2)]

