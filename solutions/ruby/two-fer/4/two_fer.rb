=begin
Write your code for the 'Two Fer' exercise in this file. Make the tests in
`two_fer_test.rb` pass.
=end

module TwoFer

  DEFAULT_NAME = 'you'

  def self.two_fer(name = DEFAULT_NAME)
    "One for %s, one for me." % name
  end

end