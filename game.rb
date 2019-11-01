require_relative "dictionary"
class Game
    def initialize(player1, player2)
        @fragment = ''
        @player1 = player1
        @player2 = player2
        @p1letters = ''
        @p2letters = ''
        puts "OK " + player1 + " and " + player2 + ',' + " let's begin."
        puts "----------------------------"
    end


    def start
        while !self.ghost!(@player1) && !self.ghost!(@player2)
            self.turn(@player1)
            self.turn(@player2) if !self.ghost!(@player1) && !self.ghost!(@player2)
        end
    end

    def turn(name)
        puts "please type a letter, " + name if !self.lose?
        puts "----------------------------"
        @fragment += gets.chomp.downcase
        if self.lose?
            @fragment = ''
            self.add_letters(name)
            puts "you get a letter!"
            puts "----------------------------"
            puts "the current score is..."
            puts @player1 + " at " + "-" + @p1letters + "-"
            puts "and " + @player2 + " at " + "-" + @p2letters + "-"
            puts "----------------------------"
        end
    end


    def lose?
        DICTIONARY.each do |word|
            if word == @fragment
                puts "that's a complete word."
                return true 
            end
        end

        if DICTIONARY.any? { |word| word.include?(@fragment)}
            return false
        else puts "that word isn't in the dictionary, idiot"
            return true
        end
    end

    def ghost!(name)
        if name == @player1 && @p1letters == 'GHOST'
            puts @player1 + " got GHOST! They lose the game."
            return true
        end

        if name == @player2 && @p2letters == 'GHOST'
            puts @player2 + " got GHOST! They lose the game."
            return true
        end
        return false
    end

    def add_letters(player)
        fullstr = "GHOST"
        if player == @player1
            current = @p1letters.length
            @p1letters += fullstr[current]
        elsif player == @player2
            current = @p2letters.length 
            @p2letters += fullstr[current]
        end
    end    
end