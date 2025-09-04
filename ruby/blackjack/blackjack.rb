module Blackjack

  CARD_VALUES = {
      ace: 11,
     king: 10,
    queen: 10,
     jack: 10,
      ten: 10,
     nine:  9,
    eight:  8,
    seven:  7,
      six:  6,
     five:  5,
     four:  4,
    three:  3,
      two:  2,
    joker:  0
  }

  TWO_CARD_RANGES = {
     (4..11) => 'low',
    (12..16) => 'mid',
    (17..20) => 'high',
          21 => 'blackjack',
          22 => '22'
  }
  
  def self.parse_card(card)
    CARD_VALUES[card.to_sym]
  end

  def self.card_range(card1, card2)
    TWO_CARD_RANGES.select do |value|
      value === parse_card(card1) + parse_card(card2)
    end.values.first
  end

  def self.first_turn(card1, card2, dealer_card)
    if card_range(card1, card2) ==  '22'
      'P'
    elsif card_range(card1, card2) == 'blackjack' && parse_card(dealer_card) < 10
      'W'
    elsif (card_range(card1, card2) == 'mid' && parse_card(dealer_card) >= 7) || card_range(card1, card2) == 'low'
      'H'
    else
      'S'
    end   
  end
  
end
