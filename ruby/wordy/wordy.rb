class WordProblem

  def initialize(question)
    self.question = question
  end

  attr_accessor :question

  def answer
    expression = question.match(/(?<number1>-?\d+?) (?<operator1>[a-zA-Z|\s]*) (?<number2>-?\d+)(?<operator2>[a-zA-Z|\s]*)?(?<number3>-?\d+)?/)
    unless expression
      raise ArgumentError.new
    end
    if expression[:number3]
      expression[:number1].to_i.send(operation(expression[:operator1]), expression[:number2].to_i).send(operation(expression[:operator2].strip), expression[:number3].to_i)
    else
      expression[:number1].to_i.send(operation(expression[:operator1]), expression[:number2].to_i)
    end
  end

  def operation(string)
    case string 
    when 'plus'
      :+
    when 'minus'
      :-
    when 'multiplied by'
      :*
    when 'divided by'
      :/
    end
  end
  
end
