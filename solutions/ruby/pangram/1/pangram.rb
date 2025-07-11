=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

module Pangram
  def self.pangram?(sentence)
    count = 0
    unless sentence == ""
      alphabet = "abcdefghijklmnopqrstuvwxyz"
      alphabet.each_char { |char|  count += 1 if sentence.downcase.include?(char)}
    end
    count == 26 ? true : false
  end
end