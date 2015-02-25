require_relative 'response'
require_relative 'output_generator'

class Mastermind
  attr_reader :og

  def initialize
    @og = OutputGenerator.new
  end


  def execute(input)
    secret = "BBGB"
    if input == secret
      Response.new(:message => "You Win!", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end


  def start_game
    og.start_message
  end
end

test = Mastermind.new
test.start_game
