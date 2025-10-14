def is_valid(isbn):
    
    isbn = isbn.replace('-', '')
    
    if len(isbn) != 10:
        return False
        
    sum = 0
    for index, digit in enumerate(list(isbn)):
        if digit.isdecimal():
            sum += int(digit) * (10 - index)
        elif digit == 'X':
            sum += 10
        else:
            return False
            
    return sum % 11 == 0
        