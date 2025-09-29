def factors(value):
    prime_factors = []
    divisor = 2

    while value > 1:
        while value % divisor == 0:
            prime_factors.append(divisor)
            value /= divisor

        divisor += 1    

    return prime_factors
