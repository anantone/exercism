class LogLineParser
  attr_reader :message, :log_level, :lst
  
  def initialize(line)
    @line = line
  end

  def lst
    @line.split(":")
  end

  def message
    lst[1].strip
  end

  def log_level
    lst[0].downcase[1..-2]
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
