class LogLineParser

  LOG_LINE_REGEX = %r{\[(?<log_level>.+)\]:\s*(?<message>.+)\s*}
  REPORT_TEMPLATE = '%s (%s)'
  
  def initialize(log_line)
    log_content = log_line.match(LOG_LINE_REGEX)
    @log_level = log_content[:log_level].downcase
    @message = log_content[:message].strip
  end

  attr_accessor :message, :log_level

  def reformat
    sprintf(REPORT_TEMPLATE % [message, log_level] )
  end
end
