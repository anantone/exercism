class LogLineParser
    def initialize(line)
      @line = line.split(":")
    end

    def message
      @line[1].strip
    end

    def log_level
      @line[0].downcase[1..-2]
    end

    def reformat
      "#{message} (#{log_level})"
    end
  end
