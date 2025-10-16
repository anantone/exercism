module ArmstrongNumbers
  def self.armstrong_number?(number : Number) : Bool
    l = number.to_s.size
    number == number.digits.sum { |digit| digit**l }
  end
end
