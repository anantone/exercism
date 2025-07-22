class DndCharacter

  private

  attr_writer :strength,
              :dexterity,
              :constitution,
              :intelligence,
              :wisdom,
              :charisma,
              :hitpoints

  BASE_HITPOINTS = 10

  def initialize
    self.strength,
    self.dexterity,
    self.constitution,
    self.intelligence,
    self.wisdom,
    self.charisma      = 6.times.map { Die.roll.sum }
    self.hitpoints     = BASE_HITPOINTS + self.class.modifier(constitution)
  end

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


  public

  attr_reader   :strength,
                :dexterity,
                :constitution,
                :intelligence,
                :wisdom,
                :charisma,
                :hitpoints

end
