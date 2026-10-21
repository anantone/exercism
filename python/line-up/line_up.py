def line_up(name, number):
    ord = ''
    if number % 10 == 1 and number % 100 != 11:
        ord = 'st'
    elif number % 10 == 2 and number % 100 != 12:
        ord = 'nd'
    elif number % 10 == 3 and number % 100 != 13:
        ord = 'rd'
    else:
        ord = 'th'
    return f"{name}, you are the {number}{ord} customer we serve today. Thank you!"