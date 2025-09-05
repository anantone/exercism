class ResistorColorTrio

  BANDS = {
     black:  0,
     brown:  1,
       red:  2,
    orange:  3,
    yellow:  4,
     green:  5,
      blue:  6,
    violet:  7,
      grey:  8,
     white:  9 
  }

  private attr_writer :band1, :band2, :band3

  def initialize(bands)
    self.band1,
    self.band2,
    self.band3 = bands.map { |band| BANDS[band.to_sym] }
  end

  attr_reader :band1, :band2, :band3

  def label
    value = '%i%ie+%i' % [band1, band2, band3]
    unit = 'ohms'
    if value.to_f > 1000
      value = value.to_f / 1000
      unit = 'kiloohms'
    end
    'Resistor value: %<value>g %<unit>s' % [value: value, unit: unit]
  end

end
