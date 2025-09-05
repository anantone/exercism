class BinarySearch

  private

  attr_writer :catalog

  def initialize(catalog)
    self.catalog = catalog
  end

  public
  
  attr_reader :catalog
    
  def search_for(item)
    lower = 0
    upper = catalog.size - 1
    while lower <= upper
      mid = (lower + upper) / 2
      return mid if catalog[mid] == item
      catalog[mid] > item ? upper = mid - 1 : lower = mid + 1
    end
  end
    
end
