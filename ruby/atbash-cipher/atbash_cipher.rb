class Atbash
  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
  TEBAHPLA = 'zyxwvutsrqponmlkjihgfedcba'
  
  def self.encode(message)
    code = ''
    # Downcase everything
    data = message.downcase
    data.each_char do |char|
      # Get rid of punctuation and space
      if char.match(/\W/)
        next
      elsif char.match(/\d/)
        code << char
      else
      # Reverse using index
        code << TEBAHPLA[ALPHABET.index(char)]
      end
    end
    # Insert spaces every 5 char
    if code.length / 5 > 0
      (1..code.length/5).each do |n|
        code.insert(-1 + n*6, ' ')
      end
    code.rstrip!
    end
    # Return encoded message
    code
  end

  def self.decode(message)
    result = ''
    message.each_char do |char|
      # Skip white space
      if char.match(/\s/)
        next
      # Decode numbers
      elsif char.match(/\d/)
        result << char
      # Reverse using index
      else
        result << ALPHABET[TEBAHPLA.index(char)]
      end
    end
    # Return decoded message
    result
  end
  
end
