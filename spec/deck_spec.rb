require './lib/player.rb'
require './lib/deck.rb'


puts "#{deck = Deck.new}."
players = [Player.new('Bob'), Player.new('Computer')]
puts "\n\n#{deck.deal(players)} should initalize the deck and deal 7 random cards to each player."
deck.cards.each {|card| puts "#{card.suit} #{card.rank}"}
players.each {|player| puts "\n\n#{player.name} has 7 cards: #{player.hand.to_s}."}

players.each {|player| player.hand.sort! {|a,b| a.rank <=> b.rank }}
players.each {|player| puts "\n\n#{player.name} has a hand of 7 sorted cards: #{player.hand.to_s}."}

#puts "#{players[0].hand.search_hand('4')} should equal true"