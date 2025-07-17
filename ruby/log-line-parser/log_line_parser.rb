class LogLineParser

  def initialize(error)
    log_level, message = error.split(":")
    self.message = message.strip
    self.log_level = log_level[1..-2].downcase
  end

  attr_accessor :message, :log_level

  def reformat
    sprintf('%s (%s)' % [message, log_level] )
  end
end
