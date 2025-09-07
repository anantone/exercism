class Say

  DIGITS = %w( zero one two three four five six seven eight nine) 
  TEENS = %w( ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen )
  DECADES = %w( zero ten twenty thirty forty fifty sixty seventy eighty ninety )

  def initialize(number)
    raise ArgumentError.new if number < 0 || number > 999_999_999_999
    self.number = number.to_s
  end

  attr_accessor :number

  def in_english
    case number.to_i
    when (0..9)
      DIGITS.fetch(number.to_i)
    when (10..19)
      TEENS.fetch(number.to_i-10)
    when (20..99)
      decades(number)
    when (100..999)
      hundreds(number)
    when (1000..9999)
      thousands(number)
    when (10_000..99_999)
      ten_thousands(number)
    when (100_000..999_999)
      hundred_thousands(number)
    when (1_000_000..999_999_999)
      millions(number)
    when (1_000_000_000..999_999_999_999)
      billions(number)
    end
  end

  def decades(number)
    if number[1] == '0'
      DECADES.fetch(number[0].to_i)
    else
      DECADES.fetch(number[0].to_i)+'-'+DIGITS.fetch(number[1].to_i)
    end
  end

  def hundreds(number)
    if number[1, 2] == '00'
      DIGITS.fetch(number[0].to_i)+' hundred'
    else
      DIGITS.fetch(number[0].to_i)+' hundred '+decades(number[1, 2])
    end
  end

  def thousands(number)
    if number[1, 3] == '000'
      DIGITS.fetch(number[0].to_i)+' thousand'
    else
      DIGITS.fetch(number[0].to_i)+' thousand '+hundreds(number[1, 3])
    end
  end

  def ten_thousands(number)
    if number[0] == '1'
      if number[2, 4] == '000'
        TEENS.fetch(number[0, 2].to_i-10)+' thousand'
      else
        TEENS.fetch(number[0, 2].to_i-10)+' thousand '+hundreds(number[2, 4])
      end
    else
      if number[0] == '0'
        thousands(number[1, 4])
      elsif number[1, 4] == '0000'
        decades(number[0, 2])+' thousand'
      else
        decades(number[0, 2])+' thousand '+hundreds(number[2, 4])
      end
    end
  end

  def hundred_thousands(number)
    if number[1, 5] == '00000'
      DIGITS.fetch(number[0].to_i)+' hundred thousand'
    elsif number[0] == '0'
      ten_thousands(number[1, 5])
    else
      DIGITS.fetch(number[0].to_i)+' hundred '+ten_thousands(number[1, 5])
    end
  end

  def millions(number)
    if number.length == 7
      if number[1, 6] == '000000'
        DIGITS.fetch(number[0].to_i)+' million'
      else
        DIGITS.fetch(number[0].to_i)+' million '+hundred_thousands(number[1, 6])
      end
    elsif number.length == 8
      if number[0] == '1'
        if number[2, 6] == '000000'
          TEENS.fetch(number[0, 2].to_i-10)+' million'
        else
          TEENS.fetch(number[0, 2].to_i-10)+' million '+hundred_thousands(number[2, 7])
        end
      else
        if number[2, 6] == '000000'
          decades(number[0, 2])+' million'
        else
          decades(number[0, 2])+' million '+hundred_thousands(number[2, 6])
        end
      end
    elsif number.length == 9
      if number[3, 6] == '000000'
        hundreds(number[0, 3])+' million'
      else
        hundreds(number[0, 3])+' million '+hundred_thousands(number[3, 6])
      end  
    end
  end

  def billions(number)
    if number[0] == '1' 
      'one billion'
    else
      hundreds(number[0, 3])+' billion '+millions(number[3, 9])
    end
  end

end
    
