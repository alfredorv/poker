require_relative "StandardDeck"
require_relative "Player"

class PokerGame
  attr_accessor :players

  def initialize(number_of_players)
    @number_of_players = number_of_players
    @players = Array.new(@number_of_players).collect! { Player.new }
    @deck = StandardDeck.new
  end

  def deal_cards
    @players.each do |player|
      5.times { pick_random_card.each { |k, v| player.cards[k].append(v) } }
    end
  end

private

  def pick_random_card
    return [] if @deck.cards.keys.empty?
    suit = @deck.cards.keys.sample
    card = @deck.cards[suit].sample
    @deck.cards[suit].delete(card)
    @deck.cards.delete(suit) if @deck.cards[suit].empty?

    { suit => card }
  end
end

game = PokerGame.new(12)
game.deal_cards
game.players.each { |player| p player.cards}