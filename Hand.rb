require_relative "StandardDeck"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def is_royal_flush?
    return false unless all_same_suit?
    find_cards_numeric_value.sort == [1, 10, 11, 12, 13]
  end

  def is_straight_flush?
    return false unless all_same_suit?
    a = find_cards_numeric_value.sort
    a == (a.first..a.last).to_a
  end

  def is_four_of_a_kind?
    count_same_elements(cards_values).any? { |k,v| v == 4}
  end

  def is_full_house?
    is_three_of_a_kind? && is_pair?
  end
  
  def is_flush?
    all_same_suit?
  end
  
  def is_straight?
    a = find_cards_numeric_value.sort
    a == (a.first..a.last).to_a
  end
  

  def is_three_of_a_kind?
    count_same_elements(cards_values).any? { |k,v| v == 3} 
  end

  def is_two_pair?
    count_same_elements(cards_values).select! { |k,v| v == 2 }.length == 2
  end

  def is_pair?
    count_same_elements(cards_values).select! { |k,v| v == 2 }.length == 1
  end

  def high_card
    a = find_cards_numeric_value.sort
    return 14 if a.first == 1
    a.last
  end
  

  def which_hand_am_i
    return { name: "Royal Flush", points: 10000 } if is_royal_flush?
    return { name: "Straight Flush", points: 9000 } if is_straight_flush?
    return { name: "Four of a Kind", points: 8000 } if is_four_of_a_kind?
    return { name: "Full House", points: 7000 } if is_full_house?
    return { name: "Flush", points: 6000 } if is_flush?
    return { name: "Straight", points: 5000 } if is_straight?
    return { name: "Three of a Kind", points: 4000 } if is_three_of_a_kind?
    return { name: "Two pair", points: 3000 } if is_two_pair?
    return { name: "Pair", points: 2000 } if is_pair?
    return { name: "High card", points: 1000 + high_card }
  end

private
  def all_same_suit?
    count_hash = Hash.new(0)
    @cards.each { |card| count_hash[card.suit] += 1 } 
    count_hash.any? { |k,v| v == 5 }
  end

  def cards_values
    a = Array.new
    @cards.each { |card| a << StandardDeck::VALUES[card.value] }
    a
  end

  def count_same_elements(array)
    count_hash = Hash.new(0)
    array.each { |element|  count_hash[element] += 1 }
    count_hash
  end

  def find_cards_numeric_value
    a = Array.new
    @cards.each { |card| a << StandardDeck::VALUES[card.value] }
    a
  end
end
