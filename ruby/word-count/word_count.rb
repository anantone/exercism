class Phrase
  
  def initialize(phrase)
    @phrase = phrase.downcase.gsub(',', ' ').gsub(/(?<!\w)'|'(?!\w)/,'').gsub(/[^\w\s']/, '')
  end

  def word_count
    unique_words = @phrase.split
    Hash[unique_words.group_by {|x| x}.map {|k,v| [k,v.count]}]
  end
  
end
