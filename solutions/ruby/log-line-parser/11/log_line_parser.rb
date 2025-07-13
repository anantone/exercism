class LogLineParser

  def initialize(log_line)
    self.message = log_line[/:\s*(.+)\s*/, 1].strip
    self.log_level = log_line[/\[(.+)\]/, 1].downcase
  end

  attr_accessor :message, :log_level

  def reformat
    sprintf('%s (%s)' % [message, log_level] )
  end
end
