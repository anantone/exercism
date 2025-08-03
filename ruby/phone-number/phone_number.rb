class PhoneNumber
  def self.clean(user_input)
    # Remove all punctuation and spaces
    digits = ''
    user_input.each_char do |char|
      if char.match(/[0-9]/)
        digits << char
      end
    end
    # Remove country code if present
    if  digits[0] == "1"
      number =  digits.slice!(1..-1)
    else
      number =  digits
    end
    # Check length
    if number.length != 10
      return nil
    end
    # Check validity NXXNXXXXXX
    unless number[0].match(/[2-9]/) && number[3].match(/[2-9]/)
      return nil
    end
    # Return valid string or nil
    number
  end

end
