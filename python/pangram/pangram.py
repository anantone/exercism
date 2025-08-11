ALPHABET = 'abcdefghijklmnopqrstuvwxz'

def is_pangram(sentence):
    gram = sentence.lower().replace(' ', '')
    for char in ALPHABET:
        if char not in gram:
            return False
    return True
    
