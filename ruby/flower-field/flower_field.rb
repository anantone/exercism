module FlowerField
  extend self

  def annotate(input)
    input.map.with_index do |line, row|
      line.chars.map.with_index do |char, col|
        next char if char != ' '

        count = neighbours(row, col, input).count('*')
        count.zero? ? ' ' : count.to_s
      end.join
    end
  end

  private

  def neighbours(row, col, input)
    (-1..1).flat_map do |dr|
      (-1..1).filter_map do |dc|
        next if dr.zero? && dc.zero?

        r = row + dr
        c = col + dc
        line = input[r] if r.between?(0, input.length - 1)
        line[c] if line && c.between?(0, line.length - 1)
      end
    end
  end
end