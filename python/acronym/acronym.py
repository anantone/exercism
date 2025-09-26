import re

def abbreviate(string):
    apostrophe_squeeze = re.sub(r'[\']', '', string)
    alpha_only = re.sub(r'[^a-zA-Z]', ' ', apostrophe_squeeze)
    return ''.join([word[0].upper() for word in alpha_only.split()])
