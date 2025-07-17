class LogLineParser

  def initialize(log_line)
    log_level, message = log_line.match(/\[(.+)\]:\s*(.+)\s*/).captures
    @log_level = log_level.downcase
    @message = message.strip
  end

  attr_accessor :message, :log_level

  def reformat
    sprintf('%s (%s)' % [message, log_level] )
  end
end
