module Acronym
  def self.abbreviate(phrase : String) : String
    phrase.split(/[-\s_]+/).map(&.[0].upcase).join
  end
end
