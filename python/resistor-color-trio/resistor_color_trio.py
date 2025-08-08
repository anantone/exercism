BANDS = {   
        "black":   0,
        "brown":   1,
        "red":     2,
        "orange":  3,
        "yellow":  4,
        "green":   5,
        "blue":    6,
        "violet":  7,
        "grey":    8,
        "white":   9 
  }

def label(colors):
    value = str((10*BANDS[colors[0]] + BANDS[colors[1]]) * 10**BANDS[colors[2]])
    if value[-9:] == '000000000':
        return value[:-9] + ' gigaohms'
    elif value[-6:] == '000000':
        return value[:-6] + ' megaohms'
    elif value[-3:] == '000':
        return value[:-3] + ' kiloohms'
    else:
        return value + ' ohms'