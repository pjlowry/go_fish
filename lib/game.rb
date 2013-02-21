require './lib/player.rb'

class Game
  attr_reader :dealer_deck, :players

  def initialize
    @players = []
    @dealer_deck = Deck.new
  end

  def add_players(players)
    @players = players
  end

  def over?
    @players.select {|player| player.hand.length == 0}.any?
  end

  def winner
    @players.max_by {|player| player.number_of_suits}
  end

  # def to_s
  #   "This prints an instance of a game: #{game}"
  # end
end