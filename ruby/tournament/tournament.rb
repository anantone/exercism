module Tournament

  HEADER = "Team                           | MP |  W |  D |  L |  P\n"

  def self.tally(input)
    return HEADER if input == "\n"
    # Create results ledger
    ledger = {}
    # Read the results
    matches = input.lines
    matches.each do |match|
      team1, team2, result = match.split(';')
      # Create teams if not exist
      ledger[team1] = [0, 0, 0, 0, 0] unless ledger.keys.include?(team1)
      ledger[team2] = [0, 0, 0, 0, 0] unless ledger.keys.include?(team2)
      # Apply the game's outcome
      ledger[team1][0] += 1
      ledger[team2][0] += 1
      if result == 'win'
        ledger[team1][1] += 1
        ledger[team1][4] += 3
        ledger[team2][3] += 1
      elsif result == 'draw'
        ledger[team1][2] += 1
        ledger[team1][4] += 1
        ledger[team2][2] += 1
        ledger[team2][4] += 1
      elsif result == 'loss'
        ledger[team1][3] += 1
        ledger[team2][1] += 1
        ledger[team2][4] += 3
      end
    end
    # Rank the teams by points, tiebreak alpha
    rankings = ledger.sort_by { |key, value| [-value[4], key] }
    # Build a string for each team's results
    results = ''
    rankings.each do |team, tally|
      results << "%-31s| %2i | %2i | %2i | %2i | %2i\n" % 
[team, tally[0], tally[1], tally[2], tally[3], tally[4]]
    end
    # Display result table
    HEADER + results
  end

end

