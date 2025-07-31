module WordProblemExceptions
  class QuestionError < ArgumentError
    def initialize(message = "I don't understand the question")
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
    self.question = question
  end

  attr_accessor :question

  def answer
    if question.match(RE[:long])
      expression = question.match(RE[:long])
      expression[:num1].to_i.send(OPERATION[expression[:op1]], expression[:num2].to_i).send(OPERATION[expression[:op2]], expression[:num3].to_i)
    elsif question.match(RE[:short])
      expression = question.match(RE[:short])
      expression[:num1].to_i.send(OPERATION[expression[:op1]], expression[:num2].to_i)
    else
      raise QuestionError.new
    end
  end

end