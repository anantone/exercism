#pragma once

#include <string>

namespace vehicle_purchase {

bool needs_license(const std::string& kind);
std::string choose_vehicle(const std::string& option1, const std::string& option2);
double calculate_resell_price(double original_price, double age);

}  // namespace vehicle_purchase
