NUMBER_OF_SQUARES = 64

def square(number):
    if not 0 < number <= 64:
        raise ValueError("square must be between 1 and 64")
    else:
        return 1 << (number-1)

def total():
    return (1 << NUMBER_OF_SQUARES) - 1
