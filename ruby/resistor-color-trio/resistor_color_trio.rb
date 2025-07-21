class ResistorColorTrio

  COLORS = {  'black':   0, 
              'brown':   1, 
              'red':     2, 
              'orange':  3,  
              'yellow':  4, 
              'green':   5, 
              'blue':    6, 
              'violet':  7, 
              'grey':    8, 
              'white':   9 }

  def initialize(colors)
    self.band1, self.band2, self.band3 = colors.map { |color| COLORS[color.to_sym] }
  end

  attr_accessor :band1, :band2, :band3
  
  def label
    zeros = '0' * self.band3
    value = self.band1.to_s + self.band2.to_s + zeros
    if value.to_i < 1000
      value << ' ohms'
    else
      value.gsub!(/000\b/, ' kiloohms')
    end
    'Resistor value: %s' % value
  end

end
