class PhoneNumber
  def self.clean(user_input)
    # Remove all punctuation and spaces
    digits = user_input.gsub(/[^0-9]/, '')
    # Remove country code if present
    number = digits[0] == "1" ? digits.slice!(1..-1) : digits
    # Check validity NXXNXXXXXX and length, return valid string or nil
    number[0].match(/[2-9]/) && number[3].match(/[2-9]/) && number.length == 10 ? number : nil
  end
end
