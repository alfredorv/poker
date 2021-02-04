require_relative "StandardDeck"
require_relative "Player"
require_relative "PokerRules"

class PokerGame
  def initialize(number_of_players)
    @players = Array.new(number_of_players).collect! { Player.new }
    @deck = StandardDeck.new
    @results = []
  end

  def play
    @deck.shuffle_deck
    deal_cards
    obtain_results
    winner = PokerRules.winner_hand(@results)
    puts "Winner is player #{winner[:id]}!!"
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

  def obtain_results
    @players.each_with_index do |player, index|
      puts "Player #{index + 1}:"
      result = player.say_hand
      result[:id] = index + 1
      @results << result
      puts
      puts "Cards: "
      player.show_cards 
      40.times { print "-" }
      puts
    end
  end
  
end

game = PokerGame.new(5)
game.play