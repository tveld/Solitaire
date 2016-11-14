class Deck
  def initialize
    @turn = 0;
    @result = 0;
    @hand = Array.new()
    @deck = Array(0..51)
    @deck.shuffle!

    @suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    @ranks = ["2", "3", "4", "5", "6", "7", "8", "9","10","Jack", "Queen", "King", "Ace"]

    @cardMap = Hash.new

    @id = 0

    # map card id to rank and suit
    @ranks.each do |rank|
      @suits.each do |suit|
        @cardMap[@id] = [rank, suit]
        @id += 1
      end
    end

  end

  def play()
    @turn += 1
    puts "We are begining turn " + @turn.to_s
    @hand.push(@deck.pop)
    @hand.push(@deck.pop)
    @hand.push(@deck.pop)
    @hand.push(@deck.pop)

    reduce()

    puts "After turn " + @turn.to_s + " we have: "
    printHand()
  end

  def reduce()
    first = @hand.pop
    second = @hand.pop
    third = @hand.pop
    fourth = @hand.pop

    # puts "The first four are: "
    puts "draw " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
    puts "draw " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
    puts "draw " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
    puts "draw " + @cardMap[fourth][0].to_s + " of " + @cardMap[fourth][1].to_s

    #check rank
    if(@cardMap[first][0] == @cardMap[fourth][0])
      puts "discard " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
      puts "discard " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
      puts "discard " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
      puts "discard " + @cardMap[fourth][0].to_s + " of " + @cardMap[fourth][1].to_s
      if(@hand.length >= 4)
        reduce()
      end
      if(@hand.length == 2)
        if(@deck.length >= 2)
          draw1 = @deck.pop
          draw2 = @deck.pop
          @hand.push(draw1)
          @hand.push(draw2)
          puts "draw " + @cardMap[draw1][0].to_s + " of " + @cardMap[draw1][1].to_s
          puts "draw " + @cardMap[draw2][0].to_s + " of " + @cardMap[draw2][1].to_s
          reduce()
        end
      end
      if(@hand.length == 0)
        if(@deck.length > 4)
          draw1 = @deck.pop
          draw2 = @deck.pop
          draw3 = @deck.pop
          draw4 = @deck.pop
          @hand.push(draw1)
          @hand.push(draw2)
          @hand.push(draw3)
          @hand.push(draw4)
          puts "draw " + @cardMap[draw1][0].to_s + " of " + @cardMap[draw1][1].to_s
          puts "draw " + @cardMap[draw2][0].to_s + " of " + @cardMap[draw2][1].to_s
          puts "draw " + @cardMap[draw3][0].to_s + " of " + @cardMap[draw3][1].to_s
          puts "draw " + @cardMap[draw4][0].to_s + " of " + @cardMap[draw4][1].to_s
          reduce()
        end
      end

      #check suit
    elsif(@cardMap[first][1] == @cardMap[fourth][1])
      puts "discard " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
      puts "discard " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
      @hand.push(fourth)
      @hand.push(first)
      # puts "The suits were the same. We pushed these back in hand:"
      # puts @cardMap[fourth][0] + " of " + @cardMap[fourth][1]
      # puts @cardMap[first][0] + " of " + @cardMap[first][1]
      if(@hand.length >= 4)
        reduce()
      end
      if(@hand.length == 2)
        if(@deck.length >= 2)
          draw1 = @deck.pop
          draw2 = @deck.pop
          @hand.push(draw1)
          @hand.push(draw2)
          puts "draw " + @cardMap[draw1][0].to_s + " of " + @cardMap[draw1][1].to_s
          puts "draw " + @cardMap[draw2][0].to_s + " of " + @cardMap[draw2][1].to_s
          reduce()
        end
      end

    else
      @hand.push(first)
      @hand.push(second)
      @hand.push(third)
      @hand.push(fourth)

    end
  end

  def printDeck
    @deck.each do |i|
      puts @cardMap[i][0] + " of " + @cardMap[i][1]
    end
  end

  def printHand
    @hand.each do |i|
      puts @cardMap[i][0] + " of " + @cardMap[i][1]
    end
  end
end
