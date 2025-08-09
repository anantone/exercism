def steps(number, count = 0):
    if number <= 0:
        raise ValueError("Only positive integers are allowed")
    if number == 1:
        return count
    else:
        if number % 2 == 0:
            count += 1
            return steps(number / 2, count)
        else:
            count += 1
            return steps(number * 3 + 1, count)
