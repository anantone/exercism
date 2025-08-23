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
        return std::to_string(number);
    } else {
        return sound;
    }
}

}  // namespace raindrops
