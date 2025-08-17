export const score = (x, y) => {
  const distanceToCenter = Math.sqrt(Math.abs(x)**2 + Math.abs(y)**2);
  let score = 0;
  if (distanceToCenter <= 1) {
    score += 10;
  } else if (distanceToCenter <= 5) {
    score += 5;
  } else if (distanceToCenter <= 10) {
    score += 1;
  }
return score;
};