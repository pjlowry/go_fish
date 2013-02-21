require './lib/game.rb'
require './lib/player.rb'

players = [Player.new('computer'), Player.new('human')]
puts "#{players[0].name} should be ."


puts "#{game = Game.new} is an instance of Game."
puts "#{game.add_players(players)} should contain two players."
puts "#{game.dealer_deck} should be empty array."

game.players.each {|player| puts "\n\n#{player.name} has #{players[0].hand.length} cards."}
if game.players[0].hand.length == 0 || game.players[1].hand.length == 0 
  puts "#{game.over?} should equal true."
end

game.players[0].add_suit
game.players[0].add_suit
game.players[1].add_suit
puts "#{game.winner.name} should equal 'computer'."