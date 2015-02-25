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
    eval_menu_selection(player_choice)
  end

  def eval_menu_selection(selection)

    case selection
    when "p", "play"
      play
    when "i", "instructions"
      instructions
    when "q", "quit"
      quit
    end
  end

  def play
    og.basic_instructions
    generate_code
  end

  def generate_code
    secret = ["r", "b", "y", "g"]
    secret = secret.sample(4)
  end

  def instructions
    og.indepth_instructions
  end

  def quit
    #abort("GAME OVER :( :( :( ")
  end

  def valid_guess?
    guess_four_chars? && guess_allowed_chars?
  end

  def guess_four_chars?
    true
  end

  def guess_allowed_chars?
    true
  end




end
