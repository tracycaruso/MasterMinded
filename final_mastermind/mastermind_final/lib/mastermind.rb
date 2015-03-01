require_relative 'response'
require_relative 'input_validator'
require_relative 'position_matcher'
require_relative 'color_matcher'
require_relative 'secret_generator'
require_relative 'timer'
require_relative 'guess_counter'

class Mastermind
  attr_reader :timer, :guess_counter, :secret
  def initialize
    @timer = Timer.new
    @guess_counter = GuessCounter.new
    @secret = SecretGenerator.new.generator
    #@secret = (['b', 'b', 'g', 'b']) for testing purposes
  end

  ###MENUOPTIONS##################################################
  def menu(input)
    if input == "quit" || input == "q"
      quit
    elsif input == "instructions" || input == "i"
      instructions
    elsif input == "play" || input == "p"
      play
    elsif input == "cheat" || input == "c"
      cheat
    else
      execute(input)
    end
  end

  def quit
    response = Response.new(:message => "Goodbye!", :status => :end_game)
    puts response.message
    exit
  end

  def instructions
    Response.new(:message => "Detailed Instructions", :status => :continue)
  end

  def play
   timer.start_time
    Response.new(:message => "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?", :status => :continue)
  end

  def cheat
    Response.new(:message => secret.join.upcase, :status => :continue)
  end

  def execute(input)
    validate(input)
  end




  ###VALIDATEANSWER##################################################
  def validate(input)
    input_validator = InputValidator.new(input)
    if !input_validator.valid_answer?
      if input_validator.more_than_four?
        Response.new(:message => "too long", :status => :continue)
      else input_validator.less_than_four?
        Response.new(:message => "too short", :status => :continue)
      end
    else
      check_match(input)
    end
  end#validate




  ###CHECK ANSWER####################################################
  def check_match(input)
    positions = PositionMatcher.new(secret, input)
    colors = ColorMatcher.new(secret, input)
    correct_positions = positions.compare_positions
    correct_colors = colors.compare_colors
    if positions.full_match?
      timer.end_time
      Response.new(:message => "Congratulations! You guessed the sequence '#{secret.join}' in #{guess_counter.guess_number} guesses over #{timer.diff_in_minutes} minutes and #{timer.diff_in_seconds} seconds.\n Do you want to (p)lay again or (q)uit?", :status => :play_again)
    else
      guess_counter.guess_number
      Response.new(:message => "#{input.upcase} has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions. Please guess again.", :status => :continue)
    end
  end#check_match


end#mastermind
