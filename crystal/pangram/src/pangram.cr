module Pangram
  
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  
  def self.pangram?(sentence : String) : Bool
    ALPHABET.each_char.all? do |char| 
      sentence.downcase.includes?(char)
    end
  end
  
end
