class OcrNumbers
  DIGITS = [
    [" _ ", "| |", "|_|", "   "],  # 0
    ["   ", "  |", "  |", "   "],  # 1
    [" _ ", " _|", "|_ ", "   "],  # 2
    [" _ ", " _|", " _|", "   "],  # 3
    ["   ", "|_|", "  |", "   "],  # 4
    [" _ ", "|_ ", " _|", "   "],  # 5
    [" _ ", "|_ ", "|_|", "   "],  # 6
    [" _ ", "  |", "  |", "   "],  # 7
    [" _ ", "|_|", "|_|", "   "],  # 8
    [" _ ", "|_|", " _|", "   "],  # 9
  ].freeze

  LOOKUP = DIGITS.each_with_index.to_h { |glyph, i| [glyph.join("\n"), i.to_s] }.freeze

  def self.convert(input)
    lines = input.split("\n").reject { |l| l.empty? }
    raise ArgumentError, "Invalid input size" if lines.empty? || lines.length % 4 != 0

    width = lines.first.length
    raise ArgumentError, "Invalid input size" if width.zero? || width % 3 != 0 ||
                                                 lines.any? { |l| l.length != width }

    rows = []
    lines.each_slice(4) do |lines4|
      row = (0...width).step(3).map do |col|
        cell = lines4.map { |line| line[col, 3] }.join("\n")
        LOOKUP.fetch(cell, "?")
      end
      rows << row.join
    end
    rows.join(",")
  end
end