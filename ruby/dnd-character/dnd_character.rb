class DndCharacter

  module Die

    def self.roll(rolls: 4, top: 3)
      (1..rolls).map do
        rand(1..6)
      end.max(top)
    end

  end

  def initialize
    @strength       = Die.roll.sum
    @dexterity      = Die.roll.sum
    @constitution   = Die.roll.sum
    @intelligence   = Die.roll.sum
    @wisdom         = Die.roll.sum
    @charisma       = Die.roll.sum
    @base_hitpoints = 10
    @modifier       = (@constitution - 10) / 2
    @hitpoints      = @base_hitpoints + @modifier
  end

  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  attr_reader :strength,
              :dexterity,
              :constitution,
              :intelligence,
              :wisdom,
              :charisma,
              :base_hitpoints,
              :modifier,
              :hitpoints

end
