class School
  
  def initialize
    @roster = {}
  end
  
  def add(name, grade)
    return false if @roster.key?(name)
    
    @roster[name] = grade
    true
  end
  
  def grade(number)
    @roster.select { |_, g| g == number }.keys.sort
  end
  
  def roster
    @roster.sort_by { |name, grade| [grade, name] }.map(&:first)
  end

end