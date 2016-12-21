R.<x> = QQ[]
f = x^4 + x^3 + x^2 + x + 1
K.<a> = GF(3**4, name='a', modulus=f(x))

def Q8():
    print 'f(x)         :', f
    print 'f(x) factors :', f.factor_mod(3)
    print 'f irreducible?', len(f.factor_mod(3)) == 1
    units = [g for g in K if is_unit(g)]
    generators = {g for g in units if is_generator(g)}
    print 'multiplicative generators count:', len(generators)
    print 'multiplicative generators      :'
    for g in generators:
        print '    ' + str(g)

def is_generator(y):
    return multiplicative_order(y) == 3**4 - 1

# Note: Theses functions are already implemented in sage,
#       but it wasn't clear if we are allowed to use them.
def is_unit(g):
    # Check if g is invertible in K
    return f.gcd(R(g)) == 1

def multiplicative_order(y):
    order = 1
    x = y
    while x != 1:
        x *= y
        order += 1
    return order

if __name__ == '__main__':
    Q8()