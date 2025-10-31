module Brackets
  extend self

  BRACKET_PAIRS = {
        ')' => '(',
        '}' => '{',
        ']' => '['
  }.freeze

  def paired?(expression)
    queue = []
    expression.each_char do |char|
      if BRACKET_PAIRS.value?(char)
        queue.push(char)
      elsif BRACKET_PAIRS.key?(char)
        queue.last == BRACKET_PAIRS[char] ? queue.pop : (return false)
      end
    end
    queue.empty?      
  end

end