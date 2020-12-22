class Player
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        puts "Welcome, #{@name}, you'll be #{@symbol}s "
    end 
end

class Board

    def initialize
        @row1 = "   |   |   "
        @row2 = "   |   |   "
        @row3 = "   |   |   "
        @rowdiv = "-----------"
        print_board
    end

    def check_input(n)
        loc_hash = {"tl" => @row1[0..2], "tc" => @row1[4..6], "tr" => @row1[8..10], "ml" => @row2[0..2], "mc" => @row2[4..6], "mr" => @row2[8..10], "bl" => @row3[0..2], "bc" => @row3[4..6], "br" => @row3[8..10]}
        # p loc_hash[n]
        y = loc_hash[n]
        if !y || y.include?("X") || y.include?("O") 
            puts "I'm sorry, you can't place there. Try again:"
            n = gets.chomp
            return check_input(n)
        end
        # p "This is the new n: #{n}"
        return n 
    end   

    def check_status(winner_name, symb)
        #Checks for horizontal win
        if @row1.scan(symb).count == 3 || @row2.scan(symb).count == 3 || @row3.scan(symb).count == 3  
            puts "#{winner_name} wins!!" 
            puts "HORIZONTAL"
            p "========GAME OVER========"
            return false 
        end
        
        #Checks for vertical win
        for x in [1, 5, 9] do
            if @row1[x] == symb && @row2[x] == @row1[x] && @row3[x] == @row1[x]
                puts "#{winner_name} wins!!" 
                puts "VERTICAL"
                p "========GAME OVER========"
                return false 
            end 
        end

        #Checks for diagonal win from tl to br
        if @row1[1] == symb && @row2[5] == symb && @row3[9] == symb
            puts "#{winner_name} wins!!" 
            puts "DIAGONAL tl to br"
            p "========GAME OVER========"
            return false 
        end 

        #Checks for diagonal win from tr to bl
        if @row1[9] == symb && @row2[5] == symb && @row3[1] == symb
            puts "#{winner_name} wins!!" 
            puts "DIAGONAL tr to bl"
            p "========GAME OVER========"
            return false 
        end 

        #If code reaches this point, returns true signifying noone has won yet
        return true 
    end   

    def tl(symb)
        @row1[0..2]=" "+symb+" "
        print_board
    end

    def tc(symb)
        @row1[4..6]=" "+symb+" "
        print_board
    end

    def tr(symb)
        @row1[8..10]=" "+symb+" "
        print_board
    end

    def ml(symb)
        @row2[0..2]=" "+symb+" "
        print_board
    end

    def mc(symb)
        @row2[4..6]=" "+symb+" "
        print_board
    end

    def mr(symb)
        @row2[8..10]=" "+symb+" "
        print_board
    end

    def bl(symb)
        @row3[0..2]=" "+symb+" "
        print_board
    end

    def bc(symb)
        @row3[4..6]=" "+symb+" "
        print_board
    end

    def br(symb)
        @row3[8..10]=" "+symb+" "
        print_board
    end

    def print_board
        puts @row1
        puts @rowdiv
        puts @row2
        puts @rowdiv
        puts @row3
    end
end

def display_rules
    puts "To place your mark, type the two-character code for the position."
    puts "Give the row value first ('t'op, 'm'iddle, or 'b'ottom), then the column value ('l'eft, 'c'enter, 'r'ight)"
    puts "For example, to place your  mark in the middle of the board, type 'mc'"
end

def host

    no_winner_yet = true

    puts "Let's play some Ric-Rac-Ruby! Player 1, please enter your name"
    p1name = gets.chomp
    p1 = Player.new(p1name, "X")


    puts "Player 2, please enter your name"
    p2name = gets.chomp
    p2 = Player.new(p2name, "O")


    display_rules

    # Initializes new instance of board
    r1 = Board.new
    
    turns = 0
    while turns <8
        p "Number of turns: #{turns}"
        if no_winner_yet == true
            puts "#{p1name}, you're up. Type in a two-character position."
            n = gets.chomp
            x = r1.check_input(n)
            # p x
            r1.method(x).call("X")
            turns +=1
            no_winner_yet = r1.check_status(p1name, "X")
            if no_winner_yet == false
                next
            end
        end

        if no_winner_yet == true 
            puts "#{p2name}, you're up. Type in a two-character position."
            n = gets.chomp
            x = r1.check_input(n)
            # p x
            r1.method(x).call("O")
            turns +=1
            no_winner_yet = r1.check_status(p2name, "O")
            # p "Status of no_winner_yet: #{no_winner_yet}"
        end
    end

    #Gives the final play to player 1 if only one square left
    if no_winner_yet == true
        puts "#{p1name}, you're up. Type in a two-character position."
        n = gets.chomp
        x = r1.check_input(n)
        # p x
        r1.method(x).call("X")
        turns +=1
        no_winner_yet = r1.check_status(p1name, "X")
    end

    if no_winner_yet == true
        p "This game was a draw."
    
    end
    



end


host
# puts "Did you want to play again?"