require_relative "StandardDeck"

class Hand
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def is_royal_flush?
    return false unless all_same_suit?
    find_cards_numeric_value.sort == [10, 11, 12, 13, 1].sort
  end

  def is_straight_flush?
    return false unless all_same_suit?
    find_cards_numeric_value.sort! == (a.first..a.last).to_a
  end

  def is_four_of_a_kind?
    count_values = Hash.new(0)
    cards_values.each { |value| count_values[value] += 1 }
    count_values.any? { |k,v| v == 4} 
  end

  def is_flush?
    all_same_suit?
  end

  def which_hand_am_i
    return { name: "Royal Flush", points: 10000 } if is_royal_flush?
    # return { name: "Straight Flush", points: 9000 } if is_straight_flush?(hand)
    # return { name: "Four of a Kind", points: 8000 } if is_four_of_a_kind?(hand)
    # return { name: "Full House", points: 7000 } if is_full_house?(hand)
    # return { name: "Flush", points: 6000 } if is_flush?(hand)
    # return { name: "Straight", points: 5000 } if is_straight?(hand)
    # return { name: "Three of a Kind", points: 4000 } if is_three_of_a_kind?(hand)
    # return { name: "Two pair", points: 3000 } if is_two_pair?(hand)
    # return { name: "Pair", points: 2000 } if is_pair?(hand)
    # return { name: "High card", points: 1000 } if is_high_card?(hand)
    return {}
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
