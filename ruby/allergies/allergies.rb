class Allergies

  def initialize(score)
    self.score = score
  end

  attr_accessor :score

  def allergic_to?(allergen)
    list.include?(allergen)
  end

  def list
    list = []
    if self.score >= 256
      self.score -= 256
    end
    if self.score >= 128
      self.score -= 128
      list.push('cats')
    end
    if self.score >= 64
      self.score -= 64
      list.push('pollen')
    end
    if self.score >= 32
      self.score -= 32
      list.push('chocolate')
    end
    if self.score >= 16
      self.score -= 16
      list.push('tomatoes')
    end
    if self.score >= 8
      self.score -= 8
      list.push('strawberries')
    end
    if self.score >= 4
      self.score -= 4
      list.push('shellfish')
    end
    if self.score >= 2
      self.score -= 2
      list.push('peanuts')
    end
    if self.score == 1
      list.push('eggs')
    end
    list.reverse
  end

  end

