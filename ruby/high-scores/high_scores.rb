class HighScores

  attr_reader :scores

  def initialize(scores)
    @scores = scores.dup
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top_three
    return nil if scores.empty?
    
    scores.max(3)
  end

  def latest_is_personal_best?
    return false if scores.empty?
    
    latest == personal_best
  end
end