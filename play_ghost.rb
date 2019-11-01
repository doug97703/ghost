require_relative "game"
puts "Welcome to GHOST. Would you like to start a game (Y/n)?"
yesno = gets.chomp
if yesno.downcase != 'y'
    puts "OK seeya later!" 
    exit
end
if yesno.downcase == 'y'
    puts 'what is the name of player1?'
    puts "----------------------------"
    player1 = gets.chomp
    puts 'what is the name of player2?'
    puts  "----------------------------"
    player2 = gets.chomp
    puts  "----------------------------"
end

game = Game.new(player1, player2)
game.start


