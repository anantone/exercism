#include "raindrops.h"


namespace raindrops {

std::string convert(int number) {
    std::string sound = "";
    if (number % 3 == 0) {
        sound += "Pling";
    }
    if (number % 5 == 0) {
        sound += "Plang";
    }
    if (number % 7 == 0) {
        sound += "Plong";
    }
    if (sound == "") {
        std::string num_as_string = std::to_string(number);
        return num_as_string;
    } else {
        return sound;
    }
}

}  // namespace raindrops
