#include <string>

namespace log_line {
std::string message(std::string line) {
    int semicolon_index = line.find(":");
    std::string message = line.substr(semicolon_index + 2);
    return message;
}

std::string log_level(std::string line) {
    int opening_bracket_index = line.find("[");
    int closing_bracket_index = line.find("]");
    int start_index = opening_bracket_index + 1;
    int length = closing_bracket_index - start_index;
    std::string log_level = line.substr(start_index, length);
    return log_level;
}

std::string reformat(std::string line) {
    std::string LogLevel = log_level(line);
    std::string Message = message(line);
    std::string reformatted_message = Message + " (" + LogLevel +")";
    return reformatted_message;
}
}  // namespace log_line
