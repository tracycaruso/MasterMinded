# runner = Runs Commands
# mastermind.rb = Business Logic
# response.rb = Decides if game should run or not
# output_generator.rb = Stores output


# runner, printer,  mastermind: code gen, guess validator, guess evaluator


require './mastermind'

class Runner
  def run
    mastermind = Mastermind.new
    output_generator = OutputGenerator.new

    #START###########################################
    output_generator.start_message
    print ">"
    menu_selection = gets.chomp.upcase


    #PLAY############################################
    if menu_selection == "p" || "play"
      output_generator.basic_instructions
      secret = mastermind.generate_code

      response = nil
      valid_answer = false
      while valid_answer == false
        until response && response.status == :won
          print "> "
          input = gets.chomp.upcase.split("")

          if input == "CHEAT" || input == "C"
            puts mastermind.cheat(secret)
          elsif mastermind.guess_validator(input)
            mastermind.secret_evaluator(input, secret)
          else
            valid_answer = false
          end
        end

        #response = mastermind.execute(input)
        #puts response.message
      end


    #INSTRUCTIONS####################################
    elsif menu_selection == "i" || "instructions"
      output_generator.indepth_instructions

    #QUIT############################################
    elsif menu_selection == "q" || "quit"
      mastermind.quit
    else
      puts "Not sure what you wanted here"
    end


  end
end


game = Runner.new
game.run
