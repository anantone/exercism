class Tournament

  def self.tally(input)
    # Format header
    header = "%-31s" % "Team"
    header << "%s" % "| MP "
    header << "%s" % "|  W "
    header << "%s" % "|  D "
    header << "%s" % "|  L "
    header << "%s" % "|  P\n"
    # Return empty table
    if input == "\n"
      return header
    end
    # Create results ledger
    teams = {}
    # Read the results
    matches = input.split("\n")
    matches.each do |match|
      result = match.split(';')
      # Create teams if not exist
      unless teams.keys.include?(result[0])
        teams[result[0]] = [0, 0, 0, 0, 0]
      end
      unless teams.keys.include?(result[1])
        teams[result[1]] = [0, 0, 0, 0, 0]
      end
      # Apply the game's outcome
      if result[2] == 'win'
        teams[result[0]][0] += 1
        teams[result[0]][1] += 1
        teams[result[0]][4] += 3
        teams[result[1]][0] += 1
        teams[result[1]][3] += 1
      elsif result[2] == 'draw'
        teams[result[0]][0] += 1
        teams[result[0]][2] += 1
        teams[result[0]][4] += 1
        teams[result[1]][0] += 1
        teams[result[1]][2] += 1
        teams[result[1]][4] += 1
      elsif result[2] == 'loss'
        teams[result[0]][0] += 1
        teams[result[0]][3] += 1
        teams[result[1]][0] += 1
        teams[result[1]][1] += 1
        teams[result[1]][4] += 3
      end
    end
    # Rank the teams by points, tiebreak alpha
    rankings = teams.sort_by { |key, value| [-value[4], key] }
    # Build a string for each team's results
    results = ''
    rankings.each do |team, tally|
      results << "%-31s" % team 
      results << "| %2i " % tally[0]
      results << "| %2i " % tally[1]
      results << "| %2i " % tally[2] 
      results << "| %2i " % tally[3] 
      results << "| %2i\n" % tally[4]
    end
    # Display result table
    header + results
  end

end

