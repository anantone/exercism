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
      word unless word == 'What' || word == 'is' || word == 'by'
    end.compact!
  end

  attr_accessor :expression

  def answer
    begin
      (1...expression.length).step(2).inject(expression[0].to_i) do |result, next_value|
        result.send(OPERATION[expression[next_value]], expression[next_value + 1].to_i)
      end
    rescue
      raise QuestionError
    end
  end

end

