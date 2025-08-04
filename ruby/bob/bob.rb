class Bob

  def self.hey(remark)
    if remark.rstrip[-1] == '?' && remark.capitalized?
      return "Calm down, I know what I'm doing!"
    end
    if remark.rstrip[-1] == '?'
      return "Sure."
    end
    if remark.capitalized?
      return "Whoa, chill out!"
    end
    if remark.strip.empty?
      return "Fine. Be that way!"
    end
    "Whatever."
  end

end

class String

  def capitalized?
    self == self.upcase && chars.any? { |char| char.match(/[a-zA-Z]/) }
  end

end
