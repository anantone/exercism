class DndCharacter

  module Die

    def self.roll(rolls: 4, top: 3)
      (1..rolls).map do
        rand(1..6)
      end.max(top)
    end

  end

  def initialize
    self.strength       = Die.roll.sum
    self.dexterity      = Die.roll.sum
    self.constitution   = Die.roll.sum
    self.intelligence   = Die.roll.sum
    self.wisdom         = Die.roll.sum
    self.charisma       = Die.roll.sum
    self.base_hitpoints = 10
    self.modifier       = self.class.modifier(constitution)
    self.hitpoints      = @base_hitpoints + @modifier
  end

  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  attr_accessor :strength,
                :dexterity,
                :constitution,
                :intelligence,
                :wisdom,
                :charisma,
                :base_hitpoints,
                :modifier,
                :hitpoints

end