require_relative "StandardDeck"
require_relative "Player"
require_relative "PokerRules"

class PokerGame
  def initialize(number_of_players)
    @players = Array.new(number_of_players).collect! { Player.new }
    @deck = StandardDeck.new
    # @rules = PokerRules.new
  end

  def play
    @deck.shuffle_deck
    deal_cards
    show_players_cards
    show_players_hands
  end

private
  def deal_cards
    puts "Dealing cards..."
    @players.each do |player|
      5.times do
        card = @deck.pick_card!
        if card.nil?
          p "There are no more cards!"
          return
        end
        player.hand.cards << card
      end
    end
  end

  # Crear método para evitar repetir código aquí y abajo
  def show_players_cards
    @players.each_with_index do |player, index| 
      puts "Player #{index + 1} cards:"
      player.show_cards 
      40.times { print "-" }
      puts
    end
  end

  def show_players_hands
    @players.each_with_index do |player, index|
      puts "Player #{index + 1} hand: "
      player.say_hand
      40.times { print "-" }
      puts
    end
  end

  # USAR MÉTODO SEND con SYMBOLS
  def players_activity(message, method)
  end
end

game = PokerGame.new(5)
game.play