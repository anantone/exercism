class Anagram

  def initialize(word)
    self.word = word.downcase
  end

  attr_accessor :word

  def match(candidates)

    candidates.select do |candidate|
      dandicate = candidate.downcase
      next if dandicate == word
      dandicate.chars.sort!.join == word.chars.sort!.join
    end
      
    
  end

end