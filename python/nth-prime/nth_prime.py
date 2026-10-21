def prime(number):
    if number < 1:
        raise ValueError("there is no zeroth prime")
    primes = [2]
    i = 3
    while len(primes) < number:
        if is_prime(i):
            primes.append(i)
        i += 2
    return primes[number - 1]

def is_prime(num):
    if num < 2:
        return False
    if num == 2:
        return True
    if num % 2 == 0:
        return False
    for i in range(3, int(num**0.5) + 1, 2):
        if num % i == 0:
            return False
    return True

        
