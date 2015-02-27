# runner = Runs Commands
# mastermind.rb = Business Logic
# response.rb = Decides if game should run or not
# output_generator.rb = Stores output


# runner, printer,  mastermind: code gen, guess validator, guess evaluator

# left to implement : Timer, Score Count, Break out of evaluation

require './mastermind'
require './menu'

class Runner
  def run
    mastermind = Mastermind.new
    output_generator = OutputGenerator.new

    #START###########################################
    secret = mastermind.generate_code
    output_generator.start_message
    print ">"
    menu_selection = gets.chomp.upcase


    #PLAY############################################

    unless menu_selection == "q" || "quit"
      if menu_selection == "p" || "play"
      output_generator.basic_instructions

      response = nil
      valid_answer = false

      while valid_answer == false
        until response && response.status == :won
          print "> "
          input = gets.chomp.upcase.split("")

          if input.join == "CHEAT" || input.join == "C"
            puts mastermind.cheat
          elsif mastermind.guess_validator(input)
            mastermind.compare_positions(input)
            mastermind.compare_colors(input)
            valid_answer = mastermind.secret_evaluator
            if valid_answer
              response.status = :won
            end

          else
            valid_answer = false
          end
        end

        # response = mastermind.execute(input)
        # puts response.messageresponse = mastermind.execute(input)
        # puts response.message
      end
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
