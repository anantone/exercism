class Cipher

  def initialize(key = '')
    @plaintext = plaintext
    unless key.match(/[a-zA-Z]+/)
      raise ArgumentError.new
    end
    if key == ''
      @key = (0...100).map { rand(26).chr }.join
    else
      @key = key
    end
  end

  attr_reader :plaintext, :key

  def encode(plaintext)

  end

  def decode(encodedtext)
  end
end
