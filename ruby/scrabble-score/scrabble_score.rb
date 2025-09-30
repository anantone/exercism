class Scrabble

  TILESET = {
    English: {
      A:  1,  N:  1,
      B:  3,  O:  1,
      C:  3,  P:  3,
      D:  2,  Q: 10,
      E:  1,  R:  1,
      F:  4,  S:  1,
      G:  2,  T:  1,
      H:  4,  U:  1,
      I:  1,  V:  4,
      J:  8,  W:  4,
      K:  5,  X:  8,
      L:  1,  Y:  4,
      M:  3,  Z: 10,
          " ": 0
    },
    French: {
      A:  1,  N:  1,
      B:  3,  O:  1,
      C:  3,  P:  3,
      D:  2,  Q:  8,
      E:  1,  R:  1,
      F:  4,  S:  1,
      G:  2,  T:  1,
      H:  4,  U:  1,
      I:  1,  V:  4,
      J:  8,  W: 10,
      K: 10,  X: 10,
      L:  1,  Y: 10,
      M:  2,  Z: 10,
          " ": 0
    }
  }

  private

  attr_writer :tile_values

  def initialize(tiles, set)
    self.tile_values = tiles.chars.map { |tile| value(tile.upcase, set) }
  end

  def value(letter, set)
    TILESET[set.to_sym][letter.to_sym]
  end

  public

  attr_reader :tile_values

  def score
    tile_values.sum
  end

end

if __FILE__ == $PROGRAM_NAME
  puts
  puts "\"Muzjiks\" in English: %d" % Scrabble.new('Muzjiks', 'English').score
  puts "\"Moujiks\" in French:  %d" % Scrabble.new('Moujiks', 'French').score
  puts "\"Muzji s\" in English: %d" % Scrabble.new('Muzji s', 'English').score
  puts "\"Mouji s\" in French:  %d" % Scrabble.new('Mouji s', 'French').score
  puts
  puts "\"Jukebox\" in English: %d" % Scrabble.new('Jukebox', 'English').score
  puts "\"Jukebox\" in French:  %d" % Scrabble.new('Jukebox', 'French').score
  puts "\"Ju ebox\" in English: %d" % Scrabble.new('Ju ebox', 'English').score
  puts "\"Ju ebox\" in French:  %d" % Scrabble.new('Ju ebox', 'French').score
end
