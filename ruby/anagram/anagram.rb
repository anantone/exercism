class Anagram

  def initialize(word)
    self.word = word.downcase
  end

  attr_accessor :word

  def match(candidates)
    elected = []
    candidates.each do |candidate|
      dandicate = candidate.downcase
      if dandicate == word
        next
      elsif dandicate.split('').sort!.join == word.split('').sort!.join
        elected.push(candidate)
      else
        next
      end
    end
    elected
  end

end