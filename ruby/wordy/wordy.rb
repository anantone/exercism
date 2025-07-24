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
    :nums_and_ops => %r{
      (?<num1>-?\d+?)\s*                           # First number
      (?<op1>(plus|minus|multiplied|divided))\s*   # First operator
      (?<num2>-?\d+)\s*                            # Second number
      (?<op2>(plus|minus|multiplied|divided))?\s*  # Second operator (optional)
      (?<num3>-?\d+)?\s*                           # Third number (optional)
    }x
}

  OPERATION = {
    'plus'          => :+,
    'minus'         => :-,
    'multiplied by' => :*,
    'divided by'    => :/
}

  private_constant :RE

  def initialize(question)
    self.question = question
  end

  attr_accessor :question

  def answer
    expression = question.match(RE[:nums_and_ops])
    unless expression
      raise QuestionError.new
    end
    if expression[:num3]
      expression[:num1].to_i.send(operation(expression[:op1]), expression[:num2].to_i).send(operation(expression[:op2]), expression[:num3].to_i)
    else
      expression[:num1].to_i.send(operation(expression[:op1]), expression[:num2].to_i)
    end
  end

  def operation(string)
    case string 
    when 'plus'
      :+
    when 'minus'
      :-
    when 'multiplied'
      :*
    when 'divided'
      :/
    end
  end

end
