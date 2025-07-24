module Die

  def self.roll(rolls: 4, top: 3)
    (1..rolls).map do
    rand(1..6)
    end.max(top)
  end

end
