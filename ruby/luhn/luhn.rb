class Luhn

  def self.valid?(number)
    # Remove white spaces
    number.gsub!(' ', '')
    # Length must be >= 2
    if number.length <= 1
      return false
    end
    # Non-digit is invalid
    unless number.chars.all? { |n| n.match(/\d/)}
      return false
    end
    # On to algorithm...
    # Double every second digit from right
    new_array = Array.new
    array = number.split('')
    (1..array.length).each do |i|
      if i % 2 == 0 
        double = array[-i].to_i * 2
        if double > 9
          new_array.push(double - 9)
        else
          new_array.push(double)
        end
      else
        new_array.push(array[-i].to_i)
      end
    end
    # Sum all resulting digits
    return new_array.sum % 10 == 0
  end

end
