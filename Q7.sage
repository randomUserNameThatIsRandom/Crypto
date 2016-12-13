import random

def Q7a():
    print 'Q7a'
    for m in [35, 37, 38]:
        check_group(m)
        print('-'*16)

def check_group(m):
    Zm = Integers(m)
    G =  [x for x in Zm if is_unit(x, m)]
    G_with_orders = {x: multiplicative_order(x) for x in G}
    max_order = max(G_with_orders.values())
    max_order_elements = [x for x, x_order in G_with_orders.items() if x_order == max_order]
    print 'm:', m
    is_cyclic = (max_order == len(G))
    print 'G order: ', len(G)
    print 'max order of elements in G:', max_order
    print 'is G cyclic?', is_cyclic
    print 'G elements of maximum order:', max_order_elements

def Q7b():
    print 'Q7b'
    m = 2**107 - 1
    N = 100000
    Zm = Integers(m)
    random_units = get_random_units(m, N)
    generators = [x for x in random_units if is_multiplicative_generator(x, m)]
    A = len(generators)
    print 'N:', N
    print 'A:', A
    print 'first 10 generators:'
    for i, g in enumerate(generators[:10]):
        print '    ' + str(g)
    print 'sampled generators ratio:', float(A) / N
    print 'real generators ratio   :', float(euler_phi(m - 1)) / m

def get_random_units(m, count):
    return [get_random_unit(m) for _ in range(count)]

def get_random_unit(m):
    while True:
        r = random.randint(1, m - 1)
        if is_unit(r, m):
            return r

def is_multiplicative_generator(g, k):
    phi_k = euler_phi(k)
    return all(pow(g, phi_k//p, k) != 1 for p, _ in phi_k.factor())
        
# Note: Theses functions are already implemented in sage,
#       but it wasn't clear if we are allowed to use them.
def is_unit(g, m):
    # Check if g is invertible in Zm
    return gcd(g, m) == 1

def multiplicative_order(y):
    order = 1
    x = y
    while x != 1:
        x *= y
        order += 1
    return order

if __name__ == '__main__':
    Q7a()
    Q7b()