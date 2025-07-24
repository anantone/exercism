class DndCharacter
  require_relative 'die'

  BASE_HITPOINTS = 10

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

  attr_reader   :strength,
                :dexterity,
                :constitution,
                :intelligence,
                :wisdom,
                :charisma,
                :hitpoints

end

