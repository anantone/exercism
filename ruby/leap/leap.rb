module Year
  def self.leap?(year)
    (year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?
  end
end
    