DAYS = %w( first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
GIFTS = [
  'a Partridge in a Pear Tree',
  'two Turtle Doves',
  'three French Hens',
  'four Calling Birds',
  'five Gold Rings',
  'six Geese-a-Laying',
  'seven Swans-a-Swimming',
  'eight Maids-a-Milking',
  'nine Ladies Dancing',
  'ten Lords-a-Leaping',
  'eleven Pipers Piping',
  'twelve Drummers Drumming'
]

class TwelveDays

  def self.song
    
    song = ""
    list = ""
    (1..DAYS.length).each do |idx|
      day = DAYS[idx-1]
      if idx == 1
        list.insert(0, GIFTS[idx-1])
      elsif idx == 2
        list.insert(0, GIFTS[idx-1]+', and ')
      else
        list.insert(0, GIFTS[idx-1]+', ')
      end
      song << "On the #{day} day of Christmas my true love gave to me: #{list}.\n\n"
    end
    return song.chop!

  end
  
end
