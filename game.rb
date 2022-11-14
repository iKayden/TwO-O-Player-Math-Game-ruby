require './player.rb' #attr_reader :name attr_accessor :lives, :turn
require './question.rb' #attr_reader :random_question, :answer

class Game

  def initialize() #to start the game
    puts "Write the name of the first player...."
    player1 = gets.chomp
    @player1 = Player.new(player1) #Saving the name and creating new Instance var
    puts "Now write the name of the second player...."
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

  def ask_question
    @question = Question.new
    puts "----- NEW TURN -----"
    if @player1.turn #turn - set to false by default (checks if it false -> then do player2)
      puts "#{@player2.name}: #{@question.random_question}" #
    else #if it si not false, (true) ask player1
      puts "#{@player1.name}: #{@question.random_question}" #
    end
  end

  def verify_answer
    answer_attempt = gets.chomp.to_i
    #answer is a variable from the Question class
    if answer_attempt == @question.answer #if the answer is correct
      if @player1.turn
        puts "#{@player2.name}: YES! You are correct."
        @player1.turn = false #need to verify this logic
        @player2.turn = true #need to verify this logic
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_who_win
      else
        puts "#{@player1.name}: YES! You are correct."
        @player1.turn = true #need to verify this logic
        @player2.turn = false #need to verify this logic
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_who_win
      end
    else #if the answer was wrong
      if @player1.turn
        puts "#{@player2.name}: Seriously? No!"
        @player2.lives -= 1
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_who_win
      else
        puts "#{@player1.name}: Seriously? No!"
        @player1.lives -= 1
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        check_who_win
      end
    end
  end

  def check_who_win
    if @player1.lives == 0
      puts "... some time later ..."
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    elsif @player2.lives == 0
      puts "... some time later ..."
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else
      keep_playing
    end
  end

  def keep_playing
    ask_question
    verify_answer
  end
end

