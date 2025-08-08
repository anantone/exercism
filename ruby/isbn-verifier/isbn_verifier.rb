module IsbnVerifier

  def self.valid?(string)
    # Check the validity of isbn numbers,
    # provided with or without dashes
    
    # Get rid of dashes
    string.gsub!('-', '')
    
    # Validate string length
    if string == "" || string.length != 10
      return false
    end
    
    # Calculate sum with formula
    sum = 0
    (0..8).each do |idx|
      unless string[idx].match(/\d/)
        return false
      else
        sum += string[idx].to_i * (10 - idx)
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
    
    # Return true if
    sum % 11 == 0
  
  end

end
