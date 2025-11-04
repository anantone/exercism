module Anagram
  def self.find(word : String, entries : Array(String)) : Array(String)
    entries.select do |entry|
      entry.downcase != word.downcase &&
      entry.downcase.chars.sort == word.downcase.chars.sort
    end
  end
end
