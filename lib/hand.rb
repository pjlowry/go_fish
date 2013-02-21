class Hand
  attr_reader :holding, :on_the_table, :opponent_fished_for, :number_left_in_hand

  def initialize
    @holding = Deck.new
    @on_the_table = Deck.new
    @opponent_fished_for = Deck.new
  end

  def display(cards)
    cards.each {|index| puts "cards[index]"}
  end 
end