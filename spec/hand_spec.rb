require_relative "../Hand"

RSpec.describe 'PokerHand' do
  let(:cards) { [] }
  subject { Hand.new(cards) } 

  context "#royal_flush?" do
    let(:cards) do
      [
        Card.new("clubs", "10"),
        Card.new("clubs", "J"),
        Card.new("clubs", "Q"),
        Card.new("clubs", "K"),
        Card.new("clubs", "A")
      ]
    end
    
    it { expect(subject.royal_flush?).to be_truthy }

    context "but the hand is not royal flush" do
      let(:cards) do
        [
          Card.new("hearts", "10"),
          Card.new("clubs", "J"),
          Card.new("diamonds", "K"),
          Card.new("clubs", "Q"),
          Card.new("clubs", "A")
        ]
      end

      it { expect(subject.royal_flush?).to be_falsy }
      
    end
  end

  context "#srtaight_flush?" do
    let(:cards) do
      [
        Card.new("clubs", "8"),
        Card.new("clubs", "5"),
        Card.new("clubs", "6"),
        Card.new("clubs", "4"),
        Card.new("clubs", "7")
      ]
    end

    it { expect(subject.straight_flush?).to be_truthy }

    context "but the cards are not sequential" do
      let(:cards) do
        [
          Card.new("clubs", "9"),
          Card.new("clubs", "5"),
          Card.new("clubs", "6"),
          Card.new("clubs", "4"),
          Card.new("clubs", "7")
        ]
      end
  
      it { expect(subject.straight_flush?).to be_falsy }
    end

    context "but the suits are not equal" do
      let(:cards) do
        [
          Card.new("diamonds", "8"),
          Card.new("clubs", "5"),
          Card.new("spades", "6"),
          Card.new("hearts", "4"),
          Card.new("clubs", "7")
        ]
      end
  
      it { expect(subject.straight_flush?).to be_falsy }
    end
  end

  context "#four_of_a_kind?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "A"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "A"),
        Card.new("clubs", "7")
      ]
    end

    it { expect(subject.four_of_a_kind?).to be_truthy }

    context "but the hand is not four of a kind" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("clubs", "A"),
          Card.new("hearts", "A"),
          Card.new("diamonds", "3"),
          Card.new("clubs", "7")
        ]
      end
  
      it { expect(subject.four_of_a_kind?).to be_falsy }
    end
  end

  context "#full_house?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "A"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "3")
      ]
    end

    it { expect(subject.full_house?).to be_truthy }

    context "but the hand is not full house" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("clubs", "5"),
          Card.new("hearts", "A"),
          Card.new("diamonds", "3"),
          Card.new("clubs", "3")
        ]
      end
  
      it { expect(subject.full_house?).to be_falsy }
    end
  end

  context "#flush?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("spades", "10"),
        Card.new("spades", "4"),
        Card.new("spades", "6"),
        Card.new("spades", "3")
      ]
    end

    it { expect(subject.flush?).to be_truthy }

    context "but the hand is not flush" do
      let(:cards) do
        [
          Card.new("clubs", "A"),
          Card.new("spades", "10"),
          Card.new("spades", "4"),
          Card.new("spades", "6"),
          Card.new("spades", "3")
        ]
      end
  
      it { expect(subject.flush?).to be_falsy }
    end
  end

  context "#straight?" do
    let(:cards) do
      [
        Card.new("diamonds", "5"),
        Card.new("spades", "4"),
        Card.new("clubs", "7"),
        Card.new("hearts", "6"),
        Card.new("spades", "8")
      ]
    end

    it { expect(subject.straight?).to be_truthy }

    context "but cards are not sequential" do
      let(:cards) do
        [
          Card.new("diamonds", "9"),
          Card.new("spades", "4"),
          Card.new("clubs", "7"),
          Card.new("hearts", "6"),
          Card.new("spades", "8")
        ]
      end
  
      it { expect(subject.straight?).to be_falsy }
    end
  end

  context "#three_of_a_kind?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "A"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "3")
      ]
    end

    it { expect(subject.three_of_a_kind?).to be_truthy }

    context "but the hand is not three of a kind" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("clubs", "4"),
          Card.new("hearts", "A"),
          Card.new("diamonds", "3"),
          Card.new("clubs", "3")
        ]
      end
  
      it { expect(subject.three_of_a_kind?).to be_falsy }
    end
  end

  context "#two_pair?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "3"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "10")
      ]
    end

    it { expect(subject.two_pair?).to be_truthy }

    context "but there are not two pairs" do
      let(:cards) do
        [
          Card.new("spades", "4"),
          Card.new("clubs", "3"),
          Card.new("hearts", "A"),
          Card.new("diamonds", "3"),
          Card.new("clubs", "10")
        ]
      end
  
      it { expect(subject.two_pair?).to be_falsy }
    end
  end

  context "#pair?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "4"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "10")
      ]
    end

    it { expect(subject.pair?).to be_truthy }

    context "but there are no pairs" do
      let(:cards) do
        [
          Card.new("spades", "5"),
          Card.new("clubs", "4"),
          Card.new("hearts", "A"),
          Card.new("diamonds", "3"),
          Card.new("clubs", "10")
        ]
      end
  
      it { expect(subject.pair?).to be_falsy }
    end
  end

  context "#high_card" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "4"),
        Card.new("hearts", "2"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "10")
      ]
    end

    it { expect(subject.high_card).to eql(14) }

    context "and the high card is K" do
      let(:cards) do
        [
          Card.new("spades", "K"),
          Card.new("clubs", "4"),
          Card.new("hearts", "2"),
          Card.new("diamonds", "3"),
          Card.new("clubs", "10")
        ]
      end
  
      it { expect(subject.high_card).to eql(13) }
    end
  end

  context "#which_hand_am_i" do
    context "is Royal Flush" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("spades", "10"),
          Card.new("spades", "J"),
          Card.new("spades", "K"),
          Card.new("spades", "Q")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Royal Flush", points: 10047 }) }
    end

    context "is Straight Flush" do
      let(:cards) do
        [
          Card.new("spades", "6"),
          Card.new("spades", "8"),
          Card.new("spades", "7"),
          Card.new("spades", "9"),
          Card.new("spades", "5")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Straight Flush", points: 9035 }) }
    end

    context "is Four of a Kind" do
      let(:cards) do
        [
          Card.new("spades", "6"),
          Card.new("clubs", "6"),
          Card.new("diamonds", "6"),
          Card.new("hearts", "6"),
          Card.new("spades", "5")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Four of a Kind", points: 8029 }) }
    end

    context "is Full House" do
      let(:cards) do
        [
          Card.new("spades", "6"),
          Card.new("clubs", "6"),
          Card.new("diamonds", "6"),
          Card.new("hearts", "5"),
          Card.new("spades", "5")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Full House", points: 7028 }) }
    end

    context "is Flush" do
      let(:cards) do
        [
          Card.new("spades", "6"),
          Card.new("spades", "4"),
          Card.new("spades", "6"),
          Card.new("spades", "5"),
          Card.new("spades", "A")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Flush", points: 6022 }) }
    end

    context "is Straight" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("hearts", "4"),
          Card.new("spades", "3"),
          Card.new("diamonds", "5"),
          Card.new("clubs", "2")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Straight", points: 5015 }) }
    end

    context "is Three of a Kind" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("hearts", "A"),
          Card.new("spades", "3"),
          Card.new("diamonds", "A"),
          Card.new("clubs", "2")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Three of a Kind", points: 4008 }) }
    end

    context "is Two Pair" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("hearts", "3"),
          Card.new("spades", "3"),
          Card.new("diamonds", "A"),
          Card.new("clubs", "2")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Two pair", points: 3010 }) }
    end

    context "is Pair" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("hearts", "3"),
          Card.new("spades", "4"),
          Card.new("diamonds", "A"),
          Card.new("clubs", "2")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Pair", points: 2011 }) }
    end

    context "is High Card" do
      let(:cards) do
        [
          Card.new("spades", "A"),
          Card.new("hearts", "3"),
          Card.new("spades", "4"),
          Card.new("diamonds", "6"),
          Card.new("clubs", "2")
        ]
      end
  
      it { expect(subject.which_hand_am_i).to eql({ name: "High card", points: 1014 }) }
    end
  end
end
