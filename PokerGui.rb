class PokerGui
  def self.ask_number_of_players
    puts "How many players will play?:"
    gets.chomp.to_i
  end

  def self.shuffling_deck
    puts "Shuffling deck..."
  end
  
  def self.deal_cards
    puts "Dealing cards..."
  end

  def self.draw_line
    40.times { print "-" }
    puts
  end

  def self.too_many_players
    puts "There are too many players!"
  end
  
  def self.not_enough_players
    puts "There are not enough players!"
  end

  def self.call_winner(winner)
    puts "Winner is player #{winner[:id]}!!"
  end
end
