class Cipher

  GENERATE_KEY = ->() { (0...100).map { (97 + rand(26)).chr }.join }

  private

  attr_writer :key,
              :shift,
              :message

  def initialize(key = GENERATE_KEY.call)
    # Raise ArgumentError if key CAPS, numeric, or empty
    if /[[:upper:]]|^[0-9]+$|^$/.match(key)
      raise ArgumentError.new
    end
    self.key = key
    self.shift = key.each_byte.map do |a|
        a - 97
      end
    self.message = message
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
    shift = self.shift.map { |number| -number }
    # Decode
    code(message, shift)
  end

end
