class BottleSong

  COUNT = %W( no One Two Three Four Five Six Seven Eight Nine Ten )

  SINGULAR = "bottle"
  PLURAL = "bottles"

  STANZA = "%s green %s hanging on the wall,\n%s green %s hanging on the wall,\nAnd if one green bottle should accidentally fall,\nThere'll be %s green %s hanging on the wall.\n"

  def self.recite(bottles, number_of_stanzas)
    song = ""
    number_of_stanzas.times do
      case bottles
      when 2
        number1 = PLURAL
        number2 = SINGULAR
      when 1
        number1 = SINGULAR
        number2 = PLURAL
      else
        number1 = PLURAL
        number2 = PLURAL
      end
      song << STANZA % [COUNT[bottles], number1, COUNT[bottles], number1, COUNT[bottles-1].downcase, number2]
      song << "\n"
      bottles -= 1
    end
    song.chop!
  end
  
end
