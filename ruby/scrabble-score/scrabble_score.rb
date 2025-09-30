class Scrabble

  class TileError < ArgumentError
    def initialize(message='Where did you find that tile?')
      super
    end
  end

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
    français: {
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

  def initialize(tiles, set = {
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
    })
    self.tile_values = tiles.chars.map { |tile| value(tile.upcase, set) }
  end

  def value(letter, set)
    unless set.has_key?(letter.to_sym)
      raise TileError
    end
    set[letter.to_sym]
  end

  public

  attr_reader :tile_values

  def score
    tile_values.sum
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "SCRABBLE (EN) / SCRABBLE (FR)"
  puts
  puts "\"Muzjiks\" in English:   %d" % Scrabble.new('Muzjiks').score
  puts "\"Moujiks\" en français : %d" % Scrabble.new('Moujiks', {
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
    }).score
  puts "\"Muzji s\" in English:   %d" % Scrabble.new('Muzji s').score
  puts "\"Mouji s\" en français : %d" % Scrabble.new('Mouji s', {
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
    }).score
  puts
  puts "\"Jukebox\" in English:   %d" % Scrabble.new('Jukebox').score
  puts "\"Jukebox\" en français : %d" % Scrabble.new('Jukebox', {
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
    }).score
  puts "\"Ju ebox\" in English:   %d" % Scrabble.new('Ju ebox').score
  puts "\"Ju ebox\" en français : %d" % Scrabble.new('Ju ebox', {
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
    }).score
end
