class Integer
  def to_roman
    arab = self
    roman = ''
    while arab > 999
      arab -= 1000
      roman << 'M'
    end
    if arab > 899
      arab -= 900
      roman << 'CM'
    end
    if arab > 799
      arab -= 800
      roman << 'DCCC'
    end
    if arab > 699
      arab -= 700
      roman << 'DCC'
    end
    if arab > 599
      arab -= 600
      roman << 'DC'
    end
    if arab > 499
      arab -= 500
      roman << 'D'
    end
    if arab > 399
      arab -= 400
      roman << 'CD'
    end
    if arab > 299
      arab -= 300
      roman << 'CCC'
    end
    if arab > 199
      arab -= 200
      roman << 'CC'
    end
    if arab > 99
      arab -= 100
      roman << 'C'
    end
    if arab > 89
      arab -= 90
      roman << 'XC'
    end
    if arab > 79
      arab -= 80
      roman << 'LXXX'
    end
    if arab > 69
      arab -= 70
      roman << 'LXX'
    end
    if arab > 59
      arab -= 60
      roman << 'LX'
    end
    if arab > 49
      arab -= 50
      roman << 'L'
    end
    if arab > 39
      arab -= 40
      roman << 'XL'
    end
    if arab > 29
      arab -= 30
      roman << 'XXX'
    end
    if arab > 19
      arab -= 20
      roman << 'XX'
    end
    if arab > 9
      arab -= 10
      roman << 'X'
    end
    if arab == 9
      arab -= 9
      roman << 'IX'
    end
    if arab == 8
      arab -= 8
      roman << 'VIII'
    end
    if arab == 7
      arab -= 7
      roman << 'VII'
    end
    if arab == 6
      arab -= 6
      roman << 'VI'
    end
    if arab == 5
      arab -= 5
      roman << 'V'
    end
    if arab == 4
      arab -= 4
      roman << 'IV'
    end
    if arab == 3
      arab -= 3
      roman << 'III'
    end
    if arab == 2
      arab -= 2
      roman << 'II'
    end
    if arab == 1
      arab -= 1
      roman << 'I'
    end
    roman
  end
end
