class Frame
  attr_reader :number, :rolls

  def initialize(number)
    @number = number
    @rolls = []
  end

  def roll(pins)
    rolls << pins
  end

  def strike? = rolls.first == 10
  def spare?  = rolls.size == 2 && rolls.sum == 10
  def pins_down = rolls.sum
  def bonus_rolls = number == 10 ? 0 : strike? ? 2 : spare? ? 1 : 0
end

class Game
  class BowlingError < StandardError; end

  MESSAGES = {
    pins:  "Pin count must be a number between 0 and 10",
    over:  "Cannot roll after game is over",
    up:    "Pin count exceeds pins on this roll",
    score: "Score cannot be taken until the end of the game"
  }

  def initialize
    @frames = [Frame.new(1)]
  end

  def roll(pins)
    raise BowlingError, MESSAGES[:pins]  unless pins.is_a?(Integer) && (0..10).cover?(pins)
    raise BowlingError, MESSAGES[:over] if finished?
    raise BowlingError, MESSAGES[:up]  if pins > pins_standing
    
    current.roll(pins)
    advance!
  end

  def score
    raise BowlingError, MESSAGES[:score] unless finished?

    @frames.sum do |frame|
      frame.pins_down + rolls_after(frame).first(frame.bonus_rolls).sum
    end
  end

  private

  def current = @frames.last

  def advance!
    return if current.number == 10
    @frames << Frame.new(current.number + 1) if current.strike? || current.rolls.size == 2
  end

  def pins_standing
    f = current
    r = f.rolls
  
    return 10 if r.empty?                  # first ball of any frame
    return 10 - r.sum if f.number < 10    # second ball, frames 1-9  <-- the fix
  
    return 10 if r.size == 3               # (unreachable: finished? fires first)
    return f.strike? ? 10 : 10 - r[0] if r.size == 1
  
    # 10th frame, two rolls
    f.strike? ? (r[1] == 10 ? 10 : 10 - r[1]) : (f.spare? ? 10 : 0)
  end

  def finished?
    f = @frames.last
    f.number == 10 && (f.rolls.size == 3 || (f.rolls.size == 2 && !f.strike? && !f.spare?))
  end

  def rolls_after(frame)
    @frames[(@frames.index(frame) + 1)..].flat_map(&:rolls)
  end
end