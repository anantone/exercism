class ResistorColorTrio

  BANDS = {   
        black:   0,
        brown:   1,
        red:     2,
        orange:  3,
        yellow:  4,
        green:   5,
        blue:    6,
        violet:  7,
        grey:    8,
        white:   9 
  }

  private attr_writer :band1, :band2, :band3
  
  def initialize(bands)
    self.band1, 
    self.band2, 
    self.band3 = bands.map { |band| BANDS[band.to_sym] }
  end

  public

  attr_reader :band1, :band2, :band3

  def label
    zeros = '0' * band3
    value = band1.to_s + band2.to_s + zeros
    if value.to_i < 1000
      value << ' ohms'
    else
      value.gsub!(/000\b/, ' kiloohms')
    end
    'Resistor value: %s' % value
  end

end
