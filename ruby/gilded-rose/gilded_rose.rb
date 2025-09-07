Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      if item.name == "Aged Brie"
        if item.sell_in > 0
          item.quality += 1
        else
          item.quality += 2
        end
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      elsif item.name == "Conjured Aged Brie"
        if item.sell_in > 0
          item.quality += 1
        else
          item.quality = 0
        end
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in >= 11
          item.quality += 1
        elsif item.sell_in >= 6 && item.sell_in < 11
          item.quality += 2
        elsif item.sell_in > 0 && item.sell_in < 6
          item.quality += 3
        elsif item.sell_in <= 0
          item.quality = 0
        end
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      elsif item.name == "Conjured backstage passes to a TAFKAL80ETC concert"
        if item.sell_in >= 6 && item.sell_in < 11
          item.quality += 1
        elsif item.sell_in > 0 && item.sell_in < 6
          item.quality += 2
        elsif item.sell_in <= 0
          item.quality = 0
        end
        item.quality = 50 if item.quality > 50
        item.sell_in -= 1
      elsif item.name == "Sulfuras, Hand of Ragnaros" 

      elsif item.name == "Conjured Sulfuras, Hand of Ragnaros"
        item.quality = 0 if item.sell_in <= 0
        item.sell_in -= 1
      elsif item.name.start_with?('Conjured')
        if item.sell_in <= 0
          item.quality = 0
        else
          item.quality -= 2
        end
        item.quality = 0 if item.quality < 0
        item.sell_in -= 1
      else
        if item.sell_in <= 0
          item.quality -= 2
        else
          item.quality -= 1
        end
        item.quality = 0 if item.quality < 0
        item.sell_in -= 1
      end
      
    end
  end
end