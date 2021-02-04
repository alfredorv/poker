require_relative "../Hand"
require_relative "../Player"

RSpec.describe 'PokerHand' do
  let(:cards) do
    [
      Card.new("clubs", "10"),
      Card.new("clubs", "J"),
      Card.new("clubs", "Q"),
      Card.new("clubs", "K"),
      Card.new("clubs", "A")
    ]
  end
  let(:hand) { Hand.new(cards) }
  subject { Player.new }

  context "#show_cards" do
    let(:response) do
      [
        cards[0],
        cards[1],
        cards[2],
        cards[3],
        cards[4]
      ]
    end

    before { subject.hand = hand }

    it { expect(subject.show_cards).to eql(response) }
  end

  context "#say_hand" do
    before { subject.hand = hand }
    
    it { expect(subject.say_hand).to eql({ name: "Royal Flush", points: 10047 }) }
  end
end
