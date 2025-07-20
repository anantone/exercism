module ResistorColorDuo

  COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

  def self.code(color)
    COLORS.find_index(color).to_s
  end

  def self.value(colors)
    (code(colors[0]) + code(colors[1])).to_i
  end
  
end

  
  