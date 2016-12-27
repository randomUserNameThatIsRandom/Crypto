def Q3():
    p = random_prime(2^46, proof=True, lbound=2^45)
    q = random_prime(2^48, proof=True, lbound=2^47)
    m = p * q
    print 'p:', p
    print 'q:', q
    print 'm:', m
    cs = [1, 212321, 35432, 0, -1]
    xs = [1, 32151, 7]
    max_iterations = 5 * int(m^0.25)
    for e in [2, 1]:
        print '*' * 20
        print 'Running for f=x^%d+c' % e
        for c in cs:
            for x0 in xs:
                f = lambda x: (x^e + c) % m
                print '- x0=%06s, c=%06s:' % (x0, c),
                factor, i = rho(f, x0, m, max_iterations)
                if factor == p:
                    text = 'p'
                elif factor == q:
                    text = 'q'
                elif factor == m:
                    text = 'm = pq'
                else:
                    text = 'ran out of time'
                relative_iterations = float(i) / p^0.5
                print 'factor = %s (after %s iterations=%s * sqrt(p))' % \
                        (text, i, relative_iterations)

def rho(f, x0, m, max_iterations):
    x = x0
    y = x0
    g = 1
    for i in xrange(max_iterations):
        x = f(x)
        y = f(f(y))
        g = gcd(m, y - x)
        if g > 2 and g < m:
            break
    return g, i + 1

if __name__ == '__main__':
    Q3()