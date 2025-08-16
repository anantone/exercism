export const colorCode = (color: string): number => {
  return COLORS.indexOf(color);
}

export const decodedValue = (colors: string[]): number => {
  return +(colorCode(colors[0]).toString() + colorCode(colors[1]).toString());
}

export const COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']
