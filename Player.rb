class Player
  attr_accessor :cards

  def initialize
    @cards = {
      clubs: [],
      diamonds: [],
      hearts: [],
      spades: []
    }
  end
end
