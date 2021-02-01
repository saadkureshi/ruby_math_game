require "./io_helper"
class Questions
  @number_1
  @number_2

  def initialize
    @io_helper = IOHelper.new
  end

  def ask_question
    @number_1 = rand(10) + 1
    @number_2 = rand(10) + 1
    @io_helper.print("What is the sum of #{@number_1} and #{@number_2}?")
  end

  def correct_answer?(user_answer)
    user_answer == @number_1 + @number_2 ? true : false
  end
end
