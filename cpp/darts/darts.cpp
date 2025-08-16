#include "darts.h"

namespace darts {

const int inner_circle = 1;
const int middle_circle = 5;
const int outer_circle = 10;

int score(double x, double y) {
    double distance = hypot(x, y);
    if (distance <= inner_circle) {
        return 10;
    } 
    if (distance <= middle_circle) {
        return 5;
    } 
    if (distance <= outer_circle) {
        return 1;
    }
    return 0;
}

}  // namespace darts