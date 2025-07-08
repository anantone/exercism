=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  def self.convert(number)
    result = ""
    if number % 3 == 0
      result += "Pling"
    end
    if number % 5 == 0
      result += "Plang"
    end
    if number % 7 == 0
      result += "Plong"
    end
    if number % 3 != 0 && number % 5 != 0 && number % 7 != 0
      result += number.to_s
    end
    result
  end
end