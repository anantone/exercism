import re

def abbreviate(words):
    acronym = ''
    clean_words = re.sub(r'[^a-zA-Z]', ' ', words)
    for word in clean_words.split():
        if word == 's': continue
        acronym += word[0].upper()
    return acronym
