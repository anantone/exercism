class Affine

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

  def initialize(a, b)
    unless is_coprime?(a, 26)
      raise ArgumentError.new
    end
    self.a = a
    self.b = b
  end

  attr_accessor :a, :b

  def is_coprime?(a, b)
    a.gcd(b) == 1
  end

  def encode(message)
    code = ''
    message.downcase!
    message.each_char do |char|
      # Get rid of punctuation and space
      if char.match(/\s|\W/)
        next
      # Copy digits
      elsif
        char.match(/\d/)
        code << char
      # Apply formula
      else
        code << ALPHABET[(a * ALPHABET.index(char) + b) % 26]
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

  def decode(message)
    code = ''
    message.each_char do |char|
      # Skip white space
      if char.match(/\s/)
        next
      # Transcode numbers
      elsif char.match(/\d/)
        code << char
      # Reverse using formula
      else
        code << ALPHABET[(extended_euclidean(a, 26)[3] * (ALPHABET.index(char) - b)) % 26]
      end
    end
    # Return decoded message
    code
  end

  # Extended Euclidean algorithm
  #
  # given integers a and m, iteratively computes:
  #  * coefficients s and t that satisfies Bézout's Identity: s*a + t*m == gcd(a, m)
  #  * greatest common denominator: gcd(a, m)
  #  * modular multiplicative inverse of a with respect to the modulus m, if it exists
  def extended_euclidean(a, m)
    r0, r1 = a, m
    s, t = 1, 0
    until r1.zero?
      q, r2 = r0.divmod(r1) # Euclidean algorithm
      r0, r1 = r1, r2
      s, t = t, s - q * t # extended Euclidean algorithm
    end
    gcd = r0
    t = (gcd - s * a) / m # from Bézout's Identity
    inv = if gcd.abs == 1
            s < 0 ? s + m : s # modular multiplicative inverse
          end
    [s, t, gcd, inv]
  end

end