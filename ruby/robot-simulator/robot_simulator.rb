class Robot

  BEARINGS = [:east, :north, :west, :south]
  MOVEMENT = {east: [1, 0], north: [0, 1], west: [-1, 0], south: [0, -1]}
  
  def initialize
    self.bearing = nil
    self.coordinates = [0, 0]
  end

  attr_accessor :bearing, :coordinates

  def orient(direction)
    raise ArgumentError if !BEARINGS.include?(direction)
    
    self.bearing = direction
  end

  def turn_right
    self.bearing = BEARINGS[(BEARINGS.index(self.bearing) - 1) % 4]
  end

  def turn_left
    self.bearing = BEARINGS[(BEARINGS.index(self.bearing) + 1) % 4]
  end

  def at(x, y)
    self.coordinates = [x, y]
  end

  def advance
    coordinates[0] += MOVEMENT[bearing][0]
    coordinates[1] += MOVEMENT[bearing][1]
  end

end

class Simulator

  def instructions(letters)
    letters.chars.each_with_object([]) do |letter, commands|
      case letter
      when 'A'
        commands.push(:advance)
      when 'R'
        commands.push(:turn_right)
      when 'L'
        commands.push(:turn_left)
      end
    end
  end

  def place(robot, x:, y:, direction:)
    robot.coordinates = [x, y]
    robot.orient(direction)
  end

  def evaluate(robot, letters)
    instructions(letters).each do |command|
      robot.public_send(command)
    end
  end

end