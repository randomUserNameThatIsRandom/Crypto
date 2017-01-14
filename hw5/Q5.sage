t = 3
n = 6
p = 11
F = Integers(p)
R.<x> = F[]
T1 = {F(1), F(2), F(4)}
T2 = {F(1), F(2), F(5)}

def Q5():
    f, g = get_random_polynomials()
    print 'f:', f
    print 'g:', g
    check(f, T1)
    check(f, T2)
    check(g, T1)
    check(g, T2)

def get_random_polynomials():
    f = R.random_element(degree=(-1, t - 1))
    g = f + randint(1, p - 1)
    return f, g

def check(f, T):
    shares = get_shares(f)
    T_shares = [shares[k - 1] for k in T]
    coefs = get_coefs(T)
    real_secret = f(0)
    calculated_secret = calc_secret(T_shares, coefs)
    print '*' * 20
    print 'shares:', shares
    print 'T shares:', T_shares
    print 'coefs:', coefs
    print 'real secret:', real_secret
    print 'calculated secret:', calculated_secret
    print 'success?', real_secret == calculated_secret

def get_shares(f):
    return [f(i) for i in range(1, n + 1)]

def get_coefs(T):
    return [get_coef(T, i) for i in T]

def get_coef(T, i):
    return prod([k / (k - i) for k in T - {i}])

def calc_secret(shares, coefs):
    return sum([s * c for s, c in zip(shares, coefs)])

if __name__ == '__main__':
    Q5()