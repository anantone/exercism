class Proverb

  def initialize(*items, **qualifier)
    proverb = "" 
    (0..items.length-2).each do |i|
      proverb << "For want of a #{items[i]} the #{items[i+1]} was lost.\n"
    end
    unless qualifier[:qualifier]
      proverb << "And all for the want of a #{items[0]}."
    else
      proverb << "And all for the want of a #{qualifier[:qualifier]} #{items[0]}."
    end
    self.proverb = proverb
  end

  attr_accessor :proverb
  
  def to_s
    proverb
  end
  
end
