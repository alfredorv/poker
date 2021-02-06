require_relative "StandardDeck"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def royal_flush?
    return false unless all_same_suit?
    cards_values.sort == [1, 10, 11, 12, 13]
  end

  def straight_flush?
    return false unless all_same_suit?
    a = cards_values.sort
    a == (a.first..a.last).to_a
  end

  def four_of_a_kind?
    count_same_elements(cards_values).any? { |k,v| v == 4}
  end

  def full_house?
    three_of_a_kind? && pair?
  end
  
  def flush?
    all_same_suit?
  end
  
  def straight?
    a = cards_values.sort
    a == (a.first..a.last).to_a
  end
  
  def three_of_a_kind?
    count_same_elements(cards_values).any? { |k,v| v == 3} 
  end

  def two_pair?
    count_same_elements(cards_values).select! { |k,v| v == 2 }.length == 2
  end

  def pair?
    count_same_elements(cards_values).select! { |k,v| v == 2 }.length == 1
  end

  def high_card
    a = cards_values
    a.include?(1) ? 14 : a.max
  end
  
  def which_hand_am_i
    points =  cards_values.reduce(:+)
    return { name: "Royal Flush", points: 10000 + points } if royal_flush?
    return { name: "Straight Flush", points: 9000 + points } if straight_flush?
    return { name: "Four of a Kind", points: 8000 + points } if four_of_a_kind?
    return { name: "Full House", points: 7000 + points } if full_house?
    return { name: "Flush", points: 6000 + points } if flush?
    return { name: "Straight", points: 5000 + points } if straight?
    return { name: "Three of a Kind", points: 4000 + points } if three_of_a_kind?
    return { name: "Two pair", points: 3000 + points } if two_pair?
    return { name: "Pair", points: 2000 + points } if pair?
    return { name: "High card", points: 1000 + high_card }
  end

private
  def all_same_suit?
    @cards.each_with_object(Hash.new(0)) do |card, count_hash|
      count_hash[card.suit] += 1
    end.any? { |k,v| v == 5 }
  end

  def cards_values
    @cards.each_with_object([]) { |card, a| a << StandardDeck::VALUES[card.value] }
  end

  def count_same_elements(array)
    array.each_with_object(Hash.new(0)) { |element, count_hash|  count_hash[element] += 1}
  end
end
