require "./io_helper"
require "./questions"
require "./player"

class Game
  @@welcome_msg = "Welcome to the 1v1 Math game!"
  @@game_start_msg = "OK, lets start!"

  def initialize
    @io_helper = IOHelper.new
    @io_helper.print(@@welcome_msg)
    setup_players
    @io_helper.print(@@game_start_msg)
    @question = Questions.new
  end

  def start_game
    ask_question
  end
  
  def setup_players
    @io_helper.print("What is player 1's name? ")
    player1name = @io_helper.get_input
    @io_helper.print("What is player 2's name? ")
    player2name = @io_helper.get_input
    @player1 = Player.new(player1name)
    @player2 = Player.new(player2name)
  end

  def ask_question
    num = 1
    loop do
      current_player = num % 2 == 1 ? @player1 : @player2
      @io_helper.print("#{current_player.name}: #{@io_helper.print(@question.ask_question)}")
      answer = @io_helper.get_input.to_i
      if !@question.correct_answer?(answer)
        current_player.reduce_life
      end
      
      winner = @player1.is_dead? ? @player2 : (@player2.is_dead? ? @player1 : nil)
      if winner != nil
        @io_helper.print("#{winner.name} wins!")
        @io_helper.print("---- GAME OVER ----")
        break
      end
      num += 1
    end
  end
end



