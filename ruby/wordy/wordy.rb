module WordProblemExceptions
  class QuestionError < ArgumentError
    def initialize(message = "The question must only involve the four basic arithmetic operations.")
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

  private

  attr_writer :expression

  def initialize(question)
    self.expression = question[...-1].split.keep_if do |word|
      word.match(/-?\d+/) || OPERATION.keys.include?(word)
    end
  end

  public

  attr_reader :expression

  def answer
    raise QuestionError if expression.length < 3
    (1...expression.length).step(2).inject(expression[0].to_f) do |result, next_value|
      result.send(OPERATION[expression[next_value]], expression[next_value + 1].to_f)
    end
  end

end

