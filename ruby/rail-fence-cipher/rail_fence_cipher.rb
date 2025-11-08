module RailFenceCipher
  extend self

  def decode(cipher, rows)
    zigzag(rows, cipher.length).
      sort.
      zip(cipher.chars).
      sort_by { |a| a[0][1] }.
      map { |a| a[1] }.
      join
  end

  def encode(message, rows)
    zigzag(rows, message.length).
      zip(message.chars).
      sort.
      map { |a| a[1] }.
      join
  end

  def zigzag(rows, size)
    pattern = (0...rows).to_a + (1...rows - 1).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end
end
