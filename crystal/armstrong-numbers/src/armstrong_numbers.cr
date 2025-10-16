module ArmstrongNumbers
  def self.armstrong_number?(number : Number) : Bool
    l = number.to_s.size
    number == number.digits.map { |digit| digit**l }.sum
  end
end
