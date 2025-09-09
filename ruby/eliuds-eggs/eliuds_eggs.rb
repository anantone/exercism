module EliudsEggs
  
  def self.egg_count(binary)
    count = 0
    while binary > 0
      a = binary % 2
      count += 1 if a == 1
      binary = binary / 2
    end
    count
  end
  
end