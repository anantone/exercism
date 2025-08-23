#include "darts.h"
#include <array>

namespace darts {

constexpr std::array<std::pair<double, int>, 3> scores = {{
    {1.0, 10},
    {5.0, 5},
    {10.0, 1}
}};

int score(double x, double y) {
    double distance = hypot(x, y);
    for (auto [radius, points]: scores)
        if (distance <= radius)
            return points;
    return 0;
}
}  // namespace darts