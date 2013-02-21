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

  def search_hand(rank)
    @cards.find_index {|card| card.rank.include? rank} 
  end

  def display_deck
    @cards.each {|card| puts "#{card}"}
  end

  def four_of_a_kind
    index = 0
    while index < (card.length - 3)
      if card[index].rank == card[index + 1].rank && card[index].rank == card[index + 2].rank &&
         card[index].rank == card[index + 3].rank
        card.slice!(index..index+3)
      end
      index = index + 1
    end
  end

  def to_s
     "This prints a card deck #{@cards}."
  end
end


