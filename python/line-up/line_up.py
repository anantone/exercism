def line_up(name, number):
    suffix = ''
    if number % 10 == 1 and number % 100 != 11:
        suffix = 'st'
    elif number % 10 == 2 and number % 100 != 12:
        suffix = 'nd'
    elif number % 10 == 3 and number % 100 != 13:
        suffix = 'rd'
    else:
        suffix = 'th'
    return f"{name}, you are the {number}{suffix} customer we serve today. Thank you!"