class Teams

  attr_accessor :name, :mp, :w, :d, :l, :pts

  def initialize(name, mp = 0, w = 0, d = 0, l = 0, pts = 0)
    self.name = name
    self.mp = mp
    self.w = w
    self.d = d
    self.l = l
    self.pts = pts
  end

  def play(result)
    self.mp += 1
    case result
    when 'win'
      self.w += 1
      self.pts += 3
    when 'draw'
      self.d += 1
      self.pts += 1
    when 'loss'
      self.l += 1
    end
  end
end

class Tournament < Teams

  def self.tally(input)
    header = "Team                           | MP |  W |  D |  L |  P\n"
    if input.empty? 
      header
    end
    matches = input.split("\n")
    matches.each do |match|
      result = match.split(';')
      # Create Team instance if not exist
      if !result[0].instance_of? Teams
        result[0] = Teams.new(result[0])
      end
      if !result[1].instance_of? Teams
        result[1] = Teams.new(result[1])
      end
      # Apply the game's outcome
      if result[2] == 'win'
        result[0].play('win')
        result[1].play('loss')
      elsif result[2] == 'draw'
        result[0].play('draw')
        result[1].play('draw')
      elsif result[2] == 'loss'
        result[0].play('loss')
        result[1].play('win')
      end
    end
    # Rank the teams by points
    rankings = ObjectSpace.each_object(Teams).to_a
    rankings.sort_by! { |team| -team.pts } 
    # Build a string for each team's results
    results = ''
    rankings.each do |team|
      results << "%s             |  %i |  %i |  %i |  %i |  %i\n" % [team.name, team.mp, team.w, team.d, team.l, team.pts]
    end
    # Display result table
    header + results
  end

end

