module Atbash
  extend self

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
  TEBAHPLA = 'zyxwvutsrqponmlkjihgfedcba'
  
  def encode(message)
    cipher = message.downcase.each_char.with_object('') do |char, cipher_string|
      case char
      when /\W/ then next
      when /\d/ then cipher_string << char
      else cipher_string << TEBAHPLA[ALPHABET.index(char)]
      end
    end
  insert_spaces(cipher, 5)
  end

  def insert_spaces(string, x)
  # Insert spaces every x char
    if string.length / x > 0
      (1..string.length/x).each do |n|
        string.insert(-1 + n*(x+1), ' ')
      end
    end
    string.rstrip
  end

  def decode(cipher)
    message = cipher.each_char.with_object('') do |char, message_string|
      case char
      when /\s/ then next
      when /\d/ then message_string << char
      else message_string << ALPHABET[TEBAHPLA.index(char)]
      end
    end
    message
  end
  
end
