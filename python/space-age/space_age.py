# Given an age in (Earth) seconds, returns its equivalent in local orbital years
# for each solar system planet, when called with `on_planet_name` (`on_mercury`, `on_earth`)

from types import MappingProxyType

EARTH_SECONDS_PER_PLANET_YEAR = MappingProxyType({
    "on_mercury": 7600543,
    "on_venus":  19414149,
    "on_earth":   31557600,
    "on_mars":    59354032,
    "on_jupiter": 374355659,
    "on_saturn":  929292362,
    "on_uranus":  2651370019,
    "on_neptune": 5200418560,
})


class SpaceAge:
    def __init__(self, age_in_seconds):
        self._age_in_seconds = age_in_seconds

    def __getattr__(self, name):
        # Python's equivalent of method_missing
        if name in EARTH_SECONDS_PER_PLANET_YEAR:
            age = self._age_in_seconds
            secs = EARTH_SECONDS_PER_PLANET_YEAR[name]
            return lambda: round(age / secs, 2)
        raise AttributeError(
            f"{type(self).__name__!r} object has no attribute {name!r}"
        )

    def __dir__(self):
        # Python's equivalent of respond_to_missing? (for introspection/autocomplete)
        return sorted(set(super().__dir__()) | set(EARTH_SECONDS_PER_PLANET_YEAR))