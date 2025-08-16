export const COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

export const colorCode = (color: string): number => {
  return COLORS.indexOf(color);
}

export const decodedValue = (colors: string[]): number => {
  return (colorCode(colors[0]) * 10 + colorCode(colors[1])) * 10**colorCode(colors[2]);
}

export const decodedResistorValue = (colors: string[]): string => {
  let value = String(decodedValue(colors));
  
  if (value.length > 9) {
    return value.slice(0, -9) + ' gigaohms';
    
  } else if (value.length > 6) {
    return value.slice(0, -6) + ' megaohms';
    
  } else if (value.slice(-3) == '000') {
    return value.slice(0, -3) + ' kiloohms';
    
  } else {
    return value + ' ohms';
  }
}
