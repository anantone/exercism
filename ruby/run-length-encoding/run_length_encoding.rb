class RunLengthEncoding
  
  def self.encode(input)
    input.gsub(/(.)\1+/) { |m| "#{m.length}#{m[0]}" }
  end

  def self.decode(input)
    input.gsub(/\d+./) { |m| m[-1] * m.to_i }
  end

end
