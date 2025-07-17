class Cipher

  def initialize(key)
    if self.key == ''
      key = (0...100).map { rand(26).chr }.join
    end
    self.key = key
  end

  def encode(plaintext)


  end

  def decode
  end

end
