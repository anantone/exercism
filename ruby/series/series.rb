class Series
  def initialize(slice_string)
    if slice_string == ""
      raise ArgumentError.new
    end
    @slice_string = slice_string
  end

  def slices(n)
    if n > @slice_string.length
      raise ArgumentError.new
    end
    lst = []
    array = @slice_string.split('')
    array.each_cons(n) { |element| lst.push(element) }
    lst.map { |arr| arr.join }
  end
end
