MAX_CYCLE = 2 ** 17 - 1

class LFSR:
    def __init__(self, initial_state, feedback_states):
        self.initial_state = initial_state
        self.feedback_states = feedback_states
        self.state = None
        self.reset()

    def next(self):
        r = self.state[0]
        feedback_bit = sum(self.state[x] for x in self.feedback_states) % 2
        for i in range(len(self.state) - 1):
            self.state[i] = self.state[i + 1]
        self.state[len(self.state) - 1] = feedback_bit
        return r

    def take(self, n):
        return (self.next() for _ in range(n))

    def reset(self):
        self.state = self.initial_state[:]


def calc_cycle(lfsr):
    lfsr.reset()
    lfsr.next()
    c = 1
    while lfsr.state != lfsr.initial_state:
        lfsr.next()
        c += 1
    return c


def test(lfsr):
    print('first 30 bits: ', list(lfsr.take(30)))
    c = calc_cycle(lfsr)
    print('cycle length = %d' % c)
    print('precentage of max cycle: %d%%' % (float(c) / MAX_CYCLE * 100))


def main():
    print('max cycle length: %d' % MAX_CYCLE)
    initial_state = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    key1 = [0, 2, 3, 5]
    print('Test a')
    test(LFSR(initial_state, key1))
    key2 = [0, 8]
    print('Test b')
    test(LFSR(initial_state, key2))


if __name__ == '__main__':
    main()
