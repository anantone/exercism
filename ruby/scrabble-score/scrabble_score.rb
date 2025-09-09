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
  
  def initialize(word)
    self.word = word
  end

  attr_accessor :word

  def score
    score = 0
    word.each_char { |letter| score += value(letter.downcase) }
    score
  end

  def value(letter)
    LPV.each_pair do |points, letters|
      return points if letters.include?(letter)
    end
  end
  
end