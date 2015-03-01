require_relative 'response'
require_relative 'input_validator'
require_relative 'position_matcher'
require_relative 'color_matcher'
require_relative 'secret_generator'

class Mastermind
  attr_reader :secret
  def initialize
    code = SecretGenerator.new
    #@secret = code.generator
    @secret = ["b", "b", "g", "b"]
  end

  def execute(input)
    input_validator = InputValidator.new(input)
    positions = PositionMatcher.new(secret, input)
    colors = ColorMatcher.new(secret, input)
    timer = Timer.new
    correct_positions = positions.compare_positions
    correct_colors = colors.compare_colors

    ###MENUOPTIONS#####################################################
    if input == "quit" || input == "q"
      Response.new(:message => "Goodbye!", :status => :end_game)
    elsif input == "play" || input == "p"
      Response.new(:message => "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?", :status => :continue)
    elsif input == "instructions" || input == "i"
      Response.new(:message => "Detailed Instructions", :status => :continue)


    ###RETURNCHEATCODE#################################################
    elsif input == "cheat" || input == "c"
      Response.new(:message => secret.join.upcase, :status => :continue)


    ###VALIDATE ANSWER##################################################
    elsif !input_validator.valid_answer?
      if input_validator.more_than_four?
        Response.new(:message => "too long", :status => :continue)
      else input_validator.less_than_four?
        Response.new(:message => "too short", :status => :continue)
      end

    ###CHECK ANSWER####################################################
    elsif positions.full_match?
        Response.new(:message => "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes, 22 seconds.\n Do you want to (p)lay again or (q)uit?", :status => :continue)
    else
        Response.new(:message => "#{input.upcase} has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions. Please guess again.", :status => :continue)
    end
  end




end
