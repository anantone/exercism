=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter

  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  def initialize
    strength = nil
    dexterity = nil
    constitution = nil
    intelligence = nil
    wisdom = nil
    charisma = nil
    hitpoints = nil
  end

  def strength
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def dexterity
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def constitution
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def intelligence
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def wisdom
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def charisma
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def hitpoints
    10 + @modifier
  end

  def dice_roller
    rand(1..6)
  end

end
