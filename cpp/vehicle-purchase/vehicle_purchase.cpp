#include "vehicle_purchase.h"

namespace vehicle_purchase {

// needs_license determines whether a license is needed to drive a type of
// vehicle. Only "car" and "truck" require a license.
bool needs_license(std::string kind) {
    if (kind == "car" || kind == "truck") {
        return true;
    }
    return false;
}

// choose_vehicle recommends a vehicle for selection. It always recommends the
// vehicle that comes first in lexicographical order.
std::string choose_vehicle(std::string option1, std::string option2) {
    std::string choice;
    if (std::string(option1) < option2) {
        choice = option1;
    } else {
        choice = option2;
    }
    return choice + " is clearly the better choice.";
}

// calculate_resell_price calculates how much a vehicle can resell for at a
// certain age.
double calculate_resell_price(double original_price, double age) {
    float used_price;
    if (age < 3) {
        used_price = original_price * 0.8;
    } else if (age < 10) {
        used_price = original_price * 0.7;
    } else {
        used_price = original_price * 0.5;
    }
    return used_price;
}

}  // namespace vehicle_purchase