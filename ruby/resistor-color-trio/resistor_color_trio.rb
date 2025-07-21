class ResistorColorTrio

  COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

  def initialize(colors)
    @color1, @color2, @color3 = colors.map { |color| self.code(color) }
  end

  def code(color)
    COLORS.find_index(color).to_s
  end

  def label
    zeros = '0' * @color3.to_i
    value = @color1 + @color2 + zeros
    if value[-3, 3] == '000'
      value.gsub!(/000\b/, ' kiloohms')
    else
      value << ' ohms'
    end
    'Resistor value: %s' % value
  end

end
