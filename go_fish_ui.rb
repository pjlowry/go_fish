require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/game.rb'
require './lib/turn.rb'


# Goal
# To collect the most sets of four.
# Setup:
# Five cards are dealt to each player if three to six players are involved. With only two players, 
# seven cards are dealt to each.  All remaining cards are placed face down in a draw pile.
# Gameplay:
# Randomly choose a player to go first.  On your turn, ask a player for a specific card rank. 
# For example: "Barb, please give me your 9s." You must already hold at least one card of the requested rank.
# If the player you ask has any cards of the requested rank, she must give all of her cards of that rank to you. 
# In the example, Barb would have to give you all of her 9s.
# If you get one or more cards from the player you ask, you get another turn. You may ask any player for 
# any rank you already hold, including the same one you just asked for.
# If the person you ask has no relevant cards, they say, "Go fish." You then draw the top card from the draw pile.
# If you happen to draw a card of the rank asked for, show it to the other players and you get another 
# turn. However, if you draw a card that's not the rank you asked for, it becomes the next player's turn. 
# You keep the drawn card, whatever rank it is.
# NOTE: The "next player" is the one who said "Go fish."
# When you collect a set of four cards of the same rank, immediately show the set to the other players and 
# place the four cards face down in front of yourself.
# Winning:
# Go Fish continues until either someone has no cards left in their hand or the draw pile runs out. The winner 
# is the player who then has the most sets of four.

puts "Welcome to Go Fish!"
puts "Enter your name"
name = gets.chomp

puts "Press enter to select who goes first."
gets.chomp
# first_player = rand(0..1)

first_player = 0
game = Game.new

if first_player == 0
	game.add_players([Player.new(name), Player.new('Computer')])
else
	game.add_players([Player.new('Computer'), Player.new(name)])
end

# game.to_s
# game.players.each {|player| puts "\n#{player.name}"}

puts "#{game.players[0].name} goes first"
puts "Press enter to deal cards."
gets.chomp
game.dealer_deck.deal(game.players)
 game.players.each {|player| puts "\n#{player.name} has a hand of 7  cards: #{player.hand.to_s}."}
#       if hand.four_of_a_kind(both player)
#         lay down cards
#       end
until game.over?
 	game.players.each do |player|
 		puts "\n#{player.name} is next..."    
    response = 'yes'
 		until response == 'no' || game.over?
       # if player.name != "Computer"
       #   player.hand.to_s
       # end
       puts "Player's hand: #{player.hand.sort {|a,b| a.rank <=> b.rank }}."

      if player.name != "Computer"
        puts "What do you want to fish for (2 3 4 5 6 7 8 9 10 J Q K A)?"
        rank =  gets.chomp
      else
        rank = player.hand[rand(0..player.hand.length-1)].rank  
      end
puts rank

      if player.name != "Computer"
         puts "Do you have any #{rank}'s?"
         response = 'no'
         game.players[1].hand.each {|card| if rank == card.rank then response = 'yes' end}  # improve
      else
         puts "Do you have any #{rank}'s (yes/no)? "
         response =  gets.chomp
      end
puts response


 			if response == 'no'
 				puts "No I don't; go fish!"
        player.hand.add_card(game.dealer_deck.cards[game.dealer_deck.cards.length - 1])
        game.dealer_deck.pop
 				if player.hand[player.hand.length-1].rank == rank
          response = 'yes'
 				end
 			else
 				puts "Yes, I do." 
        game.players[1].hand.each do |index| 
          if rank == game.players[1].hand[index].rank then break end  # improve
        end
        more_fish = true
        while more_fish?
          player.hand.add_card(game.players[1].hand[index])
          index+=
          if rank != game.players[1].hand[index].rank then more_fish = false end
 			  end
      end
       puts "Player's hand: #{player.hand.sort {|a,b| a.rank <=> b.rank }}."


#  			if hand.four_of_a_kind(player)
#  				lay down cards
#  			end
 		end
 	end
end
puts "Winner is #{game.winner.name!}"
