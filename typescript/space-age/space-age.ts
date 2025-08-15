export function age(planet: string, seconds: number): number {
  const planetYearsInEarthSeconds: Record<string, number> = {
                  mercury: 1/7600543,
                  earth: 1/31557600,
                  venus: 1/19414149,
                  mars: 1/59354032,
                  jupiter: 1/374355659,
                  saturn: 1/929292362,
                  uranus: 1/2651370019,
                  neptune: 1/5200418560
  };
  let orbitalPeriods = seconds * planetYearsInEarthSeconds[planet]
  return parseFloat(orbitalPeriods.toFixed(2));
}
