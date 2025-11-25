class Element

  attr_accessor :datum, :next
  
  def initialize datum
    self.datum = datum
  end

end

class SimpleLinkedList

  attr_accessor :list
  
  def initialize(values = [])
    self.list = []
    values.each { |value| push(Element.new(value)) }
  end

  def push element
    self.list << element
    self
  end

  def pop
    self.list.pop
  end

  def to_a
    self.list.map(&:datum).reverse
  end

    def reverse!
    self.list.reverse!
    self.list.each_cons(2).map { |element1,element2|
      element1.next = element2
      element2.next = nil
    }
    self
  end
  
end
