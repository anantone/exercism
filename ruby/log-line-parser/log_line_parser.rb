class LogLineParser

  RE = REGULAR_EXPRESSION = {
    :log_and_level => %r{\[(?<log_level>.+)\]:\s*(?<message>.+)\s*}
  }
  REPORT = '%<message>s (%<log_level>s)'

  private_constant :RE

  def initialize(log_line, log_pattern = RE[:log_and_level], format = REPORT)
    log_content = log_line.match(log_pattern)
    @log_level = log_content[:log_level].downcase
    @message = log_content[:message].strip
    @format = format
  end

  attr_reader :message, :log_level, :format

  def reformat
    format % {message:, log_level:}
  end
end
