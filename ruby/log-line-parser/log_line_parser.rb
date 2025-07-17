class LogLineParser

  attr_reader :line

  def initialize(line)
    @line = line.split(":")
  end

  def message
    line[1].strip
  end

  def log_level
    line[0][1..-2].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
