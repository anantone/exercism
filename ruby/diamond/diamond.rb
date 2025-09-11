module Diamond
  extend self

  def make_diamond(letter)
    width = (to_number(letter) - 1) * 2 + 1
    height = 1 + (to_number(letter) - 1) * 2
    result = ""
    (1..to_number(letter)).each do |row|
      result << ' ' * (to_number(letter) - 1 - (row - 1))
      result << to_letter(row)
      result << ' ' * (-3 + 2 * row) unless row == 1
      result << to_letter(row) unless row == 1
      result << ' ' * (to_number(letter) - 1 - (row - 1)) + "\n"
    end
    (to_number(letter) - 1).downto(1) do |row|
      result << ' ' * (to_number(letter) - 1 - (row - 1))
      result << to_letter(row)
      result << ' ' * (-3 + 2 * row) unless row == 1
      result << to_letter(row) unless row == 1
      result << ' ' * (to_number(letter) - 1 - (row - 1)) + "\n"
    end
    result
  end
  
  def to_number(letter)
    letter.ord - 64
  end

  def to_letter(row)
    (row + 64).chr
  end
  
end
