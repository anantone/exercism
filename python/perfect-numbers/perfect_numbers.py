def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")
    aliquot = []
    for i in range(1, number):
        if number % i == 0:
            aliquot.append(i)
    if sum(aliquot) == number:
        return "perfect"
    elif sum(aliquot) > number:
        return "abundant"
    else:
        return "deficient"

            
