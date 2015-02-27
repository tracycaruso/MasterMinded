require './mastermind'

class Menu
  attr_reader :mastermind, :output_generator, :input_parser

  def initialize
    @mastermind = Mastermind.new
    @output_generator = OutputGenerator.new
    @input_parser = InputParser.new
  end

  def run
    output_generator.welcome_message
    selection = input_parser.input
    play(selection)
    instructions(selection)
    quit(selection)
  end

  def end
    output_generator.exit_message
    choice = input_parser.input
    play(choice)
    quit(choice)
  end

  #game logic?
  def play(selection)
    if selection == "P" || selection == "PLAY"
      start_game
    end
  end

  #game logic?
  def start_game
    output_generator.basic_instructions
    secret = mastermind.generate_code
    validate_choice(secret)
  end

  # Own class?
  def validate_choice(secret)
    valid, input = nil
    while input == nil || !valid
      input = input_parser.input
      quit(input)
      if input == "C" || input == "CHEAT"
        cheat(input, secret)
      else
      valid = mastermind.guess_validator(input)
      end
    end
    evaluate(input, secret)
  end

  #game logic?
  def evaluate(input, secret)
    positions, colors = 0
    positions = mastermind.compare_positions(input.split(""), secret)
    colors = mastermind.compare_colors(input.split(""), secret)
    validate_choice(secret) if positions != 4
  end

  def instructions(selection)
    if selection == "I" || selection == "INSTRUCTIONS"
      output_generator.indepth_instructions
    end
  end

  def quit(selection)
    if selection == "Q" || selection == "QUIT"
      exit
    end
  end

  def cheat(selection, code)
    puts code.join.to_s
  end
end#class

new_game = Menu.new
new_game.run
