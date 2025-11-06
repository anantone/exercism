class Deque < Array

  def delete(element)
    delete_at(index(element)) unless index(element) == nil
  end

end
