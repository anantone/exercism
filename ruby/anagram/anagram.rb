class Anagram

  def initialize(word)
    self.word_d = word.downcase
    self.d_o_r_w = word_d.chars.sort
  end

  attr_accessor :word_d, :d_o_r_w

  def match(entries)
    entries.select do |entry| 
      entry_d = entry.downcase
      entry_d != word_d && entry_d.chars.sort == d_o_r_w
    end 
  end

end