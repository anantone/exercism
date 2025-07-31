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
  
  def code(ascii, shift)
    # Apply the shift to each character code
    ascii.each_with_index.map do |letter, index|
      letter + shift[index % shift.length]
    end
  end

  def encode(message)
    # Convert plaintext to ASCII code
    ascii = message.bytes
    # Apply the shift to each character code
    encoded = code(ascii, shift)
    # Wrap around alphabet as needed
    encoded.map! do |c|
     c > 122 ? c - 26 : c
    end 
    # Return from ASCII to ciphertext
    encoded.map { |c| c.chr }.join
  end

  def decode(ciphertext)
    # Convert ciphertext to ASCII code
    ascii = ciphertext.bytes
    # Decoding, so shift is negative
    shift = self.shift.map { |number| -number }
    # Apply the shift to each character code
    decoded = code(ascii, shift)
    # Wrap around alphabet as needed
    decoded.map! do |c|
      c < 97 ? c + 26 : c
    end
    # Return from ASCII to plaintext
    decoded.map { |c| c.chr }.join
  end

end
