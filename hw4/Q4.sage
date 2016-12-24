import string
TEXT = 'THESE VIOLENT DELIGHTS HAVE VIOLENT ENDS'

def Q4():
    p = get_prime(min_digits=82)
    q = get_prime(min_digits=77)
    N = p * q
    phi = (p-1) * (q-1)
    while True:
        e = randint(2, phi - 1)
        if gcd(e, phi) == 1:
            break
    d = inverse_mod(e, phi)
    print 'N:', N
    print 'p:', p
    print '  ', 10^82
    print 'q:', q
    print '  ', 10^72
    print 'e:', e
    print 'd:', d
    print 'p-1:', factor(p-1)
    print 'q-1:', factor(q-1)
    print
    print 'Message        :', TEXT
    encoded = encode(TEXT)
    print 'Encoded message:', encoded
    encrypted = encrypt(encoded, N, e)
    print 'Encrypted      :', encrypted
    decrypted = decrypt(encrypted, N, d)
    print 'Decrypted      :', decrypted
    decoded = decode(decrypted)
    print 'Decoded        :', TEXT

def get_prime(min_digits):
    while True:
        r = random_prime(10^(min_digits+1), proof=True, lbound=10^(min_digits))
        s = 2 * r + 1
        if is_prime(s):
            return s

def encode(s):
    encoded = 0
    for c in s:
        if c == ' ':
            n = 0
        elif c in string.ascii_uppercase:
            n = ord(c) - ord('A') + 1
        else:
            raise ValueError('Unexpected char')
        encoded += n
        encoded *= 100
    encoded //= 100
    return encoded

def decode(number):
    chars = []
    while number > 0:
        n = number % 100
        if n == 0:
            chars.append(' ')
        elif 1 <= n <= 26:
            chars.append(chr(n - 1 + ord('A')))
        else:
            raise ValueError('Unexpected number')
        number //= 100
    return ''.join(chars)


def encrypt(message, N, e):
    return int(pow(message, e, N))

def decrypt(cipher, N, d):
    return int(pow(cipher, d, N))

if __name__ == '__main__':
    Q4()