def is_isogram(string):
    letters = string.lower().replace(' ', '').replace('-', '')
    for char in letters:
        if letters.count(char) > 1:
            return False
    return True
