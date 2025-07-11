module Blackjack
  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'king', 'queen', 'jack', 'ten'
      10
    when 'nine' then 9
    when 'eight' then 8
    when 'seven' then 7
    when 'six' then 6
    when 'five' then 5
    when 'four' then 4
    when 'three' then 3
    when 'two' then 2
    else 
      0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when (4..11) then 'low'
    when (12..16) then 'mid'
    when (17.. 20) then 'high'
    when 21 then 'blackjack'
    when 22 then '22'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    case card_range(card1, card2)
    when '22' then 'P'
    when 'blackjack'
      if parse_card(dealer_card) >= 10
        'S'
      else
        'W'
      end
    when 'low'
      'H'
    when 'mid'
      if parse_card(dealer_card) >= 7
        'H'
      else
        'S'
      end
    when 'high'
      'S'
    end
  end
end
