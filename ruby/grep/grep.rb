module Grep

  def self.grep(pattern, flags, files)
    result = []

    case_insensitive = flags.include?('-i')
      file_name_only = flags.include?('-l')
             reverse = flags.include?('-v')
           full_line = flags.include?('-x')
        line_numbers = flags.include?('-n')

    match_count = 0
    added_files = []

    files.each do |file|
      line_count = 1
      File.read(file).each_line do |line|
        test = matches?(line, pattern, full_line, case_insensitive)
        if reverse ? !test : test
          match_count += 1
          if file_name_only
            unless added_files.include?(file)
              result.push("\n") if match_count > 1
              added_files.push(file)
              result.push("%<file>s" % {file:})
            end
          else
            result.push("\n") if match_count > 1
            result.push("%<file>s:" % {file:}) if files.length > 1
            result.push("%<line_count>d:" % {line_count:}) if line_numbers
            result.push(line.chomp)
          end
        end
        line_count += 1
      end
    end
    result.join
  end

  def self.matches?(line, pattern, full_line, case_insensitive)
    if case_insensitive
      pattern = pattern.downcase
      line = line.downcase
    end
    if full_line
      line.chomp == pattern
    else
      line.include?(pattern)
    end
  end

end

