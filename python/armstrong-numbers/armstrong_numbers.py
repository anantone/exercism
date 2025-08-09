def is_armstrong_number(number):
    l = len(str(number))
    powers = []
    for digit in str(number):
        powers.append(int(digit)**l)
    return sum(powers) == number