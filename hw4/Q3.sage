def Q3():
    p = random_prime(2^46, proof=True, lbound=2^45)
    q = random_prime(2^48, proof=True, lbound=2^47)
    m = p * q
    print 'p:', p
    print 'q:', q
    print 'm:', m
    cs = [1, 212321, 35432, 412315]
    xs = [1, 32151, 1734]
    max_iterations = int(m^0.6)
    for e in [2, 1]:
        print '*' * 20
        print 'Running for f=x^%d+c' % e
        for c in cs:
            for x0 in xs:
                f = lambda x: (x^e + c) % m
                print 'Running for x0=%s, c=%s' % (x0, c)
                factor, i = rho(f, x0, m, max_iterations)
                if factor == p:
                    s = 'p'
                elif factor == q:
                    s = 'q'
                elif factor == m:
                    s = 'm=pq'
                else:
                    s = 'ran out of time'
                print 'factor=%s=%s (after %s iterations=%s * sqrt(p))' % (s, factor, i, float(i) / p^0.5)

def rho(f, x0, m, max_iterations):
    x = x0
    y = x0
    g = 1
    for i in xrange(max_iterations):
        x = f(x)
        y = f(f(y))
        g = gcd(m, abs(x-y))
        if g != 1:
            break
    return g, i + 1

if __name__ == '__main__':
    Q3()