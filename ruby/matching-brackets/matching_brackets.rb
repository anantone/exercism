module Brackets
  extend self

  def paired?(expression)
    curlies = 0
    square = 0
    parentheses = 0
    last_opened = []
    expression.chars.each do |char|
      case char
      when '{'
        curlies += 1
        last_opened.push('curly')
      when '}'
        return false unless last_opened[-1] == 'curly'
        curlies -= 1
        last_opened.pop
      when '['
        square += 1
        last_opened.push('square')
      when ']'
        return false unless last_opened[-1] == 'square'
        square -= 1
        last_opened.pop
      when '('
        parentheses += 1
        last_opened.push('parentheses')
      when ')'
        return false unless last_opened[-1] == 'parentheses'
        parentheses -= 1
        last_opened.pop
      end
      return false if curlies < 0 || square < 0 || parentheses < 0
    end
    return false if curlies > 0 || square > 0 || parentheses > 0
    return true       
  end

end