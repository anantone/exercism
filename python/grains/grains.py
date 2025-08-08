def square(number):
    if number <= 0 or number > 64:
        raise ValueError("square must be between 1 and 64")
    else:
        return 2**(number-1)

def total():
    return -1+2**64
