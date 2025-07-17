def response(hey_bob):
    if hey_bob == "" or hey_bob.isspace():
        return "Fine. Be that way!"
    hey_bob = hey_bob.strip()
    if hey_bob[-1] == "?" and hey_bob.isupper():
        return "Calm down, I know what I'm doing!"
    if hey_bob[-1] == "?":
        return "Sure."
    if hey_bob.isupper():
        return "Whoa, chill out!"
    return "Whatever."
