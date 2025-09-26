module Acronym
  def self.abbreviate(phrase : String) : String
    words = phrase.tr("-_", " ")
    words.split.each_with_object([] of Char) do |word, acronym|
      acronym.push(word[0].upcase)
    end.join("")
  end
end
