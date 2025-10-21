module Acronym
  def self.abbreviate(phrase : String) : String
    phrase.split(/[-\s_]+/).map { |word| word[0].upcase }.join
  end
end
