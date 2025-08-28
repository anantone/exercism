module Reverser
  
  def self.reverse(string)
    reversed_string = ''
    string.chars.each do |char|
      reversed_string = char + reversed_string
    end
    reversed_string
  end
  
end
