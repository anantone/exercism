export const COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

export const colorCode = (color: string): number => {
  return COLORS.indexOf(color);
}

export const decodedValue = (colors: string[]): number => {
  const band1 = colorCode(colors[0]);
  const band2 = colorCode(colors[1]);
  const band3 = colorCode(colors[2]);
  const value = `${band1}${band2}e${band3}`;
  return Number(value);
}

export const decodedResistorValue = (colors: string[]): any => {
  let value = decodedValue(colors);
  
  if (value >= 1e9) {
    value /= 1e9
    return `${value} gigaohms`;
  } 
  if (value >= 1e6) {
    value /= 1e6
    return `${value} megaohms`;
  } 
  if (value >= 1e3) {
    value /= 1e3
    return `${value} kiloohms`;
  }
  return `${value} ohms`;
}
