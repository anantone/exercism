class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    lst = @line.split(":")
    lst[1].strip
  end

  def log_level
    lst = @line.split(":")
    lst[0].downcase[1..-2]
  end

  def reformat
    lst = @line.split(":")
    message = lst[1].strip
    level = lst[0].downcase[1..-2]
    "#{message} (#{level})"
  end
end
