class Isogram

  def self.isogram?(input)
    counts = []
    'abcdefghijklmnopqrstuvwxyz'.each_char { |c| counts.push(input.downcase.count(c)) }
    counts.none? { |c| c > 1 }
  end

end
