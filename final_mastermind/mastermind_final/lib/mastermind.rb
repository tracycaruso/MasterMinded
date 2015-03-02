require_relative 'messages'
require_relative 'input_validator'
require_relative 'position_matcher'
require_relative 'color_matcher'
require_relative 'secret_generator'
require_relative 'timer'
require_relative 'guess_counter'

class Mastermind
  attr_reader :timer, :guess_counter, :secret, :level, :messages
  def initialize
    @timer = Timer.new
    timer.start_time
    @guess_counter = GuessCounter.new
    @messages = Messages.new
    @secret = SecretGenerator.new(4).generator
    @level = 1
    #@secret = (['b', 'b', 'g', 'b']) #for testing purposes | easy
    #@secret = (['b', 'b', 'g', 'b', 'b', 'o']) #for testing purposes | medium
    #@secret = (['b', 'b', 'g', 'b', 'r', 'o' , 'p', 'g']) #for testing purposes | hard
  end


  ###MENU_OPTIONS##################################################
  def menu(input)
    case input
    when "quit", "q"
      messages.quit
    when "instructions", "i"
      messages.instructions
    when "play", "p"
      messages.difficulty
    when "easy", "e"
      @level = 4
      @secret = SecretGenerator.new(4).generator
      messages.play_easy
    when "medium", "m"
      @level = 6
      @secret = SecretGenerator.new(6).generator
      messages.play_medium
    when "hard", "h"
      @level = 8
      @secret = SecretGenerator.new(8).generator
      messages.play_hard
    when "cheat", "c"
      messages.cheat(@secret)
    else
      validate(input, @level)
    end
  end



  def quit
    messages.quit
  end






  ###VALIDATE_ANSWER##################################################
  def validate(input, level)
    input_validator = InputValidator.new(input, level)
    if !input_validator.valid_answer?
      if input_validator.more_than_length?
        messages.too_long
      else input_validator.less_than_length?
        messages.too_short
      end
    else
      check_match(input)
    end
  end#validate




  ###CHECK_ANSWER####################################################
  def check_match(input)
    positions = PositionMatcher.new(secret, input)
    colors = ColorMatcher.new(secret, input)
    correct_positions = positions.compare_positions
    correct_colors = colors.compare_colors
    if positions.full_match?
      correct_answer(secret)
    else
      wrong_answer(input, correct_positions, correct_colors)
    end
  end#check_match

  def correct_answer(secret)
    timer.end_time
    minutes = timer.time_diff[0]
    seconds = timer.time_diff[1]
    guesses = guess_counter.guess_number
    messages.win(secret, guesses, minutes, seconds)
  end

  def wrong_answer(input, correct_positions, correct_colors)
    guess_counter.guess_number
    messages.try_again(input, correct_positions, correct_colors)
  end



end#mastermind
