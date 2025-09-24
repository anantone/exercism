class Say

  DIGITS = %w( zero one two three four five six seven eight nine) 
  TEENS = %w( ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen )
  DECADES = %w( zero ten twenty thirty forty fifty sixty seventy eighty ninety )

  def initialize(number)
    raise ArgumentError if number < 0 || number > 999_999_999_999
    self.number = number.to_s
  end

  attr_accessor :number

  def in_english
    return if number == ''
    case number.to_i
    when (0..9)
      DIGITS.fetch(number.to_i)
    when (10..19)
      TEENS.fetch(number.to_i-10)
    when (20..99)
      decades(number)
    when (100..999)
      hundreds(number)
    when (1000..999_999)
      Say.new(number[..-4].to_i).in_english + ' thousand' + "#{number[-3..] == '000' ? '' : ' ' + Say.new(number[-3..].to_i).in_english}"
    when (1_000_000..999_999_999)
      Say.new(number[..-7].to_i).in_english + ' million' + "#{number[-6..] == '000000' ? '' : ' ' + Say.new(number[-6..].to_i).in_english}"
    when (1_000_000_000..999_999_999_999)
      Say.new(number[..-10].to_i).in_english + ' billion' + "#{number[-9..] == '000000000' ? '' : ' ' + Say.new(number[-9..].to_i).in_english}"
    end
  end

  def decades(number)
    if number[1] == '0'
      DECADES.fetch(number[0].to_i)
    else
      DECADES.fetch(number[0].to_i) + '-' + DIGITS.fetch(number[1].to_i)
    end
  end

  def hundreds(number)
    if number[1, 2] == '00'
      DIGITS.fetch(number[0].to_i) + ' hundred'
    else
      DIGITS.fetch(number[0].to_i) + ' hundred ' + Say.new(number[1..2].to_i).in_english
    end
  end

end
