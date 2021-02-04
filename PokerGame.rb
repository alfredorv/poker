require_relative "StandardDeck"
require_relative "Player"
require_relative "PokerRules"
require_relative "PokerGui"

class PokerGame
  MAX_PLAYERS = 6.freeze
  MIN_PLAYERS = 3.freeze

  def initialize(number_of_players)
    return PokerGui.too_many_players if number_of_players > MAX_PLAYERS
    return PokerGui.not_enough_players if number_of_players < MIN_PLAYERS
    @players = Array.new(number_of_players).collect! { Player.new }
    @deck = StandardDeck.new
    @results = []

    play
  end

private
  def deal_cards
    PokerGui.deal_cards
    @players.each do |player|
      5.times do
        card = @deck.pick_card!
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
      PokerGui.draw_line
    end
  end

  def play
    @deck.shuffle_deck
    deal_cards
    obtain_results
    winner = PokerRules.winner_hand(@results)
    PokerGui.call_winner(winner)
  end
  
end

PokerGame.new(PokerGui.ask_number_of_players)