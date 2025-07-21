class Phrase
  
  def initialize(phrase)
    @phrase = phrase.downcase.gsub(',', ' ').gsub(/(?<!\w)'|'(?!\w)/,'').gsub(/[^\w\s']/, '')
  end

  def word_count
    Hash[@phrase.split.group_by {|x| x}.map {|k,v| [k,v.count]}]
  end
  
end
