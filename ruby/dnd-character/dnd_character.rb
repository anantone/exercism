



class DndCharacter



    #number of sides?
    def roll(sides = 6)
      rand(1..sides)
    end
    #a simple roll function (one roll, returns a number)

    #a function to roll z dice x times, with the option to keep y max, min, mid
    def self.roll(rolls:, top:)
      list_of_rolls = []
      (1..rolls).each do
      list_of_rolls.push(rand(1..6))
      end
      list_of_rolls.each.max(top).map
    end
  end

  def initialize
    @strength = Die.roll(rolls: 4, top: 3).sum
    @dexterity = Die.roll(rolls: 4, top: 3).sum
    @constitution = Die.roll(rolls: 4, top: 3).sum
    @intelligence = Die.roll(rolls: 4, top: 3).sum
    @wisdom = Die.roll(rolls: 4, top: 3).sum
    @charisma = Die.roll(rolls: 4, top: 3).sum
    @base_hitpoints = 10
    @modifier = (@constitution - 10) / 2
    @hitpoints = @base_hitpoints + @modifier
  end

  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :base_hitpoints, :modifier, :hitpoints

end
