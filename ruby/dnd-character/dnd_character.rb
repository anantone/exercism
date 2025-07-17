class DndCharacter
  
  def self.modifier(constitution)
    modifier = (constitution - 10) / 2
  end

  def strength
    @strength ||= dice_rolls
  end

  def dexterity
    @dexterity ||= dice_rolls
  end

  def constitution
    @constitution ||= dice_rolls
  end

  def intelligence
    @intelligence ||= dice_rolls
  end

  def wisdom
    @wisdom ||= dice_rolls
  end

  def charisma
    @charisma ||= dice_rolls
  end

  def hitpoints
    hitpoints = 10 + self.class.modifier(constitution)
  end
  
  def dice_rolls
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    a + b + c + d - [a, b, c, d].min
  end

  def dice_roller
    rand(1..6)
  end
  
end

