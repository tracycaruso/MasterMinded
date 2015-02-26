require_relative 'response'
require_relative 'output_generator'
require_relative 'input_parser'

class Mastermind

  def execute(input)
  #   secret = generate_code
  #   if input == secret
  #     Response.new(:message => "You Win!", :status => :won)
  #   else
  #     Response.new(:message => "Guess again!", :status => :continue)
  #   end
  end

  #CODEGENERATOR##################################
  def generate_code
    secret = ["R", "B", "Y", "G"]
    secret.sample(4)
  end

  #QUITCODE#######################################
  def quit
    #abort("GAME OVER :( :( :( ")
  end

  #GUESSVALIDATOR#################################
  def guess_validator(input)
    if !valid_guess?(input)
      puts "invalid guess"
      guess_valid = false
    else
      guess_valid = true
    end
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

  #SECRETEVALUATOR###################################
  def secret_evaluator(player_input, game_secret)
    puts "WORKING"
    compare_positions(player_input, game_secret)

  end

  def compare_positions(player_input, game_secret)
    print player_input
    print game_secret
    "2 in the correct positions"
  end

  # def find_matches
  # end


  #CHEAT#############################################
  def cheat(secret)
    secret.join.to_s
  end

end
