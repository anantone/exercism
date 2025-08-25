class Cipher

  GENERATE_KEY = ->() { (0...100).map { (97 + rand(26)).chr }.join }

  private

  attr_writer :key,
              :shift,
              :message

  def initialize(key = GENERATE_KEY.call)
    raise ArgumentError if bad_key?(key)
    self.key = key
    self.shift = key.each_byte.map { |a| a - 97 }
    self.message = message
  end

  def bad_key?(key)
    # Key must not be capitalized, numeric, or empty
    /[[:upper:]]|^[0-9]+$|^$/.match(key)
  end

  public

  attr_reader :key,
              :shift,
              :message

  def code(message, shift)
    # Convert message to ASCII
    ascii = message.bytes
    # Apply shift to each ASCII code
    coded = ascii.each_with_index.map do |letter, index|
      letter + shift[index % shift.length]
    end
    # Wrap around alphabet as needed
    coded.map! do |letter|
      if letter > 122
        letter -= 26
      elsif letter < 97
        letter += 26
      else
        letter = letter
      end
    end
    # Return from ASCII to plaintext
    coded.map { |char| char.chr }.join
  end

  def encode(message)
    # Encode
    code(message, shift)
  end

  def decode(message)
    # Decoding, so shift is negative
    self.shift = shift.map(&:-@)
    # Decode
    code(message, shift)
  end

end
