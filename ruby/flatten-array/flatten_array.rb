class FlattenArray

  def self.flatten(array)
    unless array == []
      flat = array.flatten
      flat.delete_if {|value| value == nil }
    else
      array
    end
  end

end
