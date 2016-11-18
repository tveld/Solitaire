class Deck
  def initialize
    @turn = 0;
    @result = 0;
    @hand = Array.new()
    @deck = Array(0..51)
    @deck.shuffle!
    @DeckSize = 52
    @suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    @ranks = ["2", "3", "4", "5", "6", "7", "8", "9","10","Jack", "Queen", "King", "Ace"]
    @value = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1]
    @cardMap = Hash.new
    @id = 0
		@done = 0

    # Assigns the rank and suit and value to each card in our array. 
    for i in 0..13
      @suits.each do |suit|
        @cardMap[@id] = [@ranks[i], suit, @value[i]]
        @id += 1
      end
    end
    #This will generate the frist three cards in our hand, then when play gets called, we are able to just draw one card and start going through the game
		first = @deck.pop
		second = @deck.pop
		third = @deck.pop
    @hand.push(first)
    @hand.push(second)
    @hand.push(third)
  
  end

  def play()
			until @done == 1
		    @turn += 1
				puts 
		    puts "Start of Turn " + @turn.to_s

				if !@deck.empty?
		    	card = @deck.pop()
					@hand.push(card)
					puts "Poped New Value " + @cardMap[card][0].to_s + " of " + @cardMap[card][1].to_s
				else
					@done = 1
				end

				if @done == 0
		    	reduce()
				  puts "After turn " + @turn.to_s + " we have: "
				  
				  printHand()
          puts "*****************************************"
				end
			end

			endGame()
 	end
  

  def reduce()
		if @done == 0
		  first = @hand.pop
		  second = @hand.pop
		  third = @hand.pop
		  fourth = @hand.pop

		  # puts "The first four are: "
		  puts "Poped Value " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
		  puts "Poped Value " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
		  puts "Poped Value " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
		  puts "Poped Value " + @cardMap[fourth][0].to_s + " of " + @cardMap[fourth][1].to_s
		  puts "**********************************************************"
		  #check rank
		  if(@cardMap[first][0] == @cardMap[fourth][0])
		    puts "discard " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
		    puts "discard " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
		    puts "discard " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
		    puts "discard " + @cardMap[fourth][0].to_s + " of " + @cardMap[fourth][1].to_s
			
				fillHand()
			 	reduce()
		    #Here I check the suits 
		  elsif(@cardMap[first][1] == @cardMap[fourth][1])
		    puts "discard " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
		    puts "discard " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
		    puts "***************************"
		   	
				@hand.push(first)
				@hand.push(fourth)

				fillHand()
				reduce()
		  else
				@hand.push(first)
				@hand.push(second)
				@hand.push(third)
				@hand.push(fourth)
			end
=begin
    elsif(@hand.length == 3 && @deck.length >= 1)
      @hand.push(third)
      @hand.push(second)
      @hand.push(first)
      @hand.push(@deck.pop)
      reduce()
    elsif (@hand.length == 2 && @deck.length >= 2 )
      @hand.push(second)
      @hand.push(first)
      @hand.push(@deck.pop)
      @hand.push(@deck.pop)
      reduce()
    elsif (@hand.length == 1 && @deck.length >= 3)
      @hand.push(first)
      @hand.push(@deck.pop)
      @hand.push(@deck.pop)
      @hand.push(@deck.pop)
      reduce()

    elsif(@deck.length == 0)
      puts "We are out of cards in the deck!"
      @hand.push(first)
      @hand.push(second)
      @hand.push(third)
      @hand.push(fourth)
      puts "Printing the cards left in our hand"
      printHand()
      puts @TotalPoints
      puts "Adding the points left in our hand" 
      puts @TotalPoints
      puts "Printing what is left in our deck"
      printDeck()
=end
	end
end

def endGame
	totalPoints = 0
	if @hand.length == 0
		puts "You Won!!!"
	else
		@hand.each do |card|
			totalPoints += @cardMap[card][2]
		end

		puts "You scored " + totalPoints.to_s + " points!"
		

	end
end

def fillHand
	if @hand.length == 3
		if @deck.length >= 1
			first = @deck.pop
			@hand.push(first)
			puts "Draw " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
		else
			@done = 1
		end
	elsif @hand.length == 2
		if @deck.length >= 2
			first = @deck.pop
			second = @deck.pop
			@hand.push(first)
			@hand.push(second)	
			puts "Draw " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
			puts "Draw " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
		else
			@done = 1
		end
	elsif @hand.length == 1
		if @deck.length >= 3
			first = @deck.pop
			second = @deck.pop
			third = @deck.pop
			@hand.push(first)
			@hand.push(second)
			@hand.push(third)
		  puts "Draw " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
			puts "Draw " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
			puts "Draw " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
		else
			@done = 1
		end
	elsif @hand.length == 0
		if @deck.length >= 4
			first = @deck.pop
			second = @deck.pop
			third = @deck.pop
			fourth = @deck.pop
			@hand.push(first)
			@hand.push(second)
			@hand.push(third)
			@hand.push(fourth)
			puts "Draw " + @cardMap[first][0].to_s + " of " + @cardMap[first][1].to_s
			puts "Draw " + @cardMap[second][0].to_s + " of " + @cardMap[second][1].to_s
			puts "Draw " + @cardMap[third][0].to_s + " of " + @cardMap[third][1].to_s
			puts "Draw " + @cardMap[fourth][0].to_s + " of " + @cardMap[fourth][1].to_s
		else
			@done = 1
		end
	end


end
 def printDeck
    @deck.each do |i|
      puts @cardMap[i][0].to_s + " of " + @cardMap[i][1].to_s + " wth a value of " + @cardMap[i][2].to_s
    end
  end

  def printHand
    @hand.each do |i|
      puts @cardMap[i][0] + " of " + @cardMap[i][1].to_s
    end
  end
end
