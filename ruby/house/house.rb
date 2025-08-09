NUMBER_OF_ITEMS = 12
NUMBER_OF_VERBS = NUMBER_OF_ITEMS - 1

ITEMS = [
  "the house that Jack built",
  "the malt",
  "the rat",
  "the cat",
  "the dog",
  "the cow with the crumpled horn",
  "the maiden all forlorn",
  "the man all tattered and torn",
  "the priest all shaven and shorn",
  "the rooster that crowed in the morn",
  "the farmer sowing his corn",
  "the horse and the hound and the horn"
]

VERBS = [
  "lay in",
  "ate",
  "killed",
  "worried",
  "tossed",
  "milked",
  "kissed",
  "married",
  "woke",
  "kept",
  "belonged to"
]

class House

  def self.recite
    rhyme = ""
    stanza = "This is %s.\n\n" % ITEMS[0]
    rhyme << stanza
    (1..NUMBER_OF_VERBS).each do |idx|
      stanza.insert(8, "%s\nthat %s " % [ITEMS[idx], VERBS[idx-1]])  
      rhyme << stanza
    end
    rhyme.chop!
  end

end
