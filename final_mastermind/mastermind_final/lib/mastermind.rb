require_relative 'response'
require_relative 'input_validator'
require_relative 'position_matcher'
require_relative 'color_matcher'
require_relative 'secret_generator'
require_relative 'timer'
require_relative 'guess_counter'

class Mastermind
  attr_reader :timer, :guess_counter, :secret, :level
  def initialize
    @timer = Timer.new
    @guess_counter = GuessCounter.new
    #@secret = (['b', 'b', 'g', 'b']) for testing purposes
  end

  ###MENU_OPTIONS##################################################
  def menu(input)
    case input
    when "quit", "q"
      quit
    when "instructions", "i"
      instructions
    when "play", "p"
      timer.start_time
      difficulty
    when "easy", "e"
      @level = 4
      @secret = SecretGenerator.new(4).generator
      play_easy
    when "medium", "m"
      @level = 6
      @secret = SecretGenerator.new(6).generator
      play_medium
    when "hard", "h"
      @level = 8
      @secret = SecretGenerator.new(8).generator
      play_hard
    when "cheat", "c"
      cheat
    else
      execute(input, @level)
    end
  end



  ###MENU_RESPONSES#########################################################################################
  def instructions
    Response.new(:message => "Detailed Instructions", :status => :continue)
  end

  def difficulty
    Response.new(:message => "What level of difficulty would you like to play? (e)asy, (m)edium or (h)ard", :status => :continue)
  end

  def play_easy
    Response.new(:message => "I have generated a beginner sequence with four elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow. \nUse (q)uit at any time to end the game.\nWhat's your guess?", :status => :continue)
  end

  def play_medium
    Response.new(:message => "I have generated a medium sequence with six elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow, (o)range. \nUse (q)uit at any time to end the game.\nWhat's your guess?", :status => :continue)
  end

  def play_hard
    Response.new(:message => "I have generated a hard sequence with eight elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow, (o)range, (p)urple. \nUse (q)uit at any time to end the game.\nWhat's your guess?", :status => :continue)
  end

  def cheat
    Response.new(:message => secret.join.upcase, :status => :continue)
  end

  def execute(input, level)
    validate(input, level)
  end

  def quit
    response = Response.new(:message => "Goodbye!", :status => :end_game)
    puts response.message
    exit
  end


  ###VALIDATE_ANSWER##################################################
  def validate(input, level)
    input_validator = InputValidator.new(input, level)
    if !input_validator.valid_answer?
      if input_validator.more_than_length?
        Response.new(:message => "too long", :status => :continue)
      else input_validator.less_than_length?
        Response.new(:message => "too short", :status => :continue)
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
      timer.end_time
      Response.new(:message => "Congratulations! You guessed the sequence '#{secret.join}' in #{guess_counter.guess_number} guesses over #{timer.diff_in_minutes} minutes and #{timer.diff_in_seconds} seconds.\nDo you want to (p)lay again or (q)uit?", :status => :play_again)
    else
      guess_counter.guess_number
      Response.new(:message => "#{input.upcase} has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions. Please guess again.", :status => :continue)
    end
  end#check_match


end#mastermind
