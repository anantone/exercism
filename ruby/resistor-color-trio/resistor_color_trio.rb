class ResistorColorTrio

  COLORS = { 'black': 0, 'brown': 1, 'red': 2, 'orange': 3, 'yellow': 4, 'green': 5, 'blue': 6, 'violet': 7, 'grey': 8, 'white': 9 }

  def initialize(colors)
    @band1, @band2, @band3 = colors.map { |color| COLORS[color.to_sym] }
  end

  def label
    zeros = '0' * @band3
    value = @band1.to_s + @band2.to_s + zeros
    if value.to_i < 1000
      value << ' ohms'
    else
      value.gsub!(/000\b/, ' kiloohms')
    end
    'Resistor value: %s' % value
  end

end
