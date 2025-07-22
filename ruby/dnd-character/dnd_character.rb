class DndCharacter

  BASE_HITPOINTS = 10

  module Die

    def self.roll(rolls: 4, top: 3)
      (1..rolls).map do
        rand(1..6)
      end.max(top)
    end

  end

  def self.modifier(constitution)
      (constitution - 10)/2
    end

  private

  attr_writer :strength,
              :dexterity,
              :constitution,
              :intelligence,
              :wisdom,
              :charisma,
              :hitpoints

  def initialize
    self.strength,
    self.dexterity,
    self.constitution,
    self.intelligence,
    self.wisdom,
    self.charisma      = 6.times.map { Die.roll.sum }
    self.hitpoints     = BASE_HITPOINTS + self.class.modifier(constitution)
  end


  public

  attr_accessor :strength,
                :dexterity,
                :constitution,
                :intelligence,
                :wisdom,
                :charisma,
                :hitpoints

end
