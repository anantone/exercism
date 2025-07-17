class LogLineParser

  attr_accessor :error

  def initialize(error)
    @error = error.split(":")
  end

  def message
    error[1].strip
  end

  def log_level
    error[0][1..-2].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
