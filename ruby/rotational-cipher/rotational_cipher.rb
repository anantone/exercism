class RotationalCipher
  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

  def self.rotate(message, key)
    code = ''
    message.each_char do |char|
      # Copy punctuation, spaces, numbers
      if char.match(/\W|\d/)
        code << char
      # Capital letters remain capital
      elsif char.match(/[A-Z]/)
        char.downcase!
        switch = ALPHABET[(ALPHABET.index(char) + key) % 26]
        switch.upcase!
        code << switch
      # Default is lower case
      else
        code << ALPHABET[(ALPHABET.index(char) + key) % 26]
      end
    end
    return code
  end

end
