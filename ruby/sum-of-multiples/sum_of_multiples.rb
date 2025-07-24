class SumOfMultiples

  private

  attr_writer :objects

  def initialize(num = 0, *nums)
    self.objects = Array(num)
    if nums
      nums.each do |num| objects.push(num) end
    end
    objects.reject! { |o| o == 0 }
  end

  public

  attr_reader :objects

  def to(number)
    list_of_multiples = Array.new
    objects.each do |object|
      if object < number
        counter = 1
        while counter * object < number
          list_of_multiples.push(counter * object)
          counter += 1
        end
      end
    end
    list_of_multiples.uniq.sum
  end

end