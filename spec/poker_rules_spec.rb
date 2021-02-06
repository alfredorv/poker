require_relative "../PokerRules"

RSpec.describe 'PokerRules' do
  let(:hands) do
    [
      { name: "Royal Flush", points: 10047 },
      { name: "Straight Flush", points: 9035 },
      { name: "Four of a Kind", points: 8029 },
      { name: "Full House", points: 7028 },
      { name: "Flush", points: 6022 },
      { name: "Straight", points: 5015 }
    ]
  end

  context "#self.winner_hand" do
    it { expect(PokerRules.winner_hand(hands)). to eql({ name: "Royal Flush", points: 10047 }) }

    context "when two players have Straight Flush" do
      let(:hands) do
        [
          { name: "Straight Flush", points: 9040 },
          { name: "Straight Flush", points: 9035 },
          { name: "Four of a Kind", points: 8029 },
          { name: "Full House", points: 7028 },
          { name: "Flush", points: 6040 },
          { name: "Straight", points: 5015 }
        ]
      end

      it { expect(PokerRules.winner_hand(hands)). to eql({ name: "Straight Flush", points: 9040 }) }
    end
  end
end