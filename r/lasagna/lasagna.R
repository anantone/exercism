expected_minutes_in_oven <- function() {
  60
}

remaining_time_in_minutes <- function(actual_minutes_in_oven) {
  expected_minutes_in_oven() - actual_minutes_in_oven
}

prep_time_in_minutes <- function(layers) {
  layers * 2
}

elapsed_time_in_minutes <- function(layers, actual_minutes_in_oven) {
  prep_time_in_minutes(layers) + actual_minutes_in_oven
}
