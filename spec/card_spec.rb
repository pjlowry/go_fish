require './lib/card.rb'

puts "#{card = Card.new(0)} should be an instance of Card"
puts "#{card.rank} should equal 2"
puts "#{card.suit} should equal spade"

