module Grep

  def self.grep(pattern, flags, files)
    result = ''
    match_count = 0
    added_files = []
    reverse = flags.include?('-v') ? true : false
    full_line = flags.include?('-x') ? true : false
    case_insensitive = flags.include?('-i') ? true : false
    files.each do |file|
      line_count = 1
      File.read(file).each_line do |line|
        if reverse == false
          if matches?(line, pattern, full_line, case_insensitive)
            if flags.include?("-l")
              if !added_files.include?(file)
                match_count += 1
                result << "\n" if match_count > 1
                added_files.push(file)
                result << "%<file>s" % {file:}
              end
            else
              match_count += 1
              result << "\n" if match_count > 1
              result << "%<file>s:" % {file:} if files.length > 1
              result << "%<line_count>d:" % {line_count:} if flags.include?("-n")
              result << line.chomp!
            end
          end
        else
          if !matches?(line, pattern, full_line, case_insensitive)
            if flags.include?("-l")
              if !added_files.include?(file)
                match_count += 1
                result << "\n" if match_count > 1
                added_files.push(file)
                result << "%<file>s" % {file:}
              end
            else
              match_count += 1
              result << "\n" if match_count > 1
              result << "%<file>s:" % {file:} if files.length > 1
              result << "%<line_count>d:" % {line_count:} if flags.include?("-n")
              result << line.chomp!
            end
          end
        end
        line_count += 1
      end
    end
    result
  end

  def self.matches?(line, pattern, full_line, case_insensitive)
    if case_insensitive
      pattern = pattern.downcase
      line = line.downcase
    end
    if full_line
      if line.chomp == pattern
        return true
      else
        return false
      end
    else
      if line.include?(pattern)
        return true
      else
        return false
      end
    end
  end

end

