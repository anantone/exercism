class Series
  
  def initialize(slice)
    raise ArgumentError if slice == ""
    @slice = slice
  end

  def slices(n)
    raise ArgumentError if n > @slice.length
    @slice.split('').each_cons(n).with_object([]) do |element, list| 
      list.push(element) 
    end.map { |arr| arr.join }
  end
  
end
