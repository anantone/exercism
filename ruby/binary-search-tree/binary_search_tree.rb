class Node  
  attr_accessor :data, :left, :right
  def initialize(data, left = nil, right = nil)
    self.data = data
    self.left = left
    self.right = right
  end
end

class Bst
  attr_accessor :root
  def initialize(first_value)
    self.root = Node.new(first_value)
  end

  def data
    root.data
  end

  def left
    root.left
  end

  def right
    root.right
  end

  def insert(value)
    insert_node(root, value)
    self
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    each_node(root, &block)
    self
  end

  private

  def insert_node(node, value)
    if value <= node.data
      node.left.nil? ? node.left = Node.new(value) : insert_node(node.left, value)
    else
      node.right.nil? ? node.right = Node.new(value) : insert_node(node.right, value)
    end
  end 

  def each_node(node, &block)
    return if node.nil?

    each_node(node.left, &block)
    block.call(node.data)
    each_node(node.right, &block)
  end

end
