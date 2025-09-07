class ComplexNumber

  private

  attr_writer :real, :imaginary
  
  def initialize(real, imaginary = 0)
    self.real = real
    self.imaginary = imaginary
  end

  public

  attr_reader :real, :imaginary

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def abs
    Math.sqrt((self * conjugate).real)
  end

  def ==(other) 
    (self - other).abs < 1e-15
  end

  def +(other)
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    ComplexNumber.new(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)
  end

  def /(other)
    self * other.inv
  end

  def inv
    ComplexNumber.new(real / abs**2, -imaginary / abs**2)
  end

  def exp
    ComplexNumber.new(Math.exp(real)) *
      ComplexNumber.new(Math.cos(imaginary), Math.sin(imaginary))
  end

end
