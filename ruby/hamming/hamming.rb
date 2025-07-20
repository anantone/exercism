module Hamming

  def self.compute(string1, string2)
    if string1.length != string2.length
      raise ArgumentError.new
    end
    mistakes = 0
    string1.chars.each_with_index do |value, index|
      if value != string2.chars[index]
        mistakes += 1
      end
    end
    mistakes
  end

end
