class Scrabble

  TILES = {
    A: 1, B: 3, C: 3, D:  2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M:  3,
    N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10
  }

  private

  attr_writer :tiles

  def initialize(tiles)
    self.tiles = tiles.split('').map { |t| t.upcase }
  end

  def value(letter)
    TILES[letter.to_sym]
  end

  public

  attr_reader :tiles

  def score
    tiles.sum { |t| value(t) }
  end

end

