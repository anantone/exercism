module ArmstrongNumbers
  
  def self.include?(number)
    l = number.to_s.length
    number == number.digits.map { |digit| digit**l }.sum
  end
  
end
