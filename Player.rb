class Player
  attr_accessor :cards, :points

  def initialize
    @cards = {
      clubs: [],
      diamonds: [],
      hearts: [],
      spades: []
    }

    @points = 0
  end
end
