def square(number):
    if number <= 0 or number > 64:
        raise ValueError("square must be between 1 and 64")
    squares = [1]
    for i in range(number-1):
        squares.append(squares[-1]*2)
    return squares[-1]

def total():
    total = 1
    for i in range(2, 65):
        total += square(i)
    return total
