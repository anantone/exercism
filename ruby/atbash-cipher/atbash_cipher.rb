module Atbash
  extend self

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'
  TEBAHPLA = 'zyxwvutsrqponmlkjihgfedcba'
  
  def encode(message)
    data = message.downcase
    code = data.each_char.with_object('') do |char, code|
      case char
      when /\W/ then next
      when /\d/ then code << char
      else
        code << TEBAHPLA[ALPHABET.index(char)]
      end
    end
  insert_spaces(code, 5)
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

  def decode(message)
    result = message.each_char.with_object('') do |char, result|
      case char
      when /\s/ then next
      when /\d/ then result << char
      else
        result << ALPHABET[TEBAHPLA.index(char)]
      end
    end
    result
  end
  
end
