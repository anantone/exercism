=begin
Write your code for the 'Leap' exercise in this file. Make the tests in
`leap_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/leap` directory.
=end
module Year
  def self.leap?(year)
    if year % 100 == 0
      if year % 400 == 0
        true
      else
        false
      end
    elsif year % 4 == 0
      true
    end
  end
end
    