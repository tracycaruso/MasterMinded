require_relative 'response'
require_relative 'input_validator'
require_relative 'position_matcher'
require_relative 'color_matcher'
require_relative 'secret_generator'

class Mastermind
  attr_accessor :secret
  def initialize
    code = SecretGenerator.new
    @secret = code.generator
  end

  def execute(input)


    input_validator = InputValidator.new(input)
    positions = PositionMatcher.new(secret, input)
    colors = ColorMatcher.new(secret, input)
    correct_positions = positions.compare_positions
    correct_colors = colors.compare_colors


    ###VALIDATE ANSWER
    if !input_validator.valid_answer?
      if input_validator.more_than_four?
        Response.new(:message => "too long", :status => :continue)
      else input_validator.less_than_four?
        Response.new(:message => "too short", :status => :continue)
      end


    ###RETURN CHEAT CODE
    elsif input == ["c", "h", "e", "a", "t"] || input == ["c"]
      Response.new(:message => secret.join.upcase, :status => :continue)


    ###CHECK ANSWER
    elsif positions.full_match?
        Response.new(:message => "You Win!", :status => :won)
    else
        Response.new(:message => "#{input.join.upcase} has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions", :status => :continue)
    end
  end




end
