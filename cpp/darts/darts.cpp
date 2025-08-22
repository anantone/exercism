#include "darts.h"
#include <array>

namespace darts {

std::array<std::pair<double, int>, 3> scores = {{
    {1, 10},
    {5, 5},
    {10, 1}
}};

int score(double x, double y) {
    double distance = hypot(x, y);
    if (distance <= scores[0].first) {
        return scores[0].second;
    } 
    if (distance <= scores[1].first) {
        return scores[1].second;
    } 
    if (distance <= scores[2].first) {
        return scores[2].second;
    }
    return 0;
}

}  // namespace darts