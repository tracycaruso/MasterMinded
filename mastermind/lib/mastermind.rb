require_relative 'response'
require_relative 'output_generator'
require_relative 'input_parser'

class Mastermind

  attr_reader :secret_code

  def initialize
    @secret_code = generate_code
  end

  #CODEGENERATOR##################################
  def generate_code
    secret = ["R", "B", "Y", "G"]
    secret.sample(4)
  end


  #EXECUTER#######################################
  def execute(input)
     if input == @secret_code.join
       Response.new(:message => "You Win!", :status => :won)
     else
       Response.new(:message => "Guess again!", :status => :continue)
     end
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

  def compare_positions(inputs)
    puts inputs
    puts @secret_code
    @positions = 0
    code = @secret_code
    match = 0
    inputs.each_with_index do |n, index|
      if code[index] == inputs[index]
        @positions +=1
      end
    end
    puts "positions : #{@positions}"
    @positions
  end


  def compare_colors(inputs)
     count = 0
     secret = @secret_code
     inputs.each do |i|
       if secret.include? i
         match = secret.find_index(i)
           secret[match] = nil
           count += 1
         end
       end
       puts "colors : #{count}"
      count
  end

  def secret_evaluator
    if @positions == 4
      puts "You must be a wizard"
      true
    else
      puts "Try again"
      false
    end
  end



  #CHEAT#############################################
  def cheat
    @secret_code.join.to_s
  end

end
