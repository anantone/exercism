class LogLineParser

  RE = REGULAR_EXPRESSION = {
    :log_and_level => %r{
    \[(?<log_level>.+)\]  # Capture log level
    :\s*                  # Colon with optional white space
    (?<message>.+)\s*     # Capture message
    }x
  }
  REPORT = %q{%<message>s (%<log_level>s)}

  private_constant :RE

  private

  attr_accessor :format
  attr_writer :message, :log_level

  def initialize(log_line, log_pattern = RE[:log_and_level], format = REPORT)
    log_content = log_line.match(log_pattern)
    self.log_level = log_content[:log_level].downcase
    self.message = log_content[:message].strip
    self.format = format
  end

  public

  attr_reader :message, :log_level

  def to_s
    format % {message:, log_level:}
  end

  alias :reformat :to_s

end
