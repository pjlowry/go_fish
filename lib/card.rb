class Card
#  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A]
#  SUITS = [Spade, Heart, Club, Diamond]

  RANKS = %w('2' '3' '4' '5' '6' '7' '8' '9' '10' 'J' 'Q' 'K' 'A')
  SUITS = %w('Spade' 'Heart' 'Club' 'Diamond')

  attr_reader :rank, :suit

  def initialize(id)
    @rank = RANKS[id % 13]
    @suit = SUITS[id % 4]
  end
end
