import random
from collections import Counter

m = 90256390764228001
Zm = Integers(m)

def Q1():
    aa = [Zm(random.randint(2, m-1)) for _ in range(100)]
    gcds = [gcd(a, m) for a in aa]
    max_is = [max_i(a) for a in aa]
    i_counts = Counter(max_is)
    print 'number of non coprime a values:', sum(1 for g in gcds if g != 1)
    for i in [5,4,3,2,1,None]:
        print '#i=%s:' % i, i_counts[i]

def max_i(a):
    vals = [a^((m-1)/(2^i)) for i in range(0, 5+1)]
    triplets = zip(vals[:5], vals[1:], range(1,5+1))
    for prev, current, i in reversed(triplets):
        if current != Zm(1) and current != Zm(-1) and prev == Zm(1):
            return i
    return None




if __name__ == '__main__':
    Q1()