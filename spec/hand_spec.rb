require_relative "../Hand"

RSpec.describe 'PokerHand' do
  let(:cards) { [] }
  subject { Hand.new(cards) } 

  context "#is_royal_flush?" do
    let(:cards) do
      [
        Card.new("clubs", "10"),
        Card.new("clubs", "J"),
        Card.new("clubs", "Q"),
        Card.new("clubs", "K"),
        Card.new("clubs", "A")
      ]
    end
    
    it { expect(subject.is_royal_flush?).to be_truthy}

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

      it { expect(subject.is_royal_flush?).to be_falsy }
      
    end
  end

  context "#is_srtaight_flush?" do
    let(:cards) do
      [
        Card.new("clubs", "8"),
        Card.new("clubs", "5"),
        Card.new("clubs", "6"),
        Card.new("clubs", "4"),
        Card.new("clubs", "7")
      ]
    end

    it { expect(subject.is_straight_flush?).to be_truthy }

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
  
      it { expect(subject.is_straight_flush?).to be_falsy }
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
  
      it { expect(subject.is_straight_flush?).to be_falsy }
    end
  end

  context "#is_four_of_a_kind?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "A"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "A"),
        Card.new("clubs", "7")
      ]
    end

    it { expect(subject.is_four_of_a_kind?).to be_truthy }

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
  
      it { expect(subject.is_four_of_a_kind?).to be_falsy }
    end
  end

  context "#is_full_house?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "A"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "3")
      ]
    end

    it { expect(subject.is_full_house?).to be_truthy }

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
  
      it { expect(subject.is_full_house?).to be_falsy }
    end
  end

  context "#is_flush?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("spades", "10"),
        Card.new("spades", "4"),
        Card.new("spades", "6"),
        Card.new("spades", "3")
      ]
    end

    it { expect(subject.is_flush?).to be_truthy }

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
  
      it { expect(subject.is_flush?).to be_falsy }
    end
  end

  context "#is_straight?" do
    let(:cards) do
      [
        Card.new("diamonds", "5"),
        Card.new("spades", "4"),
        Card.new("clubs", "7"),
        Card.new("hearts", "6"),
        Card.new("spades", "8")
      ]
    end

    it { expect(subject.is_straight?).to be_truthy }

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
  
      it { expect(subject.is_straight?).to be_falsy }
    end
  end

  context "#is_three_of_a_kind?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "A"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "3")
      ]
    end

    it { expect(subject.is_three_of_a_kind?).to be_truthy }

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
  
      it { expect(subject.is_three_of_a_kind?).to be_falsy }
    end
  end

  context "#is_two_pair?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "3"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "10")
      ]
    end

    it { expect(subject.is_two_pair?).to be_truthy }

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
  
      it { expect(subject.is_two_pair?).to be_falsy }
    end
  end

  context "#is_pair?" do
    let(:cards) do
      [
        Card.new("spades", "A"),
        Card.new("clubs", "4"),
        Card.new("hearts", "A"),
        Card.new("diamonds", "3"),
        Card.new("clubs", "10")
      ]
    end

    it { expect(subject.is_pair?).to be_truthy }

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
  
      it { expect(subject.is_pair?).to be_falsy }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Royal Flush", points: 10000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Straight Flush", points: 9000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Four of a Kind", points: 8000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Full House", points: 7000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Flush", points: 6000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Straight", points: 5000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Three of a Kind", points: 4000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Two pair", points: 3000 }) }
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
  
      it { expect(subject.which_hand_am_i).to eql({ name: "Pair", points: 2000 }) }
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
