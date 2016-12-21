def enc(p, (a,b), m):
    return (a*m + b) % p

def dec(p, (a,b), c):
    a_inv = xgcd(a, p)[1]
    return (a_inv * (c - b)) % p

def test():
    p = random_prime(10000, proof=True)
    a = randint(1, p-1)
    b = randint(0, p-1)
    k = (a,b)

    print('p:', p)
    print('k:', k)

    for m in range(0, p):
        c = enc(p, k, m)
        d = dec(p, k, c)

        if m != d:
            print('Failed!')
            print('m:', m)
            print('c:', c)
            print('d:', d)
            return

    print('Success (every message can be decrypted)')

if __name__ == '__main__':
    test()