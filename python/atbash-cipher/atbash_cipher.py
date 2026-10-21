ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
TEBAHPLA = 'zyxwvutsrqponmlkjihgfedcba'

def _insert_spaces(string, x):
    """Insert a space every x characters."""
    return ' '.join(string[i:i+x] for i in range(0, len(string), x))

def encode(message):
    """Encode a message using the Atbash cipher."""
    cipher = []
    for char in message.lower():
        if not char.isalnum():
            continue
        if char.isdigit():
            cipher.append(char)
        else:
            # Map letter to its reverse counterpart
            idx = ALPHABET.index(char)
            cipher.append(TEBAHPLA[idx])
    
    return _insert_spaces(''.join(cipher), 5)

def decode(cipher):
    """Decode an Atbash cipher string."""
    message = []
    for char in cipher:
        if char.isspace():
            continue
        if char.isdigit():
            message.append(char)
        else:
            # Map letter back to original
            idx = TEBAHPLA.index(char)
            message.append(ALPHABET[idx])
    
    return ''.join(message)