require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/game.rb'



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

game = Game.new
dealer_deck = Deck.new

players = [Player.new(name), Player.new('Computer')].shuffle

# game.to_s
# players.each {|player| puts "\n#{player.name}"}

puts "#{players[0].name} goes first"
puts "Press enter to deal cards."
gets.chomp
dealer_deck.deal(players)
players.each {|player| player.hand.sort! {|a,b| a.rank <=> b.rank }}
# players.each {|player| puts "\n#{player.name} has a hand of 7 cards: #{player.hand.display_deck}"}
players.each do |player| 
  puts "\n#{player.name}'s hand:"
  for i in 0..(player.hand.length-1)
    puts "#{player.hand[i].rank}, #{player.hand[i].suit}"
  end
end

#       if hand.four_of_a_kind(both player)
#         lay down cards
#       end
until game.over(players, dealer_deck)
 	players.each do |player|
#    p players
#   p player
    other_player = (players - [player]).first
    # [player1, player2] - player1 = [player2].first player2
 		puts "\n#{player.name} is next..."    
    response = 'yes'
 		until response == 'no' || game.over(players, dealer_deck)       
    # if player.name != "Computer"
       #   player.hand.to_s
       # end
#       puts "Player's hand: #{player.hand.sort! {|a,b| a.rank <=> b.rank }}."

      if player.name != "Computer"
        puts "What do you want to fish for (2 3 4 5 6 7 8 9 10 J Q K A)?"
        rank =  gets.chomp
      else
        rank = player.hand[rand(0..player.hand.length - 1)].rank  
      end
#puts rank

      if player.name != "Computer"
         puts "Do you have any #{rank}'s?"
         response = 'no'
         
# players[1].hand.cards.each {|card| if rank == card.rank then response = 'yes' end}  # improve
#puts "#{other_player.hand.display_deck}"
         if other_player.hand.find_index {|card| card.rank.include? rank} then response = 'yes' end
      else
         puts "Do you have any #{rank}'s (yes/no)? "
         response =  gets.chomp
      end
#puts response


 			if response == 'no'
 				puts "No I don't; go fish!"
# puts "#{player.hand}"
        player.add_card(dealer_deck.cards[dealer_deck.cards.length - 1])
        dealer_deck.cards.pop
 				if player.hand[player.hand.length - 1].rank == rank
          response = 'yes'
 				end
 			else
 				puts "Yes, I do." 
        index = other_player.hand.find_index {|card| card.rank.include? rank}
        while index
          player.add_card(other_player.hand[index])
          other_player.hand.slice!(index)
          index = other_player.hand.find_index {|card| card.rank.include? rank}
puts index
 			  end
      end
      player.hand.sort! {|a,b| a.rank <=> b.rank }

players.each do |player| 
  puts "\n#{player.name}'s hand :"
  for i in 0..(player.hand.length-1)
    puts "#{player.hand[i].rank}, #{player.hand[i].suit}"
  end
end
#check for 4 of a kind
    index = 0
    while index < (player.hand.length - 3)
      if player.hand[index].rank == player.hand[index + 1].rank && 
         player.hand[index].rank == player.hand[index + 2].rank &&
         player.hand[index].rank == player.hand[index + 3].rank

        player.hand.slice!(index..index+3)
        puts "four of a kind"
      end
      index = index + 1
    end
    end
 	end
end
puts "Winner is #{game.winner(players).name!}"
