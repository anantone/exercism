class DndCharacter
  
  def self.modifier(constitution)
    modifier = (constitution - 10) / 2
  end

  def strength
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    @strength ||= a + b + c + d - [a, b, c, d].min
  end

  def dexterity
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    @dexterity ||= a + b + c + d - [a, b, c, d].min
  end

  def constitution
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    @constitution ||= a + b + c + d - [a, b, c, d].min
  end

  def intelligence
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    @intelligence ||= a + b + c + d - [a, b, c, d].min
  end

  def wisdom
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    @wisdom ||= a + b + c + d - [a, b, c, d].min
  end

  def charisma
    a = dice_roller
    b = dice_roller
    c = dice_roller
    d = dice_roller
    @charisma ||= a + b + c + d - [a, b, c, d].min
  end

  def hitpoints
    hitpoints = 10 + self.class.modifier(constitution)
  end

  def dice_roller
    rand(1..6)
  end

end

