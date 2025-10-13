def is_valid(isbn):
    isbn = isbn.replace('-', '')
    if len(isbn) != 10: return False
    if not isbn[:9].isdecimal(): return False
    sum = 0
    for i in range(9):
        sum += int(isbn[i]) * (10 - i)
    if isbn[9] == 'X':
        sum += 10
    elif isbn[9].isdecimal():
        sum += int(isbn[9])
    else:
        return False
    return sum % 11 == 0
        