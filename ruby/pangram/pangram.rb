module Pangram

  ALPHABET = "abcdefghijklmnopqrstuvwxyz"
  
  def self.pangram?(sentence)
    ALPHABET.each_char.all? do |char| 
      sentence.downcase.include?(char)
    end
  end
  
end