module Hamming

  def self.compute(string1, string2)
    raise ArgumentError.new if string1.length != string2.length
    mistakes = 0
    string1.chars.each_with_index do |value, index|
      mistakes += 1 if value != string2.chars[index]
    end
    mistakes
  end

end
