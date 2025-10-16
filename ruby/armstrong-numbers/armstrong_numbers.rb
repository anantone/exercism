module ArmstrongNumbers
  
  def self.include?(number)
    l = number.to_s.length
    number == number.digits.sum { |digit| digit**l }
  end
  
end
