require_relative 'response'
require_relative 'output_generator'
require_relative 'input_parser'

class Mastermind
  attr_reader :og, :ip

  def initialize
    @og = OutputGenerator.new
    @ip = InputParser.new
  end


  def start_game
    og.start_message
    player_choice = ip.player_input
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
  end

  def execute

    secret = generate_code
    guess_validator(secret)

    #  if input == secret
    #    Response.new(:message => "You Win!", :status => :won)
    #  else
    #    Response.new(:message => "Guess again!", :status =>  df  :continue)
    # end
  end

  def generate_code
    secret = ["R", "B", "Y", "G"]
    secret.sample(4)
  end

  def instructions
    og.indepth_instructions
  end

  def quit
    #abort("GAME OVER :( :( :( ")
  end

  def guess_validator(secret)
    guess_valid = false
    while guess_valid == false
      guess = ip.player_input
        if guess == "CHEAT"
          cheat(secret)
          guess_valid = true
        elsif !valid_guess?(input)
          puts "invalid guess"
          guess_valid = false
        else
          guess_valid = true
          find_matches(input)
        end
    end
  end

  def find_matches()
  end

  def valid_guess?(guess)
    guess_four_chars?(guess) && guess_allowed_chars?(guess)
  end

  def guess_four_chars?(guess)
    guess.length == 4
  end

  def guess_allowed_chars?(guess)
    #if not G || Y || B || R fail
    true
  end

  def cheat(secret)
    secret.join.to_s
  end




end
