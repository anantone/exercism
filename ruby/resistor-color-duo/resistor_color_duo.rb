=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

module ResistorColorDuo
  def self.value(colors)
    (code(colors[0]) + code(colors[1])).to_i
  end
  
  def self.code(inp)
    case inp
    when 'black'
      a = '0'
    when 'brown'
      a = '1'
    when 'red'
      a = '2'
    when 'orange'
      a = '3'
    when 'yellow'
      a = '4'
    when 'green'
      a = '5'
    when 'blue'
      a = '6'
    when 'violet'
      a = '7'
    when 'grey'
      a = '8'
    when 'white'
      a = '9'
    a
    end
  end
end