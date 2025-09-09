class Scrabble

  def initialize(word)
    self.word = word
  end

  attr_accessor :word

  def score
    score = 0
    word.each_char { |c| score += value(c.downcase) }
    score
  end

  def value(letter)
    case letter
    when ->(x) { 'aeioulnrst'.include?(x) } then 1
    when ->(x) { 'dg'.include?(x) }         then 2
    when ->(x) { 'bcmp'.include?(x) }       then 3
    when ->(x) { 'fhvwy'.include?(x) }      then 4
    when       'k'                          then 5
    when ->(x) { 'jx'.include?(x) }         then 8
    when ->(x) { 'qz'.include?(x) }         then 10
    end
  end
  
end