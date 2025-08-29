class Anagram

  def initialize(word)
    self.word_d = word.downcase
    self.dorw = word_d.chars.sort
  end

  attr_accessor :word_d, :dorw

  def match(entries)
    entries.select do |entry| 
      entry_d = entry.downcase
      entry_d != word_d && entry_d.chars.sort == dorw
    end 
  end

end