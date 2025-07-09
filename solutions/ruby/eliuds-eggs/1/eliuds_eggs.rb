=begin
Write your code for the 'Eliuds Eggs' exercise in this file. Make the tests in
`eliuds_eggs_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/eliuds-eggs` directory.
=end

module EliudsEggs
  def self.egg_count(bin)
    count = 0
    while bin > 0
      a = bin % 2
      if a == 1
        count += 1
      end
      bin = bin / 2
    end
    count
  end
end