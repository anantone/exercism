module ArmstrongNumbers
  def self.include?(number)
    l = number.to_s.length
    number.digits.map { |digit| digit**l }.sum == number
  end
end
