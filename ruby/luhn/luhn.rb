class Luhn

  private
  
  def self.number_valid?(number)
    return false if number.length <= 1
    return false unless number.chars.all? do |n| 
      n.match(/\d/)
    end
    return true
  end

  def self.luhn_calculation(number)
    new_array = Array.new
    array = number.split('')
    (1..array.length).each do |i|
      if i % 2 == 0 
        double = array[-i].to_i * 2
        double = double - 9 if double > 9
        new_array.push(double)
      else
        new_array.push(array[-i].to_i)
      end
    end
    new_array.sum % 10 == 0
  end

  public
  
  def self.valid?(number)
    number.gsub!(' ', '')
    return false unless number_valid?(number)
    luhn_calculation(number)
  end

end
