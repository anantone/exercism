class RotationalCipher

  UPPER_CASE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  LOWER_CASE = 'abcdefghijklmnopqrstuvwxyz'

  def self.rotate(message, key)
    code = message.each_char.with_object('') do |char, code|
      if char.match(/\W|\d/)
        code << char
      else
        alphabet = char.match(/[A-Z]/) ? UPPER_CASE : LOWER_CASE
        code << alphabet[(alphabet.index(char) + key) % 26]
      end
    end
    code
  end

end
