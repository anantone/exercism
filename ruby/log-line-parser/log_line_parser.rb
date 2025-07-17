class LogLineParser

  REGEX = {
    :log_and_level => %r{\[(?<log_level>.+)\]:\s*(?<message>.+)\s*}
  }
  REPORT_TEMPLATE = '%<message>s (%<log_level>s)'

  def initialize(log_line, log_pattern = REGEX[:log_and_level], format = REPORT_TEMPLATE)
    log_content = log_line.match(log_pattern)
    @log_level = log_content[:log_level].downcase
    @message = log_content[:message].strip
    @format = format
  end

  attr_accessor :message, :log_level, :format

  def reformat
    format % {message:, log_level:}
  end
end
