class Gigasecond

  def self.from(time)
    Time.at(time.to_r + 1_000_000_000)
  end
  
end