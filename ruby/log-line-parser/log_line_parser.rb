class LogLineParser

  attr_accessor :message, :log_level

  def initialize(error)
    @log_level, @message = error.split(":")
  end

  def message
    self.message = @message.strip
  end

  def log_level
    self.log_level = @log_level[1..-2].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
