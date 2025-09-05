module Acronym
  def self.abbreviate(phrase)
    words = phrase.gsub(/-|_/, " ")
    words.split.each_with_object('') do |word, acronym| 
      acronym << word[0].upcase
    end
  end
end
