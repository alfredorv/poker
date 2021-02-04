require_relative "Hand"

RSpec.describe Hand, "#is_royal_flush?" do
  context "with no royal flush combination" do
    it "does not have royal flush" do
      cards = [
        Card.new("clubs", "9"),
        Card.new("clubs", "J"),
        Card.new("clubs", "K"),
        Card.new("clubs", "Q"),
        Card.new("clubs", "A")
      ]
      hand = Hand.new(cards)

      expect(hand.is_royal_flush?).to_be false
    end
  end
end