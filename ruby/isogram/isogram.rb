class Isogram

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

  def self.isogram?(input)
    counts = ALPHABET.each_char.with_object([]) do |char, counts| 
      counts.push(input.downcase.count(char))
    end
    counts.none? { |count| count > 1 }
  end

end
