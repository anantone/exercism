module Brackets
  extend self

  def paired?(expression)
    queue = []
    expression.chars.each do |char|
      case char
      when '{'
        queue.push('{')
      when '}'
        if queue[-1] == '{' then queue.pop else return false end
      when '['
        queue.push('[')
      when ']'
        if queue[-1] == '[' then queue.pop else return false end
      when '('
        queue.push('(')
      when ')'
        if queue[-1] == '(' then queue.pop else return false end
      end
    end
    queue == []      
  end

end