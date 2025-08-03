module Acronym
  def self.abbreviate(string)
    string.gsub!("-", " ")
    accro = ''
    string.split.each do |word|
      accro += word[0].upcase
    end
    accro
  end
end