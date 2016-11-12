class Deck
  def initialize
    @turn = 0;
    @result = 0;
    @predictions = Array.new(52)
    @hand = Array.new(52)
    @deck = Array(0..51)
    @deck.shuffle!

    @suitMap = {
      1 => "Hearts",
      2 => "Diamonds",
      3 => "Spades",
      4 => "Clubs"
    }

    @rankMap = {
      2 => "2",
      3 => "3",
      4 => "4",
      5 => "5",
      6 => "6",
      7 => "7",
      8 => "8",
      9 => "9",
      10 => "10",
      11 => "Jack",
      12 => "Queen",
      13 => "King",
      14 => "Ace",
    }
    @cardMap = {
      0 => [14, 1],
      1 => [14, 2],
      2 => [14, 3],
      3 => [14, 4],

      4 => [13, 1],
      5 => [13, 2],
      6 => [13, 3],
      7 => [13, 4],

      8 => [12, 1],
      9 => [12, 2],
      10 => [12, 3],
      11 => [12, 4],

      12 => [11, 1],
      13 => [11, 2],
      14 => [11, 3],
      15 => [11, 4],

      16 => [10, 1],
      17 => [10, 2],
      18 => [10, 3],
      19 => [10, 4],

      20 => [9, 1],
      21 => [9, 2],
      22 => [9, 3],
      23 => [9, 4],

      24 => [8, 1],
      25 => [8, 2],
      26 => [8, 3],
      27 => [8, 4],

      28 => [7, 1],
      29 => [7, 2],
      30 => [7, 3],
      31 => [7, 4],

      32 => [6, 1],
      33 => [6, 2],
      34 => [6, 3],
      35 => [6, 4],

      36 => [5, 1],
      37 => [5, 2],
      38 => [5, 3],
      39 => [5, 4],

      40 => [4, 1],
      41 => [4, 2],
      42 => [4, 3],
      43 => [4, 4],

      44 => [3, 1],
      45 => [3, 2],
      46 => [3, 3],
      47 => [3, 4],

      48 => [2, 1],
      49 => [2, 2],
      50 => [2, 3],
      51 => [2, 4],
    }

  end

  def play()
    for i in @turn .. 51
      @hand.push(deck.pop)
      reduce()
    end
  end

  def predict()
    sum = 0
    for n in 0 .. 1000
      tmpHand = @hand
      tmpDeck = @deck
      for i in @turn .. 51
        card = tmpDeck.sample(1)
        tmpHand.push(card)
        tmpDeck.delete(card)
      end
    end
  end

def reduce()
  first = @hand.pop
  second = @hand.pop
  third = @hand.pop
  fourth = @hand.pop

end

def print
  for i in @deck
      puts i
      puts @rankMap[@cardMap[i][0]] + " of " + @suitMap[@cardMap[i][1]]
  end
end
end
