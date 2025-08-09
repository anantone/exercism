def square_root(number):
    return heron(number, 1)

def heron(number, approximation):
    if approximation**2 == number:
        return approximation
    else:
        return heron(number, (approximation + number / approximation)/2)
