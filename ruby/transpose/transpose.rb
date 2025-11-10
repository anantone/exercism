module Transpose
  def self.transpose(input)
    lines = input.split("\n")
    max_col = lines.map(&:length).max
    lines
      .map { |line| line.ljust(max_col, "\0") }
      .map(&:chars)
      .transpose
      .map(&:join)
      .join("\n")
      .gsub(/\0+$/, "")
      .gsub(/\0/, " ")
  end
end
