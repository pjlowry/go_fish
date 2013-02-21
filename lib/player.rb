require './lib/deck.rb'

class Player
	attr_reader :name, :hand, :number_of_suits

	def initialize(name)
		@name = name
		@hand = []
		@number_of_suits = 0
	end

	def add_suit
		@number_of_suits += 1
	end

	def add_card(card)
    	@hand << card
  	end
end
