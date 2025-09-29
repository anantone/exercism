class Scrabble

  LPV = LETTERS_POINT_VALUE = {
     1 => 'aeioulnrst',
     2 =>         'dg',
     3 =>       'bcmp',
     4 =>      'fhvwy',
     5 =>          'k',
     8 =>         'jx',
    10 =>         'qz'
  }

  private_constant :LPV

  private

  attr_writer :word
  
  def initialize(word)
    self.word = word
  end

  def value(letter)
    LPV.each_pair do |points, letters|
      return points if letters.include?(letter)
    end
  end

  public

  attr_reader :word
  
  def score
    word.each_char.with_object([]) do |letter, score| 
      score.push(value(letter.downcase)) 
    end.sum
  end
  
end