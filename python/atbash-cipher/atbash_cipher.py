ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
TEBAHPLA = 'zyxwvutsrqponmlkjihgfedcba'

def _insert_spaces(string, x):
    """Insert a space every x characters."""
    return ' '.join(string[i:i+x] for i in range(0, len(string), x))

def encode(message):
    """Encode a message using the Atbash cipher."""
    cipher_chars = (
        TEBAHPLA[ALPHABET.index(char)] if char.isalpha() else char
        for char in message.lower()
        if char.isalnum()
    )
    return _insert_spaces(''.join(cipher_chars), 5)

def decode(cipher):
    """Decode an Atbash cipher string."""
    message_chars = (
        ALPHABET[TEBAHPLA.index(char)] if char.isalpha() else char
        for char in cipher.lower()
        if char.isalnum()
    )
    return ''.join(message_chars)