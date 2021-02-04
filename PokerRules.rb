class PokerRules
  def self.winner_hand(hands)
    hands.max_by { |hand| hand[:points] }
  end
end
