require_relative 'response'
require_relative 'output_generator'
require_relative 'input_parser'

class Mastermind
  attr_reader :og, :ip

  def initialize
    @og = OutputGenerator.new
    @ip = InputParser.new
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
    player_choice = ip.player_menu_selection
    eval_menu_selection("p")
  end

  def eval_menu_selection(selection)
    if selection == "play" || "p"
      puts "play"
    end
  end
end
