require_relative "Card"
require_relative "PokerGui"

class StandardDeck
  attr_accessor :cards

  SUITS = ["clubs", "diamonds", "hearts", "spades"].freeze
  VALUES = {
    "A" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13
  }.freeze

  def initialize
    @cards = []
    create_cards
  end

  def shuffle_deck
    PokerGui.shuffling_deck
    @cards.shuffle!
  end
  
  def pick_card!
    raise StandardError.new "There are no more cards!" if @cards.empty?
    @cards.pop
  end

private
  def create_cards
    SUITS.each do |suit|
      VALUES.each_pair do |k, v|
        @cards << Card.new(suit, k)
      end
    end
  end  
end
