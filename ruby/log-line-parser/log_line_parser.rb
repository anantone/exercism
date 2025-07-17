class LogLineParser

  attr_accessor :message, :log_level

  def initialize(error)
    log_level, message = error.split(":")
    self.message = message.strip
    self.log_level = log_level[1..-2].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
