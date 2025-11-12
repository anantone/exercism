class Robot

  BEARINGS = [:east, :north, :west, :south]
  
  def initialize
    self.bearing = nil
    self.coordinates = Array.new(2)
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
    case bearing
    when :east
      self.coordinates = [coordinates[0] + 1, coordinates[1]]
    when :north
      self.coordinates = [coordinates[0], coordinates[1] + 1]
    when :west
      self.coordinates = [coordinates[0] - 1, coordinates[1]]
    when :south
      self.coordinates = [coordinates[0], coordinates[1] - 1]
    end
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
      case command
      when :advance
        robot.advance
      when :turn_right
        robot.turn_right
      when :turn_left
        robot.turn_left
      end
    end
  end

end