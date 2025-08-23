class ListOps
 
  def self.arrays(array)
    count = 0
    array.each { count += 1 }
    count
  end

  def self.reverser(array)
    result = []
    result << array.pop until array.empty?
    result
  end

  def self.concatter(array1, array2)
    result = []
      result << array1 << array2
    result.flatten
  end

  def self.mapper(array, &block)
    result = []
    array.each { |n| result << block.call(n) }
    result
  end

  def self.filterer(array, &block)
    result = []
    array.each { |n| result << n if block.call(n) }
    result
  end

  def self.sum_reducer(array)
    sum = 0
    array.each { |n| sum += n }
    sum
  end

  def self.factorial_reducer(array)
    product = 1
    array.each { |n| product *= n }
    product
  end
  
end
