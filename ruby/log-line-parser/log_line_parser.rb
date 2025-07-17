class LogLineParser

  def initialize(log_line)
    message = log_line[/:\s*(.+)\s*/, 1]
    log_level = log_line[/\[(.+)\]/, 1]
    self.message = message.strip
    self.log_level = log_level.downcase
  end

  attr_accessor :message, :log_level

  def reformat
    sprintf('%s (%s)' % [message, log_level] )
  end
end
