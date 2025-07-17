class LogLineParser

  RE = REGULAR_EXPRESSION = {
    :log_and_level => %r{\[(?<log_level>.+)\]:\s*(?<message>.+)\s*}
  }
  REPORT = '%<message>s (%<log_level>s)'

  private_constant :RE

  def initialize(log_line, log_pattern = RE[:log_and_level], format = REPORT)
    log_content = log_line.match(log_pattern)
    self.log_level = log_content[:log_level].downcase
    self.message = log_content[:message].strip
    self.format = format
  end

  attr_accessor :message, :log_level, :format

  def reformat
    format % {message:, log_level:}
  end
end
