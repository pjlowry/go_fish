require './lib/card.rb'

class Deck
  attr_reader :cards

  def initialize
  end

  def deal(players)
    # shuffle array and init each Card
    players.each do |player|
      @cards = (0..51).to_a.shuffle.collect { |id| Card.new(id) }
      7.times {player.add_card(@cards.pop)}
    end
  end

  def number_of_cards(deck)

  end

  def to_s
     "This prints a card deck #{@cards}."
  end
end


