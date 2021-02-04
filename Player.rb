require_relative "Hand"

class Player
  attr_accessor :hand, :points

  def initialize
    @hand = Hand.new
    @points = 0
  end

  def show_cards
    @hand.cards.each do |card|
      puts "Suit: #{card.suit} | Value: #{card.value}"
    end
  end

  def say_hand
    hand = @hand.which_hand_am_i
    puts "Hand: #{hand[:name]}"
    puts "Points: #{hand[:points]}"
    hand
  end
end
