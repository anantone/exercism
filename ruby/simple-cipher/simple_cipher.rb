class Cipher

  # If no key is provided, generate a key which consists of at least 100 random lowercase letters from the Latin alphabet.

  def initialize(key = (0...100).map { (97 + rand(26)).chr }.join)
    # Raise ArgumentError if key CAPS, numeric, or empty
    if /[[:upper:]]|^[0-9]+$|^$/.match(key)
      raise ArgumentError.new
    end
    @key = key
    @plaintext = plaintext
  end

  attr_reader :plaintext, :key

  def encode(plaintext)
    # Convert plaintext to ASCII code
    ascii = plaintext.bytes
    # Calculate the shift based on key
    offset = key.each_byte.map do |a|
      a - 97
    end
    # Apply the shift to each character code
    ciphed = ascii.each_with_index.map do |a, idx|
      a + offset[idx % offset.length]
    end
    # Wrap around alphabet as needed
    ciphed.map! do |c|
     c > 122 ? c - 26 : c
    end 
    # Return from ASCII to ciphertext
    ciphed.map { |c| c.chr }.join
  end

  def decode(ciphertext)
    # Convert ciphertext to ASCII code
    ascii = ciphertext.bytes
    # Calculate the shift based on key
    offset = key.each_byte.map do |a|
      a - 97
    end
    # Apply the shift to each character code
    ciphed = ascii.each_with_index.map do |a, idx|
      a - offset[idx % offset.length]
    end
    # Wrap around alphabet as needed
    ciphed.map! do |c|
      c < 97 ? c + 26 : c
    end
    # Return from ASCII to plaintext
    ciphed.map { |c| c.chr }.join
  end
end
