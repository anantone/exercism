module WordProblemExceptions
  class QuestionError < ArgumentError
    def initialize(message = "The question should only involve the four basic arithmetic operations.")
      super
    end
  end
end

class WordProblem
  include WordProblemExceptions

  OPERATION = {
    'plus'          => :+,
    'minus'         => :-,
    'multiplied'    => :*,
    'divided'       => :/
}

  def initialize(question)
    self.expression = question[...-1].split.collect! do |word|
      word unless word == "What" || word == "is" || word == "by" 
    end.compact!
  end

  attr_accessor :expression

  def answer
    if expression.length == 3
      expression[0].to_i.send(OPERATION[expression[1]], expression[2].to_i)
    elsif expression.length == 5
      expression[0].to_i.send(OPERATION[expression[1]], expression[2].to_i).send(OPERATION[expression[3]], expression[4].to_i)
    else
      raise QuestionError
    end
  end

end
