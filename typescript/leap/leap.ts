export function isLeap(year: number): boolean {
  let leap: boolean = false
  if (year % 100 == 0) {
    if (year % 400 == 0) {
      leap = true;
    }
  } else if (year % 4 == 0) {
    leap = true;
  }
  return leap;
}
