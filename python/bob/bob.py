def response(hey_bob):
    if hey_bob[-1] == "?" and hey_bob.isupper():
        return "Calm down, I know what I'm doing!"
    if hey_bob[-1] == "?":
        return "Sure"
    if hey_bob.isupper():
        return "Whoa, chill out!"
    if hey_bob.isspace():
        return "Fine. Be that way!"
    return "Whatever."
