class Cipher

  def initialize
    @key = key
  end

  def key
    if @key == ''
      @key = (0...100).map { rand(26).chr }.join
    end
    @key
  end

  def encode(plaintext)

  end

  def decode(ciphertext)
  end
end
