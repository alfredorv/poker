class PokerRules
  def is_royal_flush?(cards)
    cards.each_pair do |k, v| 
      next if v.empty?
      if v.size == 5
        return true if v.sort == ["10", "J", "Q", "K", "A"].sort
      end
    end
    false
  end

  def is_straight_flush?(cards)

  end
end
