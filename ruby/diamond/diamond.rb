module Diamond
  extend self

  def make_diamond(letter)
    max_row = to_number(letter)
    result = ""
    (1..max_row).each do |row|
      build_row(row, result, max_row)
    end
    (max_row - 1).downto(1) do |row|
      build_row(row, result, max_row)
    end
    result
  end

  def build_row(row, result, max_row)
    result << ' ' * (max_row - 1 - (row - 1))
    result << to_letter(row)
    result << ' ' * (-3 + 2 * row) unless row == 1
    result << to_letter(row) unless row == 1
    result << ' ' * (max_row - 1 - (row - 1)) + "\n"
  end

  def to_number(letter)
    letter.ord - 64
  end

  def to_letter(row)
    (row + 64).chr
  end

end
