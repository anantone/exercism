class Scrabble

  def initialize(word)
    self.word = word
  end

  attr_accessor :word

  def score
    score = 0
    word.each_char { |c| score += value(c.downcase)}
    score
  end

  def value(letter)
    if 'aeioulnrst'.include?(letter)
      1
    elsif 'dg'.include?(letter)
      2
    elsif 'bcmp'.include?(letter)
      3
    elsif 'fhvwy'.include?(letter)
      4
    elsif letter == 'k'
      5
    elsif 'jx'.include?(letter)
      8
    elsif 'qz'.include?(letter)
      10
    end
  end
  
end