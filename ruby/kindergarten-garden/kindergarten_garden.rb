class Garden

  CHILDREN = %i[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry]

  LETTER_TO_PLANT = {"G" => :grass,
            "C" => :clover,
            "R" => :radishes,
            "V" => :violets
  }

  attr_accessor :rows
  
  def initialize(rows)
    self.rows = rows.split
  end

  def method_missing(method_name, *args)
    return super unless respond_to_missing?(method_name)
    index = CHILDREN.index(method_name) * 2
    plants = []
    rows.each do |row|
      plants.push(row[index])
      plants.push(row[index + 1])
    end
    plants.map! do |letter|
      LETTER_TO_PLANT[letter]
    end
    plants
  end

  def respond_to_missing?(method_name, *args, &blk)
    CHILDREN.include?(method_name)
  end

end