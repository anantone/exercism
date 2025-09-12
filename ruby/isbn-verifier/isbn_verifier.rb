module IsbnVerifier

  def self.valid?(string)
    string.gsub!('-', '')
    return false if string.length != 10
    # Calculate sum with formula
    sum = 0
    (0..8).each do |idx|
      if string[idx].match(/\d/)
        sum += string[idx].to_i * (10 - idx)
      else
        return false
      end
    end
    # Process last "digit || 'X'"
    if !string[9].match(/\d|X/)
      return false
    elsif string[9] == 'X'
      sum += 10
    else
      sum += string[9].to_i
    end
    sum % 11 == 0
  end

end
