module Brackets
  extend self

  def paired?(expression)
    queue = []
    expression.chars.each do |char|
      case char
      when '{'
        queue.push('{')
      when '}'
        queue[-1] == '{' ? queue.pop : (return false)
      when '['
        queue.push('[')
      when ']'
        queue[-1] == '[' ? queue.pop : (return false)
      when '('
        queue.push('(')
      when ')'
        queue[-1] == '(' ? queue.pop : (return false)
      end
    end
    queue == []      
  end

end