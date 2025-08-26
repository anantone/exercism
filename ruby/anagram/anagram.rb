class Anagram

  def initialize(word)
    self.word = word.downcase
  end

  attr_accessor :word

  def match(candidates)
    candidates.select do |candidate| 
      candidate.downcase != word && 
        candidate.downcase.chars.sort == word.chars.sort
    end 
  end

end