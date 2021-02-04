require_relative "../StandardDeck"

RSpec.describe 'StandardDeck' do
  let(:cards) { [] }
  subject { StandardDeck.new.tap { |deck| deck.cards = cards } }

  context "#shuffle_deck" do
    let(:cards) do
      [
        Card.new("clubs", "A"),
        Card.new("clubs", "10"),
        Card.new("clubs", "J"),
        Card.new("clubs", "Q"),
        Card.new("clubs", "K")
      ]
    end
    
    it { expect(subject.shuffle_deck).to match_array(cards) }
    
  end

  context "#pick_card!" do
    it { expect { subject.pick_card! }.to raise_error("There are no more cards!") }
    
    context "there are cards" do
      let(:cards) do
        [
          Card.new("clubs", "A"),
          Card.new("clubs", "10"),
          Card.new("clubs", "J"),
          Card.new("clubs", "Q"),
          Card.new("clubs", "K")
        ]
      end
      
      it { expect(subject.pick_card!).to have_attributes({ suit: 'clubs', value: 'K' }) }

    end
  end
end