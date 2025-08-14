export function age(planet: string, seconds: number): number {
  // pyes = planet years in earth seconds
  const pyes: Record<string, number> = {
                  mercury: 1/7600543,
                  earth: 1/31557600,
                  venus: 1/19414149,
                  mars: 1/59354032,
                  jupiter: 1/374355659,
                  saturn: 1/929292362,
                  uranus: 1/2651370019,
                  neptune: 1/5200418560
  };
  return Math.round(seconds * pyes[planet] * 100) / 100;
}
