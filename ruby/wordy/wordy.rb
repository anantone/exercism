module WordProblemExceptions
  class QuestionError < ArgumentError
    def initialize(message = "The question should only involve the four basic arithmetic operations.")
      super
    end
  end
end

class WordProblem
  include WordProblemExceptions

  RE = REGULAR_EXPRESSIONS = {
    :short => %r{
    (?<num1>-?\d+?)\s.*                             # First number
    (?<op1>(plus|minus|multiplied|divided)).*\s     # First operator
    (?<num2>-?\d+).*                                # Second number
    }x,
    :long => %r{
    (?<num1>-?\d+?)\s.*                             # First number
    (?<op1>(plus|minus|multiplied|divided)).*\s     # First operator
    (?<num2>-?\d+)\s.*                              # Second number
    (?<op2>(plus|minus|multiplied|divided)).*\s     # Second operator
    (?<num3>-?\d+).*                                # Third number
    }x
}

  OPERATION = {
    'plus'          => :+,
    'minus'         => :-,
    'multiplied'    => :*,
    'divided'       => :/
}

  private_constant :RE

  def initialize(question)
    if question.match(RE[:long])
      self.expression = question.match(RE[:long])
    elsif question.match(RE[:short])
      self.expression = question.match(RE[:short])
    else
      self.expression = nil
    end
  end

  attr_accessor :expression

  def answer
    if expression == nil
      raise QuestionError
    elsif expression.length == 6  
      expression[:num1].to_i.send(OPERATION[expression[:op1]], expression[:num2].to_i).send(OPERATION[expression[:op2]], expression[:num3].to_i)
    elsif expression.length == 4
      expression[:num1].to_i.send(OPERATION[expression[:op1]], expression[:num2].to_i)
    end
  end

end
