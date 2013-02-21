require './lib/player.rb'

puts "#{player = Player.new('computer')} creates an instance of Player."
player.to_s

puts "#{player.name} is 'computer'."
puts "#{player.hand} is an instance of Hand."
puts "#{player.number_of_suits} should equal 0."

card = Card.new(2)
puts "#{player.add_suit} should equal 1."
puts "#{player.add_card(card)} should contain 4 of clubs."
