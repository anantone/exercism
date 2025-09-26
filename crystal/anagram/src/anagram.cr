module Anagram
  def self.find(word : String, entries : Array(String)) : Array(String)
    word_d = word.downcase
    dorw = word_d.chars.sort!
    entries.select do |entry|
      entry_d = entry.downcase
      entry_d != word_d && entry_d.chars.sort! == dorw
    end 
  end
end
